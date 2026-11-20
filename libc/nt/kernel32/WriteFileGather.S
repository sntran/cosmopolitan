#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WriteFileGather,WriteFileGather

	.text.windows
	.ftrace1
WriteFileGather:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WriteFileGather(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WriteFileGather
	ldr	x16,[x16,#:lo12:__imp_WriteFileGather]
	br	x16
#endif
	.endfn	WriteFileGather,globl
	.previous
