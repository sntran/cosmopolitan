#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessWorkingSetSize,GetProcessWorkingSetSize

	.text.windows
	.ftrace1
GetProcessWorkingSetSize:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessWorkingSetSize(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessWorkingSetSize
	ldr	x16,[x16,#:lo12:__imp_GetProcessWorkingSetSize]
	br	x16
#endif
	.endfn	GetProcessWorkingSetSize,globl
	.previous
