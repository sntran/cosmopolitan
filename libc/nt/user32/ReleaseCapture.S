#include "libc/nt/codegen.h"
.imp	user32,__imp_ReleaseCapture,ReleaseCapture

	.text.windows
	.ftrace1
ReleaseCapture:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_ReleaseCapture(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_ReleaseCapture
	ldr	x16,[x16,#:lo12:__imp_ReleaseCapture]
	br	x16
#endif
	ret
	.endfn	ReleaseCapture,globl
	.previous
