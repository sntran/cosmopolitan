#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetConsoleTitleW,GetConsoleTitleW

	.text.windows
	.ftrace1
GetConsoleTitle:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetConsoleTitleW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetConsoleTitleW
	ldr	x16,[x16,#:lo12:__imp_GetConsoleTitleW]
	br	x16
#endif
	.endfn	GetConsoleTitle,globl
	.previous
