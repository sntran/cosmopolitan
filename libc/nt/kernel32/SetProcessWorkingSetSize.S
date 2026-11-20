#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetProcessWorkingSetSize,SetProcessWorkingSetSize

	.text.windows
	.ftrace1
SetProcessWorkingSetSize:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetProcessWorkingSetSize(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetProcessWorkingSetSize
	ldr	x16,[x16,#:lo12:__imp_SetProcessWorkingSetSize]
	br	x16
#endif
	.endfn	SetProcessWorkingSetSize,globl
	.previous
