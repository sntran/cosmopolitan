#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetConsoleOutputCP,GetConsoleOutputCP

	.text.windows
	.ftrace1
GetConsoleOutputCP:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetConsoleOutputCP(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetConsoleOutputCP
	ldr	x16,[x16,#:lo12:__imp_GetConsoleOutputCP]
	br	x16
#endif
	ret
	.endfn	GetConsoleOutputCP,globl
	.previous
