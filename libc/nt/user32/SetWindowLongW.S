#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowLongW,SetWindowLongW

	.text.windows
	.ftrace1
SetWindowLong:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowLongW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowLongW
	ldr	x16,[x16,#:lo12:__imp_SetWindowLongW]
	br	x16
#endif
	.endfn	SetWindowLong,globl
	.previous
