#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryTimerResolution,NtQueryTimerResolution

	.text.windows
	.ftrace1
NtQueryTimerResolution:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryTimerResolution(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryTimerResolution
	ldr	x16,[x16,#:lo12:__imp_NtQueryTimerResolution]
	br	x16
#endif
	.endfn	NtQueryTimerResolution,globl
	.previous
