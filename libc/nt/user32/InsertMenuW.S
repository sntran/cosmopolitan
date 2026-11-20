#include "libc/nt/codegen.h"
.imp	user32,__imp_InsertMenuW,InsertMenuW

	.text.windows
	.ftrace1
InsertMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_InsertMenuW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_InsertMenuW
	ldr	x16,[x16,#:lo12:__imp_InsertMenuW]
	br	x16
#endif
	.endfn	InsertMenu,globl
	.previous
