#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetThreadPriorityBoost,GetThreadPriorityBoost

	.text.windows
	.ftrace1
GetThreadPriorityBoost:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetThreadPriorityBoost(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetThreadPriorityBoost
	ldr	x16,[x16,#:lo12:__imp_GetThreadPriorityBoost]
	br	x16
#endif
	.endfn	GetThreadPriorityBoost,globl
	.previous
