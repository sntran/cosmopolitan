#include "libc/nt/codegen.h"
.imp	user32,__imp_BeginPaint,BeginPaint

	.text.windows
	.ftrace1
BeginPaint:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_BeginPaint(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_BeginPaint
	ldr	x16,[x16,#:lo12:__imp_BeginPaint]
	br	x16
#endif
	.endfn	BeginPaint,globl
	.previous
