#include "libc/nt/codegen.h"
.imp	user32,__imp_GetSystemMenu,GetSystemMenu

	.text.windows
	.ftrace1
GetSystemMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetSystemMenu(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetSystemMenu
	ldr	x16,[x16,#:lo12:__imp_GetSystemMenu]
	br	x16
#endif
	.endfn	GetSystemMenu,globl
	.previous
