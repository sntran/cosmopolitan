#include "libc/nt/codegen.h"
.imp	gdi32,__imp_SelectObject,SelectObject

	.text.windows
	.ftrace1
SelectObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SelectObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SelectObject
	ldr	x16,[x16,#:lo12:__imp_SelectObject]
	br	x16
#endif
	.endfn	SelectObject,globl
	.previous
