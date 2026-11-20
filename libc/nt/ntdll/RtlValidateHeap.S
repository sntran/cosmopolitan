#include "libc/nt/ntdllimport.h"
.ntimp	RtlValidateHeap,RtlValidateHeap

	.text.windows
	.ftrace1
RtlValidateHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlValidateHeap(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlValidateHeap
	ldr	x16,[x16,#:lo12:__imp_RtlValidateHeap]
	br	x16
#endif
	.endfn	RtlValidateHeap,globl
	.previous
