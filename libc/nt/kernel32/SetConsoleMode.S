#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetConsoleMode,SetConsoleMode

	.text.windows
	.ftrace1
SetConsoleMode:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetConsoleMode(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetConsoleMode
	ldr	x16,[x16,#:lo12:__imp_SetConsoleMode]
	br	x16
#endif
	.endfn	SetConsoleMode,globl
	.previous
