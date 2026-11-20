#include "libc/nt/codegen.h"
.imp	kernel32,__imp_VirtualQuery,VirtualQuery

	.text.windows
	.ftrace1
VirtualQuery:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_VirtualQuery(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_VirtualQuery
	ldr	x16,[x16,#:lo12:__imp_VirtualQuery]
	br	x16
#endif
	.endfn	VirtualQuery,globl
	.previous
