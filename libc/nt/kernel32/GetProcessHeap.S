#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessHeap,GetProcessHeap

	.text.windows
	.ftrace1
GetProcessHeap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetProcessHeap(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessHeap
	ldr	x16,[x16,#:lo12:__imp_GetProcessHeap]
	br	x16
#endif
	ret
	.endfn	GetProcessHeap,globl
	.previous
