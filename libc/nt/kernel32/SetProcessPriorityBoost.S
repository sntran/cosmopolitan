#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetProcessPriorityBoost,SetProcessPriorityBoost

	.text.windows
	.ftrace1
SetProcessPriorityBoost:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetProcessPriorityBoost(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetProcessPriorityBoost
	ldr	x16,[x16,#:lo12:__imp_SetProcessPriorityBoost]
	br	x16
#endif
	.endfn	SetProcessPriorityBoost,globl
	.previous
