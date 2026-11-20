#include "libc/nt/codegen.h"
.imp	gdi32,__imp_GetPixel,GetPixel

	.text.windows
	.ftrace1
GetPixel:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetPixel(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetPixel
	ldr	x16,[x16,#:lo12:__imp_GetPixel]
	br	x16
#endif
	.endfn	GetPixel,globl
	.previous
