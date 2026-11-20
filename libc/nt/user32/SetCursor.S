#include "libc/nt/codegen.h"
.imp	user32,__imp_SetCursor,SetCursor

	.text.windows
	.ftrace1
SetCursor:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_SetCursor(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_SetCursor
	ldr	x16,[x16,#:lo12:__imp_SetCursor]
	br	x16
#endif
	ret
	.endfn	SetCursor,globl
	.previous
