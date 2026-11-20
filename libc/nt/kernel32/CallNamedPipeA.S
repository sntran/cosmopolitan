#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CallNamedPipeA,CallNamedPipeA

	.text.windows
	.ftrace1
CallNamedPipeA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CallNamedPipeA(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_CallNamedPipeA
	ldr	x16,[x16,#:lo12:__imp_CallNamedPipeA]
	br	x16
#endif
	.endfn	CallNamedPipeA,globl
	.previous
