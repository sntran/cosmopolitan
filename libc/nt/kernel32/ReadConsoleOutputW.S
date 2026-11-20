#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadConsoleOutputW,ReadConsoleOutputW

	.text.windows
	.ftrace1
ReadConsoleOutput:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadConsoleOutputW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadConsoleOutputW
	ldr	x16,[x16,#:lo12:__imp_ReadConsoleOutputW]
	br	x16
#endif
	.endfn	ReadConsoleOutput,globl
	.previous
