#include "libc/nt/codegen.h"
.imp	user32,__imp_SetTimer,SetTimer

	.text.windows
	.ftrace1
SetTimer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetTimer(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetTimer
	ldr	x16,[x16,#:lo12:__imp_SetTimer]
	br	x16
#endif
	.endfn	SetTimer,globl
	.previous
