#include "libc/nt/codegen.h"
.imp	user32,__imp_GetMenu,GetMenu

	.text.windows
	.ftrace1
GetMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetMenu(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetMenu
	ldr	x16,[x16,#:lo12:__imp_GetMenu]
	br	x16
#endif
	ret
	.endfn	GetMenu,globl
	.previous
