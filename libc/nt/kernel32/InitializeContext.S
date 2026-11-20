#include "libc/nt/codegen.h"
.imp	kernel32,__imp_InitializeContext,InitializeContext

	.text.windows
	.ftrace1
InitializeContext:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_InitializeContext(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_InitializeContext
	ldr	x16,[x16,#:lo12:__imp_InitializeContext]
	br	x16
#endif
	.endfn	InitializeContext,globl
	.previous
