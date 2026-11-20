#include "libc/nt/codegen.h"
.imp	user32,__imp_SetClassLongW,SetClassLongW

	.text.windows
	.ftrace1
SetClassLong:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetClassLongW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetClassLongW
	ldr	x16,[x16,#:lo12:__imp_SetClassLongW]
	br	x16
#endif
	.endfn	SetClassLong,globl
	.previous
