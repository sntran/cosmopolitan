#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowTextW,SetWindowTextW

	.text.windows
	.ftrace1
SetWindowText:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowTextW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowTextW
	ldr	x16,[x16,#:lo12:__imp_SetWindowTextW]
	br	x16
#endif
	.endfn	SetWindowText,globl
	.previous
