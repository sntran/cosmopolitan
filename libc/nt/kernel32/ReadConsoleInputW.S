#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadConsoleInputW,ReadConsoleInputW

	.text.windows
	.ftrace1
ReadConsoleInput:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadConsoleInputW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadConsoleInputW
	ldr	x16,[x16,#:lo12:__imp_ReadConsoleInputW]
	br	x16
#endif
	.endfn	ReadConsoleInput,globl
	.previous
