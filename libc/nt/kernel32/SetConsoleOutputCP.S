#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetConsoleOutputCP,SetConsoleOutputCP

	.text.windows
	.ftrace1
SetConsoleOutputCP:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_SetConsoleOutputCP(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_SetConsoleOutputCP
	ldr	x16,[x16,#:lo12:__imp_SetConsoleOutputCP]
	br	x16
#endif
	ret
	.endfn	SetConsoleOutputCP,globl
	.previous
