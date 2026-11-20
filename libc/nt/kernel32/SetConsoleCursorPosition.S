#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetConsoleCursorPosition,SetConsoleCursorPosition

	.text.windows
	.ftrace1
SetConsoleCursorPosition:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetConsoleCursorPosition(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetConsoleCursorPosition
	ldr	x16,[x16,#:lo12:__imp_SetConsoleCursorPosition]
	br	x16
#endif
	.endfn	SetConsoleCursorPosition,globl
	.previous
