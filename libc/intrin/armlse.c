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
#include "libc/dce.h"
#include "libc/intrin/getauxval.h"
#include "libc/nt/thunk/msabi.h"
#include "libc/runtime/runtime.h"
#include "libc/sysv/consts/auxv.h"
#include "libc/sysv/consts/hwcap.h"
#ifdef __aarch64__

// windows gives no auxiliary vector. the feature 34 of windows is
// PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE. the start code fills the
// import slot before the constructors run
#define kNtPfArmV81AtomicInstructionsAvailable 34
__msabi extern bool32 (*const __imp_IsProcessorFeaturePresent)(uint32_t);

bool __aarch64_have_lse_atomics;

static __attribute__((__constructor__(1))) void __aarch64_atomics_init(void) {
  if (IsWindows()) {
    __aarch64_have_lse_atomics =
        __imp_IsProcessorFeaturePresent &&
        __imp_IsProcessorFeaturePresent(kNtPfArmV81AtomicInstructionsAvailable);
    return;
  }
  struct AuxiliaryValue x = __getauxval(AT_HWCAP);
  __aarch64_have_lse_atomics = !!(x.value & HWCAP_ATOMICS);
}

#endif /* __aarch64__ */
