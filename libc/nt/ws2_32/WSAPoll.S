#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAPoll,WSAPoll

	.text.windows
	.ftrace1
WSAPoll:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAPoll(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAPoll
	ldr	x16,[x16,#:lo12:__imp_WSAPoll]
	br	x16
#endif
	.endfn	WSAPoll,globl
	.previous
