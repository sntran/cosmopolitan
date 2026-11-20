#include "libc/nt/codegen.h"
.imp	user32,__imp_InvalidateRect,InvalidateRect

	.text.windows
	.ftrace1
InvalidateRect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_InvalidateRect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_InvalidateRect
	ldr	x16,[x16,#:lo12:__imp_InvalidateRect]
	br	x16
#endif
	.endfn	InvalidateRect,globl
	.previous
