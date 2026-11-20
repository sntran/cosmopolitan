#include "libc/nt/codegen.h"
.imp	user32,__imp_SetParent,SetParent

	.text.windows
	.ftrace1
SetParent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetParent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetParent
	ldr	x16,[x16,#:lo12:__imp_SetParent]
	br	x16
#endif
	.endfn	SetParent,globl
	.previous
