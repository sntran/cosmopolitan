#include "libc/nt/codegen.h"
.imp	user32,__imp_IsChild,IsChild

	.text.windows
	.ftrace1
IsChild:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_IsChild(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_IsChild
	ldr	x16,[x16,#:lo12:__imp_IsChild]
	br	x16
#endif
	.endfn	IsChild,globl
	.previous
