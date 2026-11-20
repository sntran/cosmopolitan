#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryPerformanceCounter,NtQueryPerformanceCounter

	.text.windows
	.ftrace1
NtQueryPerformanceCounter:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryPerformanceCounter(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryPerformanceCounter
	ldr	x16,[x16,#:lo12:__imp_NtQueryPerformanceCounter]
	br	x16
#endif
	.endfn	NtQueryPerformanceCounter,globl
	.previous
