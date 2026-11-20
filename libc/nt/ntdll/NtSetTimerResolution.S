#include "libc/nt/ntdllimport.h"
.ntimp	NtSetTimerResolution,NtSetTimerResolution

	.text.windows
	.ftrace1
NtSetTimerResolution:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSetTimerResolution(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSetTimerResolution
	ldr	x16,[x16,#:lo12:__imp_NtSetTimerResolution]
	br	x16
#endif
	.endfn	NtSetTimerResolution,globl
	.previous
