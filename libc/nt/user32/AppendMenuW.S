#include "libc/nt/codegen.h"
.imp	user32,__imp_AppendMenuW,AppendMenuW

	.text.windows
	.ftrace1
AppendMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AppendMenuW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AppendMenuW
	ldr	x16,[x16,#:lo12:__imp_AppendMenuW]
	br	x16
#endif
	.endfn	AppendMenu,globl
	.previous
