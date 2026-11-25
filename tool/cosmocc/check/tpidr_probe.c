// Debug probe of C73 on XNU: what tpidr_el0 holds.
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static long Tp(void) {
#ifdef __aarch64__
  long v;
  asm volatile("mrs\t%0,tpidr_el0\n\thint\t#0x7f" : "=r"(v));
  return v;
#else
  return 0;
#endif
}
static long X28(void) {
#ifdef __aarch64__
  register long v asm("x28");
  asm volatile("" : "=r"(v));
  return v;
#else
  return 0;
#endif
}
static void Show(const char *where) {
  printf("%-24s x28=%016lx tpidr_el0=%016lx %s\n", where, X28(), Tp(),
         X28() == Tp() ? "same" : "DIFFERENT");
}
static volatile long h_tp, h_x28;
static void OnUsr(int sig) {
  h_tp = Tp();
  h_x28 = X28();
}
static void *Thread(void *a) {
  Show("thread start");
  for (int i = 0; i < 50; ++i) usleep(2000);
  Show("thread after sleeps");
  return 0;
}
int main(int argc, char **argv) {
  setvbuf(stdout, 0, _IONBF, 0);
  Show("main");
  for (int i = 0; i < 50; ++i) usleep(2000);
  Show("main after sleeps");
  pthread_t th;
  pthread_create(&th, 0, Thread, 0);
  pthread_join(th, 0);
  Show("main after join");
  if (argc > 1 && !strcmp(argv[1], "signal")) {
    struct sigaction sa = {.sa_handler = OnUsr};
    sigaction(SIGUSR1, &sa, 0);
    printf("raise...\n");
    raise(SIGUSR1);
    printf("handler: x28=%016lx tpidr_el0=%016lx\n", h_x28, h_tp);
  }
  return 0;
}
