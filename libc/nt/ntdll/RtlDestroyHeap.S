#include "libc/nt/ntdllimport.h"
.ntimp	RtlDestroyHeap,RtlDestroyHeap

	.text.windows
	.ftrace1
RtlDestroyHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlDestroyHeap(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlDestroyHeap
	ldr	x16,[x16,#:lo12:__imp_RtlDestroyHeap]
	br	x16
#endif
	ret
	.endfn	RtlDestroyHeap,globl
	.previous
