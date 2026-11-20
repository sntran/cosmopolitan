#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowPos,SetWindowPos

	.text.windows
	.ftrace1
SetWindowPos:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowPos(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowPos
	ldr	x16,[x16,#:lo12:__imp_SetWindowPos]
	br	x16
#endif
	.endfn	SetWindowPos,globl
	.previous
