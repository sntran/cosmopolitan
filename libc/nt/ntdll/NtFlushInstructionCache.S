#include "libc/nt/ntdllimport.h"
.ntimp	NtFlushInstructionCache,NtFlushInstructionCache

	.text.windows
	.ftrace1
NtFlushInstructionCache:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtFlushInstructionCache(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtFlushInstructionCache
	ldr	x16,[x16,#:lo12:__imp_NtFlushInstructionCache]
	br	x16
#endif
	.endfn	NtFlushInstructionCache,globl
	.previous
