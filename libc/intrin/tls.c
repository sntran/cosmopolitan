/*-*- mode:c;indent-tabs-mode:nil;c-basic-offset:2;tab-width:8;coding:utf-8 -*-│
│ vi: set et ft=c ts=2 sts=2 sw=2 fenc=utf-8                               :vi │
╞══════════════════════════════════════════════════════════════════════════════╡
│ Copyright 2024 Justine Alexandra Roberts Tunney                              │
│                                                                              │
│ Permission to use, copy, modify, and/or distribute this software for         │
│ any purpose with or without fee is hereby granted, provided that the         │
│ above copyright notice and this permission notice appear in all copies.      │
│                                                                              │
│ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL                │
│ WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED                │
│ WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE             │
│ AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL         │
│ DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR        │
│ PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER               │
│ TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR             │
│ PERFORMANCE OF THIS SOFTWARE.                                                │
╚─────────────────────────────────────────────────────────────────────────────*/
#include "libc/thread/tls.h"
#include "libc/dce.h"
#include "libc/runtime/syslib.internal.h"

/**
 * Returns location of thread information block.
 *
 * This should be favored over __get_tls() for .privileged code that
 * can't be self-modified by __enable_tls().
 */
privileged optimizespeed struct CosmoTib *__get_tls_privileged(void) {
#if defined(__x86_64__)
  char *tib, *lin = (char *)0x30;
  if (IsNetbsd() || IsOpenbsd()) {
    asm("mov\t%%fs:(%1),%0" : "=a"(tib) : "r"(lin) : "memory");
  } else {
    asm("mov\t%%gs:(%1),%0" : "=a"(tib) : "r"(lin) : "memory");
    if (IsWindows())
      tib = *(char **)(tib + 0x1480 + __tls_index * 8);
  }
  return (struct CosmoTib *)tib;
#elif defined(__aarch64__)
  return __get_tls();
#endif
}

#if defined(__x86_64__)
privileged optimizespeed struct CosmoTib *__get_tls_win32(void) {
  char *tib, *lin = (char *)0x30;
  asm("mov\t%%gs:(%1),%0" : "=a"(tib) : "r"(lin) : "memory");
  tib = *(char **)(tib + 0x1480 + __tls_index * 8);
  return (struct CosmoTib *)tib;
}
privileged void __set_tls_win32(void *tls) {
  asm("mov\t%1,%%gs:%0" : "=m"(*((long *)0x1480 + __tls_index)) : "r"(tls));
}
#elif defined(__aarch64__)
// On ARM64, the register x28 holds the thread pointer on each system.
// Windows does not use x28, and the compiler keeps it (-ffixed-x28).
struct CosmoTib *__get_tls_win32(void) {
  return __get_tls();
}
void __set_tls_win32(void *tls) {
  register long x28 asm("x28") = (long)__adj_tls(tls);
  asm volatile("" : "+r"(x28));
  __set_tls_copy(__adj_tls(tls));
}

// XNU: the libSystem key of the copy of x28, or -1.
long __tls_copy_key = -1;
static int (*__tls_copy_setspecific)(unsigned long, const void *);

// Keeps a second copy of the value of x28 (C73). Assembly code of other
// projects can use x28 as a register that a call keeps, so a signal can
// come while x28 holds another value. The entry of a signal handler
// then loads x28 from this copy:
//
//   - Linux: tpidr_el0, which the kernel keeps for each thread.
//   - XNU: a key of pthread_setspecific() of libSystem. The handler
//     reads the TSD array of the thread from tpidrro_el0. XNU puts the
//     number of the CPU in tpidr_el0, so the libc does not write it.
//   - Windows: the TLS slot of the libc in the TEB (x18 points to it).
dontinstrument void __set_tls_copy(void *x28) {
  if (IsXnu()) {
    if (__tls_copy_key < 0) {
      // __syslib is 0 at the first call of __set_tls() at start
      if (!__syslib || __syslib->__version < 6)
        return;
      void *rtld_default = (void *)-2;
      int (*create)(unsigned long *, void (*)(void *));
      int (*set)(unsigned long, const void *);
      unsigned long key;
      create = __syslib->__dlsym(rtld_default, "pthread_key_create");
      set = __syslib->__dlsym(rtld_default, "pthread_setspecific");
      if (!create || !set || create(&key, 0))
        return;
      __tls_copy_setspecific = set;
      __tls_copy_key = key;
    }
    __tls_copy_setspecific(__tls_copy_key, x28);
  } else if (IsWindows()) {
    // the slot exists only after TlsAlloc(), and the teb has 64 slots
    if (!__tls_index_ready || __tls_index >= 64)
      return;
    char *teb;
    asm("mov\t%0,x18" : "=r"(teb));
    ((void **)(teb + 0x1480))[__tls_index] = x28;
  } else {
    asm volatile("msr\ttpidr_el0,%0" : /* no outputs */ : "r"(x28));
  }
}

// Returns the second copy of the value of x28 on Windows, or 0.
dontinstrument void *__get_tls_copy_win32(void) {
  if (!__tls_index_ready || __tls_index >= 64)
    return 0;
  char *teb;
  asm("mov\t%0,x18" : "=r"(teb));
  return ((void **)(teb + 0x1480))[__tls_index];
}
#endif
