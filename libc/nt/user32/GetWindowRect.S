#include "libc/nt/codegen.h"
.imp	user32,__imp_GetWindowRect,GetWindowRect

	.text.windows
	.ftrace1
GetWindowRect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetWindowRect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetWindowRect
	ldr	x16,[x16,#:lo12:__imp_GetWindowRect]
	br	x16
#endif
	.endfn	GetWindowRect,globl
	.previous
