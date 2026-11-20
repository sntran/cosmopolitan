#include "libc/nt/codegen.h"
.imp	kernel32,__imp_VirtualFree,VirtualFree

	.text.windows
	.ftrace1
VirtualFree:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_VirtualFree(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_VirtualFree
	ldr	x16,[x16,#:lo12:__imp_VirtualFree]
	br	x16
#endif
	.endfn	VirtualFree,globl
	.previous
