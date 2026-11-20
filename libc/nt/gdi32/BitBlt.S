#include "libc/nt/codegen.h"
.imp	gdi32,__imp_BitBlt,BitBlt

	.text.windows
	.ftrace1
BitBlt:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_BitBlt(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_BitBlt
	ldr	x16,[x16,#:lo12:__imp_BitBlt]
	br	x16
#endif
	.endfn	BitBlt,globl
	.previous
