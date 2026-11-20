#include "libc/nt/codegen.h"
.imp	user32,__imp_DeleteMenu,DeleteMenu

	.text.windows
	.ftrace1
DeleteMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DeleteMenu(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_DeleteMenu
	ldr	x16,[x16,#:lo12:__imp_DeleteMenu]
	br	x16
#endif
	.endfn	DeleteMenu,globl
	.previous
