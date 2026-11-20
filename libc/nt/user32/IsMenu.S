#include "libc/nt/codegen.h"
.imp	user32,__imp_IsMenu,IsMenu

	.text.windows
	.ftrace1
IsMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_IsMenu(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_IsMenu
	ldr	x16,[x16,#:lo12:__imp_IsMenu]
	br	x16
#endif
	ret
	.endfn	IsMenu,globl
	.previous
