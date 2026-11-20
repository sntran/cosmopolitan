#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FillConsoleOutputAttribute,FillConsoleOutputAttribute

	.text.windows
	.ftrace1
FillConsoleOutputAttribute:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_FillConsoleOutputAttribute(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_FillConsoleOutputAttribute
	ldr	x16,[x16,#:lo12:__imp_FillConsoleOutputAttribute]
	br	x16
#endif
	.endfn	FillConsoleOutputAttribute,globl
	.previous
