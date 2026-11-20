#include "libc/nt/codegen.h"
.imp	kernel32,__imp_VirtualLock,VirtualLock

	.text.windows
	.ftrace1
VirtualLock:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_VirtualLock(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_VirtualLock
	ldr	x16,[x16,#:lo12:__imp_VirtualLock]
	br	x16
#endif
	.endfn	VirtualLock,globl
	.previous
