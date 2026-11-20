#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateWaitableTimerExW,CreateWaitableTimerExW

	.text.windows
	.ftrace1
CreateWaitableTimerEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateWaitableTimerExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateWaitableTimerExW
	ldr	x16,[x16,#:lo12:__imp_CreateWaitableTimerExW]
	br	x16
#endif
	.endfn	CreateWaitableTimerEx,globl
	.previous
