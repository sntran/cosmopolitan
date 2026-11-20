#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WriteConsoleOutputAttribute,WriteConsoleOutputAttribute

	.text.windows
	.ftrace1
WriteConsoleOutputAttribute:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WriteConsoleOutputAttribute(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WriteConsoleOutputAttribute
	ldr	x16,[x16,#:lo12:__imp_WriteConsoleOutputAttribute]
	br	x16
#endif
	.endfn	WriteConsoleOutputAttribute,globl
	.previous
