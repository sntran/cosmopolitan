#include "libc/nt/codegen.h"
.imp	user32,__imp_SetCursorPos,SetCursorPos

	.text.windows
	.ftrace1
SetCursorPos:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetCursorPos(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetCursorPos
	ldr	x16,[x16,#:lo12:__imp_SetCursorPos]
	br	x16
#endif
	.endfn	SetCursorPos,globl
	.previous
