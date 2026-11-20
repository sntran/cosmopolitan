#include "libc/nt/codegen.h"
.imp	user32,__imp_PtInRect,PtInRect

	.text.windows
	.ftrace1
PtInRect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PtInRect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PtInRect
	ldr	x16,[x16,#:lo12:__imp_PtInRect]
	br	x16
#endif
	.endfn	PtInRect,globl
	.previous
