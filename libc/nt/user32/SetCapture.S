#include "libc/nt/codegen.h"
.imp	user32,__imp_SetCapture,SetCapture

	.text.windows
	.ftrace1
SetCapture:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_SetCapture(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_SetCapture
	ldr	x16,[x16,#:lo12:__imp_SetCapture]
	br	x16
#endif
	ret
	.endfn	SetCapture,globl
	.previous
