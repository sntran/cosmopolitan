#include "libc/nt/ntdllimport.h"
.ntimp	RtlGetProcessHeaps,RtlGetProcessHeaps

	.text.windows
	.ftrace1
RtlGetProcessHeaps:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlGetProcessHeaps(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlGetProcessHeaps
	ldr	x16,[x16,#:lo12:__imp_RtlGetProcessHeaps]
	br	x16
#endif
	.endfn	RtlGetProcessHeaps,globl
	.previous
