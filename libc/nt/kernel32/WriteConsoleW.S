#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WriteConsoleW,WriteConsoleW

	.text.windows
	.ftrace1
WriteConsole:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WriteConsoleW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WriteConsoleW
	ldr	x16,[x16,#:lo12:__imp_WriteConsoleW]
	br	x16
#endif
	.endfn	WriteConsole,globl
	.previous
