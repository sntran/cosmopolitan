#include "libc/nt/codegen.h"
.imp	kernel32,__imp_VirtualQueryEx,VirtualQueryEx

	.text.windows
	.ftrace1
VirtualQueryEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_VirtualQueryEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_VirtualQueryEx
	ldr	x16,[x16,#:lo12:__imp_VirtualQueryEx]
	br	x16
#endif
	.endfn	VirtualQueryEx,globl
	.previous
