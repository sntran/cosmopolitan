#include "libc/nt/codegen.h"
.imp	user32,__imp_GetClientRect,GetClientRect

	.text.windows
	.ftrace1
GetClientRect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetClientRect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetClientRect
	ldr	x16,[x16,#:lo12:__imp_GetClientRect]
	br	x16
#endif
	.endfn	GetClientRect,globl
	.previous
