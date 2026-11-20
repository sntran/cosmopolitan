#include "libc/nt/codegen.h"
.imp	gdi32,__imp_DeleteObject,DeleteObject

	.text.windows
	.ftrace1
DeleteObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_DeleteObject(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_DeleteObject
	ldr	x16,[x16,#:lo12:__imp_DeleteObject]
	br	x16
#endif
	ret
	.endfn	DeleteObject,globl
	.previous
