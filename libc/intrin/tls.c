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

// Keeps a second copy of the value of x28 (C73). Assembly code of other
// projects can use x28 as a register that a call keeps, so a signal can
// come while x28 holds another value. The entry of a signal handler
// then loads x28 from this copy: tpidr_el0 on Linux and XNU, which the
// kernel keeps for each thread, and the TLS slot of the libc in the TEB
// on Windows (x18 points to the TEB).
dontinstrument void __set_tls_copy(void *x28) {
  if (IsWindows()) {
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
