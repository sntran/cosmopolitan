#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadConsoleW,ReadConsoleW

	.text.windows
	.ftrace1
ReadConsole:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadConsoleW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadConsoleW
	ldr	x16,[x16,#:lo12:__imp_ReadConsoleW]
	br	x16
#endif
	.endfn	ReadConsole,globl
	.previous
