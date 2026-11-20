#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessHeaps,GetProcessHeaps

	.text.windows
	.ftrace1
GetProcessHeaps:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessHeaps(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessHeaps
	ldr	x16,[x16,#:lo12:__imp_GetProcessHeaps]
	br	x16
#endif
	.endfn	GetProcessHeaps,globl
	.previous
