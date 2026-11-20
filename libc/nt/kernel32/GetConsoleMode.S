#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetConsoleMode,GetConsoleMode

	.text.windows
	.ftrace1
GetConsoleMode:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetConsoleMode(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetConsoleMode
	ldr	x16,[x16,#:lo12:__imp_GetConsoleMode]
	br	x16
#endif
	.endfn	GetConsoleMode,globl
	.previous
