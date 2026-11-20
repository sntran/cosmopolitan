#include "libc/nt/codegen.h"
.imp	BCryptPrimitives,__imp_ProcessPrng,ProcessPrng

	.text.windows
	.ftrace1
ProcessPrng:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ProcessPrng(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ProcessPrng
	ldr	x16,[x16,#:lo12:__imp_ProcessPrng]
	br	x16
#endif
	.endfn	ProcessPrng,globl
	.previous
