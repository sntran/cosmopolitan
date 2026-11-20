#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetFileSizeEx,GetFileSizeEx

	.text.windows
	.ftrace1
GetFileSizeEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetFileSizeEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetFileSizeEx
	ldr	x16,[x16,#:lo12:__imp_GetFileSizeEx]
	br	x16
#endif
	.endfn	GetFileSizeEx,globl
	.previous
