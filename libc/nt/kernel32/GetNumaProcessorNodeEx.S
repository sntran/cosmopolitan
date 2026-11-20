#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetNumaProcessorNodeEx,GetNumaProcessorNodeEx

	.text.windows
	.ftrace1
GetNumaProcessorNodeEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetNumaProcessorNodeEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetNumaProcessorNodeEx
	ldr	x16,[x16,#:lo12:__imp_GetNumaProcessorNodeEx]
	br	x16
#endif
	.endfn	GetNumaProcessorNodeEx,globl
	.previous
