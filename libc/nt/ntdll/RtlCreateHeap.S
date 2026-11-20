#include "libc/nt/ntdllimport.h"
.ntimp	RtlCreateHeap,RtlCreateHeap

	.text.windows
	.ftrace1
RtlCreateHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlCreateHeap(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlCreateHeap
	ldr	x16,[x16,#:lo12:__imp_RtlCreateHeap]
	br	x16
#endif
	.endfn	RtlCreateHeap,globl
	.previous
