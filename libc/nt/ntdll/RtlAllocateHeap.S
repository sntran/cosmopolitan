#include "libc/nt/ntdllimport.h"
.ntimp	RtlAllocateHeap,RtlAllocateHeap

	.text.windows
	.ftrace1
RtlAllocateHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlAllocateHeap(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlAllocateHeap
	ldr	x16,[x16,#:lo12:__imp_RtlAllocateHeap]
	br	x16
#endif
	.endfn	RtlAllocateHeap,globl
	.previous
