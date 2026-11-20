#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetThreadPriorityBoost,SetThreadPriorityBoost

	.text.windows
	.ftrace1
SetThreadPriorityBoost:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetThreadPriorityBoost(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetThreadPriorityBoost
	ldr	x16,[x16,#:lo12:__imp_SetThreadPriorityBoost]
	br	x16
#endif
	.endfn	SetThreadPriorityBoost,globl
	.previous
