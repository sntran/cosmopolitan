#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessHandleCount,GetProcessHandleCount

	.text.windows
	.ftrace1
GetProcessHandleCount:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessHandleCount(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessHandleCount
	ldr	x16,[x16,#:lo12:__imp_GetProcessHandleCount]
	br	x16
#endif
	.endfn	GetProcessHandleCount,globl
	.previous
