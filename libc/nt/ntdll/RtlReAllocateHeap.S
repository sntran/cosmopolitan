#include "libc/nt/ntdllimport.h"
.ntimp	RtlReAllocateHeap,RtlReAllocateHeap

	.text.windows
	.ftrace1
RtlReAllocateHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlReAllocateHeap(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlReAllocateHeap
	ldr	x16,[x16,#:lo12:__imp_RtlReAllocateHeap]
	br	x16
#endif
	.endfn	RtlReAllocateHeap,globl
	.previous
