#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadConsoleOutputAttribute,ReadConsoleOutputAttribute

	.text.windows
	.ftrace1
ReadConsoleOutputAttribute:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadConsoleOutputAttribute(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadConsoleOutputAttribute
	ldr	x16,[x16,#:lo12:__imp_ReadConsoleOutputAttribute]
	br	x16
#endif
	.endfn	ReadConsoleOutputAttribute,globl
	.previous
