#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetThreadContext,SetThreadContext

	.text.windows
	.ftrace1
SetThreadContext:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetThreadContext(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetThreadContext
	ldr	x16,[x16,#:lo12:__imp_SetThreadContext]
	br	x16
#endif
	.endfn	SetThreadContext,globl
	.previous
