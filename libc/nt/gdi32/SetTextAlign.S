#include "libc/nt/codegen.h"
.imp	gdi32,__imp_SetTextAlign,SetTextAlign

	.text.windows
	.ftrace1
SetTextAlign:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetTextAlign(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetTextAlign
	ldr	x16,[x16,#:lo12:__imp_SetTextAlign]
	br	x16
#endif
	.endfn	SetTextAlign,globl
	.previous
