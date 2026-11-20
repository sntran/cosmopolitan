#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryIntervalProfile,NtQueryIntervalProfile

	.text.windows
	.ftrace1
NtQueryIntervalProfile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryIntervalProfile(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryIntervalProfile
	ldr	x16,[x16,#:lo12:__imp_NtQueryIntervalProfile]
	br	x16
#endif
	.endfn	NtQueryIntervalProfile,globl
	.previous
