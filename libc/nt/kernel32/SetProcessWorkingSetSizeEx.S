#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetProcessWorkingSetSizeEx,SetProcessWorkingSetSizeEx

	.text.windows
	.ftrace1
SetProcessWorkingSetSizeEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetProcessWorkingSetSizeEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetProcessWorkingSetSizeEx
	ldr	x16,[x16,#:lo12:__imp_SetProcessWorkingSetSizeEx]
	br	x16
#endif
	.endfn	SetProcessWorkingSetSizeEx,globl
	.previous
