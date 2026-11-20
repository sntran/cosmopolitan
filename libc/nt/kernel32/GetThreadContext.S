#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetThreadContext,GetThreadContext

	.text.windows
	.ftrace1
GetThreadContext:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetThreadContext(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetThreadContext
	ldr	x16,[x16,#:lo12:__imp_GetThreadContext]
	br	x16
#endif
	.endfn	GetThreadContext,globl
	.previous
