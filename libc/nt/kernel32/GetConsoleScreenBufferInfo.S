#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetConsoleScreenBufferInfo,GetConsoleScreenBufferInfo

	.text.windows
	.ftrace1
GetConsoleScreenBufferInfo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetConsoleScreenBufferInfo(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetConsoleScreenBufferInfo
	ldr	x16,[x16,#:lo12:__imp_GetConsoleScreenBufferInfo]
	br	x16
#endif
	.endfn	GetConsoleScreenBufferInfo,globl
	.previous
