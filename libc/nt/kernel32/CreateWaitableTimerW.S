#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateWaitableTimerW,CreateWaitableTimerW

	.text.windows
	.ftrace1
CreateWaitableTimer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateWaitableTimerW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateWaitableTimerW
	ldr	x16,[x16,#:lo12:__imp_CreateWaitableTimerW]
	br	x16
#endif
	.endfn	CreateWaitableTimer,globl
	.previous
