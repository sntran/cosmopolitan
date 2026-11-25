/*-*- mode:c;indent-tabs-mode:nil;c-basic-offset:2;tab-width:8;coding:utf-8 -*-│
│ vi: set et ft=c ts=2 sts=2 sw=2 fenc=utf-8                               :vi │
╞══════════════════════════════════════════════════════════════════════════════╡
│ Copyright 2022 Justine Alexandra Roberts Tunney                              │
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
#include "ape/sections.internal.h"
#include "libc/calls/calls.h"
#include "libc/calls/internal.h"
#include "libc/calls/state.internal.h"
#include "libc/calls/struct/sigaction.h"
#include "libc/calls/struct/siginfo.h"
#include "libc/calls/ucontext.h"
#include "libc/intrin/likely.h"
#include "libc/log/libfatal.internal.h"
#include "libc/math.h"
#include "libc/str/str.h"
#include "libc/sysv/consts/sa.h"
#include "libc/thread/tls.h"

#ifdef __x86_64__

privileged void __sigenter_wsl(int sig, siginfo_t *info, ucontext_t *ctx) {
  int rva, flags;
  rva = __sighandrvas[sig];
  if (rva >= kSigactionMinRva) {
    flags = __sighandflags[sig];
    // WSL1 doesn't set the fpregs field.
    // https://github.com/microsoft/WSL/issues/2555
    if ((flags & SA_SIGINFO) && UNLIKELY(!ctx->uc_mcontext.fpregs)) {
      ctx->uc_mcontext.fpregs = &ctx->__fpustate;
    }
    ((sigaction_f)(__executable_start + rva))(sig, info, ctx);
  }
}

#endif /* __x86_64__ */

#ifdef __aarch64__

// The entry of a signal handler on aarch64 (C73).
//
// The libc keeps the thread pointer in x28. Assembly code of other
// projects (for example OpenSSL) uses x28 as a register that a call
// keeps, so x28 can hold any value when a signal comes. Linux and XNU
// start the handler with the x28 of the interrupted code. These entries
// load x28 from the second copy of the thread pointer (see
// __set_tls_copy) before they call the code of the libc: tpidr_el0 on
// Linux, and the TSD slot __tls_copy_key of libSystem on XNU. The
// kernel puts back the x28 of the interrupted code at the return.
//
// The tool fixupobj changes each mrs of tpidr_el0 into a mov from x28,
// except an mrs that `hint #0x7f` follows.
//
// The copy is used only when it points to a thread block: the first
// field of a thread block (tib_self) is the address of the block, and
// x28 points to the end of the block (1024 bytes). Code of other
// projects that changes tpidr_el0 (the C library of the system after
// cosmo_dlopen) thus does not give a wrong x28. A value below 64 KiB is
// never read.
//
// The section of these entries has no SHF_EXECINSTR flag, so the old
// fixupobj of the bootstrap toolchain, which builds this libc, does not
// change the mrs in this object. The linker script puts .privileged.* in
// the code, and the fixupobj of this release then keeps the mrs.
asm(".section .privileged.tlscopy,\"a\",@progbits\n"
    // x28 = x9 when x9 points to the end of a thread block
    ".macro tls_from_x9\n"
    "\tcmp\tx9,#0x10,lsl #12\n"
    "\tb.lo\t1f\n"
    "\tsub\tx10,x9,#1024\n"
    "\tldr\tx11,[x10]\n"
    "\tcmp\tx11,x10\n"
    "\tb.ne\t1f\n"
    "\tmov\tx28,x9\n"
    "1:\n"
    ".endm\n"
    // The handler of each signal on Linux.
    ".globl\t__sigenter_linux_arm64\n"
    ".hidden\t__sigenter_linux_arm64\n"
    ".type\t__sigenter_linux_arm64,@function\n"
    "__sigenter_linux_arm64:\n"
    "\tmrs\tx9,tpidr_el0\n"
    "\thint\t#0x7f\n"  // fixupobj keeps this mrs
    "\ttls_from_x9\n"
    "\tb\t__sigenter_linux\n"
    ".size\t__sigenter_linux_arm64,.-__sigenter_linux_arm64\n"
    // The handler of each signal on XNU.
    ".globl\t__sigenter_xnu_arm64\n"
    ".hidden\t__sigenter_xnu_arm64\n"
    ".type\t__sigenter_xnu_arm64,@function\n"
    "__sigenter_xnu_arm64:\n"
    "\tadrp\tx9,__tls_copy_key\n"
    "\tldr\tx9,[x9,#:lo12:__tls_copy_key]\n"
    "\ttbnz\tx9,#63,2f\n"  // no key yet
    "\tmrs\tx10,tpidrro_el0\n"
    "\tand\tx10,x10,#-8\n"  // the low bits can hold the cpu
    "\tldr\tx9,[x10,x9,lsl #3]\n"
    "\ttls_from_x9\n"
    "2:\n"
    "\tb\t__sigenter_xnu\n"
    ".size\t__sigenter_xnu_arm64,.-__sigenter_xnu_arm64\n"
    ".purgem\ttls_from_x9\n"
    ".previous");

_Static_assert(sizeof(struct CosmoTib) == 1024,
               "update tls_from_x9 of __sigenter_linux_arm64");

// Calls the handler of the signal. __sigenter_linux_arm64 first gives
// x28 the thread pointer (C73).
privileged void __sigenter_linux(int sig, siginfo_t *info, ucontext_t *ctx) {
  int rva = __sighandrvas[sig];
  if (rva >= kSigactionMinRva)
    ((sigaction_f)(__executable_start + rva))(sig, info, ctx);
}

#endif /* __aarch64__ */
