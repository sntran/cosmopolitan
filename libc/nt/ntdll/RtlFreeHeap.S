#include "libc/nt/ntdllimport.h"
.ntimp	RtlFreeHeap,RtlFreeHeap

	.text.windows
	.ftrace1
RtlFreeHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlFreeHeap(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlFreeHeap
	ldr	x16,[x16,#:lo12:__imp_RtlFreeHeap]
	br	x16
#endif
	.endfn	RtlFreeHeap,globl
	.previous
