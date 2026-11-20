#include "libc/nt/ntdllimport.h"
.ntimp	RtlUnlockHeap,RtlUnlockHeap

	.text.windows
	.ftrace1
RtlUnlockHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlUnlockHeap(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlUnlockHeap
	ldr	x16,[x16,#:lo12:__imp_RtlUnlockHeap]
	br	x16
#endif
	ret
	.endfn	RtlUnlockHeap,globl
	.previous
