#include "libc/nt/ntdllimport.h"
.ntimp	RtlLockHeap,RtlLockHeap

	.text.windows
	.ftrace1
RtlLockHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlLockHeap(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlLockHeap
	ldr	x16,[x16,#:lo12:__imp_RtlLockHeap]
	br	x16
#endif
	ret
	.endfn	RtlLockHeap,globl
	.previous
