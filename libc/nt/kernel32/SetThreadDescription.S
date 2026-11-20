#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetThreadDescription,SetThreadDescription

	.text.windows
	.ftrace1
SetThreadDescription:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetThreadDescription(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetThreadDescription
	ldr	x16,[x16,#:lo12:__imp_SetThreadDescription]
	br	x16
#endif
	.endfn	SetThreadDescription,globl
	.previous
