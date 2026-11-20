#include "libc/nt/codegen.h"
.imp	user32,__imp_AdjustWindowRectEx,AdjustWindowRectEx

	.text.windows
	.ftrace1
AdjustWindowRectEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AdjustWindowRectEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AdjustWindowRectEx
	ldr	x16,[x16,#:lo12:__imp_AdjustWindowRectEx]
	br	x16
#endif
	.endfn	AdjustWindowRectEx,globl
	.previous
