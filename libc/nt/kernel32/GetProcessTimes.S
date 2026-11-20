#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessTimes,GetProcessTimes

	.text.windows
	.ftrace1
GetProcessTimes:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessTimes(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessTimes
	ldr	x16,[x16,#:lo12:__imp_GetProcessTimes]
	br	x16
#endif
	.endfn	GetProcessTimes,globl
	.previous
