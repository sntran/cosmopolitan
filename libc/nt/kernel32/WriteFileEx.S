#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WriteFileEx,WriteFileEx

	.text.windows
	.ftrace1
WriteFileEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WriteFileEx(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WriteFileEx
	ldr	x16,[x16,#:lo12:__imp_WriteFileEx]
	br	x16
#endif
	.endfn	WriteFileEx,globl
	.previous
