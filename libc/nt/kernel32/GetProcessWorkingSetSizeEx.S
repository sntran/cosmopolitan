#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessWorkingSetSizeEx,GetProcessWorkingSetSizeEx

	.text.windows
	.ftrace1
GetProcessWorkingSetSizeEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessWorkingSetSizeEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessWorkingSetSizeEx
	ldr	x16,[x16,#:lo12:__imp_GetProcessWorkingSetSizeEx]
	br	x16
#endif
	.endfn	GetProcessWorkingSetSizeEx,globl
	.previous
