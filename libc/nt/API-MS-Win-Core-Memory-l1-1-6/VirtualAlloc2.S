#include "libc/nt/codegen.h"
.imp	API-MS-Win-Core-Memory-l1-1-6,__imp_VirtualAlloc2,VirtualAlloc2

	.text.windows
	.ftrace1
VirtualAlloc2:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_VirtualAlloc2(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_VirtualAlloc2
	ldr	x16,[x16,#:lo12:__imp_VirtualAlloc2]
	br	x16
#endif
	.endfn	VirtualAlloc2,globl
	.previous
