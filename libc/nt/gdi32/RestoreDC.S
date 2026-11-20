#include "libc/nt/codegen.h"
.imp	gdi32,__imp_RestoreDC,RestoreDC

	.text.windows
	.ftrace1
RestoreDC:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RestoreDC(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RestoreDC
	ldr	x16,[x16,#:lo12:__imp_RestoreDC]
	br	x16
#endif
	.endfn	RestoreDC,globl
	.previous
