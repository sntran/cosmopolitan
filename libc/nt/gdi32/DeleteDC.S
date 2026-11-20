#include "libc/nt/codegen.h"
.imp	gdi32,__imp_DeleteDC,DeleteDC

	.text.windows
	.ftrace1
DeleteDC:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_DeleteDC(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_DeleteDC
	ldr	x16,[x16,#:lo12:__imp_DeleteDC]
	br	x16
#endif
	ret
	.endfn	DeleteDC,globl
	.previous
