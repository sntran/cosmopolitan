#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetSystemTimes,GetSystemTimes

	.text.windows
	.ftrace1
GetSystemTimes:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetSystemTimes(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetSystemTimes
	ldr	x16,[x16,#:lo12:__imp_GetSystemTimes]
	br	x16
#endif
	.endfn	GetSystemTimes,globl
	.previous
