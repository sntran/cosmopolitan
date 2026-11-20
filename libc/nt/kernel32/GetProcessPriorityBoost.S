#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessPriorityBoost,GetProcessPriorityBoost

	.text.windows
	.ftrace1
GetProcessPriorityBoost:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessPriorityBoost(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessPriorityBoost
	ldr	x16,[x16,#:lo12:__imp_GetProcessPriorityBoost]
	br	x16
#endif
	.endfn	GetProcessPriorityBoost,globl
	.previous
