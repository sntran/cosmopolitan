#include "libc/nt/codegen.h"
.imp	user32,__imp_AdjustWindowRect,AdjustWindowRect

	.text.windows
	.ftrace1
AdjustWindowRect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AdjustWindowRect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AdjustWindowRect
	ldr	x16,[x16,#:lo12:__imp_AdjustWindowRect]
	br	x16
#endif
	.endfn	AdjustWindowRect,globl
	.previous
