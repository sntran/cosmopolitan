// Checks of the fixes of PATCHES.md that a C program can see. Each check
// prints one line, and the exit status is the number of the checks that
// fail. A check that does not apply to the system prints SKIP.
//
//   cosmocc -mcosmo -Os -o fixes.com tool/cosmocc/check/fixes.c
//   ./fixes.com
#include <cosmo.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <poll.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>
#include "libc/calls/pledge.h"
#include "libc/dce.h"

static int failures;

static void Check(const char *what, int ok) {
  printf("%s: %s\n", ok ? "PASS" : "FAIL", what);
  failures += !ok;
}

static void Skip(const char *what, const char *why) {
  printf("SKIP: %s (%s)\n", what, why);
}

static long Millis(void) {
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);
  return ts.tv_sec * 1000L + ts.tv_nsec / 1000000;
}

static long CpuMillis(void) {
  struct rusage ru;
  getrusage(RUSAGE_SELF, &ru);
  return (ru.ru_utime.tv_sec + ru.ru_stime.tv_sec) * 1000L +
         (ru.ru_utime.tv_usec + ru.ru_stime.tv_usec) / 1000;
}

static struct sockaddr_in Loopback(void) {
  struct sockaddr_in sa = {0};
  sa.sin_family = AF_INET;
  sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
  return sa;
}

// A UDP socket on the loopback address, with a port of the system.
static int UdpSocket(struct sockaddr_in *sa) {
  socklen_t n = sizeof(*sa);
  int fd = socket(AF_INET, SOCK_DGRAM, 0);
  *sa = Loopback();
  if (fd == -1 || bind(fd, (void *)sa, sizeof(*sa)) || getsockname(fd, (void *)sa, &n)) {
    if (fd != -1) close(fd);
    return -1;
  }
  return fd;
}

// A connected pair of TCP sockets on the loopback address.
static int TcpPair(int fds[2]) {
  struct sockaddr_in sa = Loopback();
  socklen_t n = sizeof(sa);
  int l = socket(AF_INET, SOCK_STREAM, 0);
  fds[0] = fds[1] = -1;
  if (l == -1 || bind(l, (void *)&sa, sizeof(sa)) || listen(l, 1) ||
      getsockname(l, (void *)&sa, &n))
    goto fail;
  fds[0] = socket(AF_INET, SOCK_STREAM, 0);
  if (fds[0] == -1 || connect(fds[0], (void *)&sa, sizeof(sa))) goto fail;
  fds[1] = accept(l, 0, 0);
  if (fds[1] == -1) goto fail;
  close(l);
  return 0;
fail:
  if (l != -1) close(l);
  if (fds[0] != -1) close(fds[0]);
  return -1;
}

// The count of the sockets for the checks of many fds: 150, or less when
// the limit of the fds is low.
static int ManyCount(void) {
  struct rlimit rl;
  int n = 150;
  if (!getrlimit(RLIMIT_NOFILE, &rl) && rl.rlim_cur != RLIM_INFINITY &&
      rl.rlim_cur < (rlim_t)n + 32)
    n = rl.rlim_cur > 64 ? rl.rlim_cur - 32 : 32;
  return n;
}

// C61: select() of more than 128 fds. Windows gave E2BIG.
static void CheckSelectMany(void) {
  int n = ManyCount(), fds[150], made = 0, maxfd = -1, rc = -1, ok = 0;
  struct sockaddr_in last;
  if (n <= 128) {
    Skip("C61 select() of more than 128 fds", "the limit of the fds is low");
    return;
  }
  for (; made < n; ++made) {
    if ((fds[made] = UdpSocket(&last)) == -1) break;
    if (fds[made] > maxfd) maxfd = fds[made];
  }
  if (made == n && maxfd < FD_SETSIZE) {
    int s = socket(AF_INET, SOCK_DGRAM, 0);
    sendto(s, "x", 1, 0, (void *)&last, sizeof(last));
    struct timeval tv = {2, 0};
    fd_set rd;
    FD_ZERO(&rd);
    for (int i = 0; i < n; ++i) FD_SET(fds[i], &rd);
    rc = select(maxfd + 1, &rd, 0, 0, &tv);
    ok = rc == 1 && FD_ISSET(fds[n - 1], &rd);
    close(s);
  }
  printf("  %d sockets, the highest fd %d, select() gives %d (%s)\n", made, maxfd, rc,
         rc == -1 ? strerror(errno) : "no error");
  Check("C61 select() of more than 128 fds finds the one datagram", ok);
  while (made--) close(fds[made]);
}

// C62: poll() of 64 fds or more waits. Windows ended the wait at once and
// used a whole CPU until the timeout.
static void CheckPollWait(void) {
  int n = 70, fds[70], made = 0;
  struct pollfd pfd[70];
  struct sockaddr_in sa;
  for (; made < n; ++made) {
    if ((fds[made] = UdpSocket(&sa)) == -1) break;
    pfd[made].fd = fds[made];
    pfd[made].events = POLLIN;
    pfd[made].revents = 0;
  }
  long t0 = Millis(), c0 = CpuMillis();
  int rc = made == n ? poll(pfd, n, 500) : -1;
  long ms = Millis() - t0, cpu = CpuMillis() - c0;
  printf("  poll() of %d sockets for 500 ms: result %d, %ld ms, %ld ms of CPU\n", made, rc, ms,
         cpu);
  Check("C62 poll() of 70 sockets waits 500 ms with little CPU",
        rc == 0 && ms >= 400 && cpu < 250);
  while (made--) close(fds[made]);
}

// C63: an error or a hangup of a socket shows in writefds, when only
// writefds asks for the socket. Windows gave it only in readfds.
static void CheckSelectReset(void) {
  int p[2], rc = -1;
  if (TcpPair(p)) {
    Check("C63 a reset shows in writefds (no TCP pair)", 0);
    return;
  }
  struct linger lg = {1, 0};
  setsockopt(p[1], SOL_SOCKET, SO_LINGER, &lg, sizeof(lg));
  close(p[1]);  // a reset to p[0]
  usleep(100000);
  fd_set wr, rd;
  FD_ZERO(&wr);
  FD_ZERO(&rd);
  FD_SET(p[0], &wr);
  struct timeval tv = {2, 0};
  rc = select(p[0] + 1, &rd, &wr, 0, &tv);
  int in_wr = rc > 0 && FD_ISSET(p[0], &wr), in_rd = rc > 0 && FD_ISSET(p[0], &rd);
  printf("  select() gives %d, writefds %d, readfds %d\n", rc, in_wr, in_rd);
  Check("C63 a reset shows in writefds, and not in readfds that did not ask",
        rc == 1 && in_wr && !in_rd);
  close(p[0]);
}

// C68: rmdir() of a directory with a file fails at once. Windows waited
// about 2 s before it failed.
static void CheckRmdir(void) {
  char dir[64], file[80];
  snprintf(dir, sizeof(dir), "fixes-rmdir.%d", getpid());
  snprintf(file, sizeof(file), "%s/file", dir);
  int ok = !mkdir(dir, 0755);
  int fd = ok ? open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644) : -1;
  ok = ok && fd != -1 && write(fd, "x", 1) == 1 && !close(fd);
  long t0 = Millis();
  int rc = ok ? rmdir(dir) : 0, err = errno;
  long ms = Millis() - t0;
  printf("  rmdir() of a directory with a file: %d (%s) in %ld ms\n", rc, strerror(err), ms);
  int done = !unlink(file) && !rmdir(dir);
  Check("C68 rmdir() of a directory with a file gives ENOTEMPTY in less than 500 ms",
        ok && rc == -1 && (err == ENOTEMPTY || err == EEXIST) && ms < 500 && done);
}

// The result of a child: its exit status, or -1.
static int Child(int (*f)(void)) {
  int ws;
  pid_t pid = fork();
  if (!pid) _Exit(f());
  if (pid == -1 || waitpid(pid, &ws, 0) != pid || !WIFEXITED(ws)) return -1;
  return WEXITSTATUS(ws);
}

// C47, in a child: 0 when pledge("inet") allows the buffer options and
// still refuses TCP_CONGESTION, 1 when it does not, 2 with no pledge().
static int PledgeChild(void) {
  int fd = socket(AF_INET, SOCK_STREAM, 0), v = 0, ok = fd != -1;
  socklen_t n = sizeof(v);
  struct linger lg = {0, 0};
  socklen_t ln = sizeof(lg);
  char cc[32];
  socklen_t ccn = sizeof(cc);
  __pledge_mode = PLEDGE_PENALTY_RETURN_EPERM;
  if (pledge("stdio inet", 0)) return 2;
  ok = ok && !getsockopt(fd, SOL_SOCKET, SO_SNDBUF, &v, &n);
  ok = ok && !setsockopt(fd, SOL_SOCKET, SO_SNDBUF, &v, sizeof(v));
  ok = ok && !getsockopt(fd, SOL_SOCKET, SO_RCVBUF, &v, &n);
  ok = ok && !setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &v, sizeof(v));
  ok = ok && !getsockopt(fd, SOL_SOCKET, SO_LINGER, &lg, &ln);
  ok = ok && !setsockopt(fd, SOL_SOCKET, SO_LINGER, &lg, sizeof(lg));
  ok = ok && !getsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &v, &n);
  ok = ok && getsockopt(fd, IPPROTO_TCP, TCP_CONGESTION, cc, &ccn) == -1 && errno == EPERM;
  return !ok;
}

static void CheckPledge(void) {
  if (!IsLinux()) {
    Skip("C47 pledge(\"inet\") allows the buffer options of a socket", "Linux only");
    return;
  }
  int rc = Child(PledgeChild);
  if (rc == 2) {
    Skip("C47 pledge(\"inet\") allows the buffer options of a socket", "no pledge()");
    return;
  }
  Check("C47 pledge(\"inet\") allows the buffer options of a socket, and not TCP_CONGESTION",
        rc == 0);
}

// C50, in a child: 0 when unveil() controls the removal of files, 1 when
// it does not, 2 with no unveil().
static char g_inside[512], g_outside[512];
static int UnveilChild(void) {
  char a[600], b[600];
  snprintf(a, sizeof(a), "%s/file", g_inside);
  snprintf(b, sizeof(b), "%s/file", g_outside);
  if (unveil(g_inside, "rwc") || unveil(0, 0)) return 2;
  int out = unlink(b), out_err = errno;
  int in = unlink(a);
  return !(out == -1 && out_err == EACCES && in == 0);
}

static void Touch(const char *dir) {
  char f[600];
  snprintf(f, sizeof(f), "%s/file", dir);
  mkdir(dir, 0755);
  close(open(f, O_WRONLY | O_CREAT | O_TRUNC, 0644));
}

static void Remove(const char *dir) {
  char f[600];
  snprintf(f, sizeof(f), "%s/file", dir);
  unlink(f);
  rmdir(dir);
}

static void CheckUnveil(void) {
  if (!IsLinux()) {
    Skip("C50 unveil() controls the removal of files", "Linux only");
    return;
  }
  char cwd[400];
  if (!getcwd(cwd, sizeof(cwd))) cwd[0] = 0;
  snprintf(g_inside, sizeof(g_inside), "%s/fixes-in.%d", cwd, getpid());
  snprintf(g_outside, sizeof(g_outside), "%s/fixes-out.%d", cwd, getpid());
  Touch(g_inside);
  Touch(g_outside);
  int rc = cwd[0] ? Child(UnveilChild) : 2;
  Remove(g_inside);
  Remove(g_outside);
  if (rc == 2) {
    Skip("C50 unveil() controls the removal of files", "no Landlock");
    return;
  }
  Check("C50 unveil() refuses unlink() outside its paths, and allows it with \"c\"", rc == 0);
}

// C69, in a child: 0 when a wait with a deadline that passed ends at
// once with ETIMEDOUT. On macOS, the wait did not end: the relative
// timeout was 0, and ulock_wait() waits forever for a timeout of 0. The
// alarm ends a child that waits.
static struct timespec Past(clockid_t clock) {
  struct timespec ts;
  clock_gettime(clock, &ts);
  ts.tv_sec -= 1;
  return ts;
}

static int DeadlineChild(void) {
  static atomic_int w;
  static pthread_mutex_t mu = PTHREAD_MUTEX_INITIALIZER;
  static pthread_cond_t cv = PTHREAD_COND_INITIALIZER;
  alarm(5);
  struct timespec at = Past(CLOCK_MONOTONIC);
  if (cosmo_futex_wait(&w, 0, PTHREAD_PROCESS_PRIVATE, CLOCK_MONOTONIC, &at) != -ETIMEDOUT)
    return 1;
  at = Past(CLOCK_REALTIME);
  pthread_mutex_lock(&mu);
  int rc = pthread_cond_timedwait(&cv, &mu, &at);
  pthread_mutex_unlock(&mu);
  return rc == ETIMEDOUT ? 0 : 2;
}

static void CheckDeadline(void) {
  long t0 = Millis();
  int rc = Child(DeadlineChild);
  long ms = Millis() - t0;
  printf("  a futex wait and pthread_cond_timedwait() 1 s after the deadline: %d in %ld ms\n", rc, ms);
  Check("C69 a wait with a deadline that passed gives ETIMEDOUT at once", rc == 0 && ms < 2000);
}

// C71, in a child: 0 when two threads that wait on a condition variable,
// one with a deadline and one with no deadline, live through 20 signal
// handlers each. On NetBSD, these waits of nsync use the semaphores of
// the kernel: a handler gave EINTR, and an assert of nsync stopped the
// process. The alarm ends a child that waits.
static pthread_mutex_t g_mu = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t g_cv = PTHREAD_COND_INITIALIZER;
static atomic_int g_handled, g_done;

static void OnUsr1(int sig) {
  (void)sig;
  ++g_handled;
}

static void *TimedWaiter(void *arg) {
  struct timespec at;
  (void)arg;
  clock_gettime(CLOCK_REALTIME, &at);
  at.tv_sec += 2;
  pthread_mutex_lock(&g_mu);
  int rc = 0;
  while (!g_done && rc != ETIMEDOUT)
    rc = pthread_cond_timedwait(&g_cv, &g_mu, &at);
  pthread_mutex_unlock(&g_mu);
  return (void *)(intptr_t)(rc == 0 || rc == ETIMEDOUT);
}

static void *Waiter(void *arg) {
  (void)arg;
  pthread_mutex_lock(&g_mu);
  while (!g_done)
    pthread_cond_wait(&g_cv, &g_mu);
  pthread_mutex_unlock(&g_mu);
  return (void *)1;
}

static int SignalChild(void) {
  struct sigaction sa = {.sa_handler = OnUsr1};
  pthread_t t[2];
  void *ok[2];
  alarm(10);
  sigemptyset(&sa.sa_mask);
  sigaction(SIGUSR1, &sa, 0);
  pthread_create(&t[0], 0, TimedWaiter, 0);
  pthread_create(&t[1], 0, Waiter, 0);
  usleep(100000);
  for (int i = 0; i < 20; i++) {
    pthread_kill(t[0], SIGUSR1);
    pthread_kill(t[1], SIGUSR1);
    usleep(10000);
  }
  pthread_mutex_lock(&g_mu);
  g_done = 1;
  pthread_cond_broadcast(&g_cv);
  pthread_mutex_unlock(&g_mu);
  pthread_join(t[0], &ok[0]);
  pthread_join(t[1], &ok[1]);
  return ok[0] && ok[1] && g_handled > 0 ? 0 : 1;
}

static void CheckSignalWait(void) {
  long t0 = Millis();
  int rc = Child(SignalChild);
  long ms = Millis() - t0;
  printf("  two waits on a condition variable, 20 signal handlers each: %d in %ld ms\n", rc, ms);
  Check("C71 a signal handler does not stop a wait on a condition variable", rc == 0);
}

// C72, in a child: 0 when siglongjmp() to a sigsetjmp() that saved the
// signal mask keeps the registers of the caller, 1 when a register is
// wrong, 2 when the mask did not come back. On aarch64, sigsetjmp() kept
// x19 of the caller in the slot of the mask, and siglongjmp() gave the
// caller the mask in x19.
static sigjmp_buf c72_jb;

static __attribute__((__noinline__)) void Jump72(void) {
  siglongjmp(c72_jb, 1);
}

static long Mix72(long a, long b, long c, long d, long e, long f) {
  return a ^ b * 3 ^ c * 5 ^ d * 7 ^ e * 11 ^ f * 13;
}

// The six values stay in registers that a call keeps.
static __attribute__((__noinline__)) long Keep72(long v) {
  long a = v + 1, b = v * 3, c = v + 5, d = v * 7, e = v + 11, f = v * 13;
  if (!sigsetjmp(c72_jb, 1)) {
    sigset_t s;
    sigemptyset(&s);
    sigaddset(&s, SIGUSR2);
    sigprocmask(SIG_UNBLOCK, &s, 0);
    Jump72();
  }
  return Mix72(a, b, c, d, e, f);
}

static int JumpChild(void) {
  sigset_t s, now;
  long v = (long)getpid() + 1000;
  sigemptyset(&s);
  sigaddset(&s, SIGUSR2);
  sigprocmask(SIG_BLOCK, &s, 0);
  if (Keep72(v) != Mix72(v + 1, v * 3, v + 5, v * 7, v + 11, v * 13)) return 1;
  sigprocmask(SIG_BLOCK, 0, &now);
  return sigismember(&now, SIGUSR2) ? 0 : 2;
}

static void CheckJump(void) {
  int rc = Child(JumpChild);
  printf("  siglongjmp() to a sigsetjmp() that saved the mask: %d\n", rc);
  Check("C72 siglongjmp() keeps the registers of the caller and the mask", rc == 0);
}

int main(void) {
  setvbuf(stdout, 0, _IONBF, 0);
  CheckSelectMany();
  CheckPollWait();
  CheckSelectReset();
  CheckRmdir();
  CheckPledge();
  CheckUnveil();
  CheckDeadline();
  CheckSignalWait();
  CheckJump();
  printf("%s\n", failures ? "some checks failed" : "all checks passed");
  return failures;
}
