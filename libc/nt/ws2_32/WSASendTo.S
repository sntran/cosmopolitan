#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSASendTo,WSASendTo

	.text.windows
	.ftrace1
WSASendTo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSASendTo(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_WSASendTo
	ldr	x16,[x16,#:lo12:__imp_WSASendTo]
	br	x16
#endif
	.endfn	WSASendTo,globl
	.previous
