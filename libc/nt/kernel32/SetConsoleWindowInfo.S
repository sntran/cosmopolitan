#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetConsoleWindowInfo,SetConsoleWindowInfo

	.text.windows
	.ftrace1
SetConsoleWindowInfo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetConsoleWindowInfo(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetConsoleWindowInfo
	ldr	x16,[x16,#:lo12:__imp_SetConsoleWindowInfo]
	br	x16
#endif
	.endfn	SetConsoleWindowInfo,globl
	.previous
