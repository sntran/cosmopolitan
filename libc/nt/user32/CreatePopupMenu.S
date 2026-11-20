#include "libc/nt/codegen.h"
.imp	user32,__imp_CreatePopupMenu,CreatePopupMenu

	.text.windows
	.ftrace1
CreatePopupMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_CreatePopupMenu(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_CreatePopupMenu
	ldr	x16,[x16,#:lo12:__imp_CreatePopupMenu]
	br	x16
#endif
	ret
	.endfn	CreatePopupMenu,globl
	.previous
