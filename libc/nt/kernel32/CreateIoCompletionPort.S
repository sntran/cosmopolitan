#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateIoCompletionPort,CreateIoCompletionPort

	.text.windows
	.ftrace1
CreateIoCompletionPort:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateIoCompletionPort(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateIoCompletionPort
	ldr	x16,[x16,#:lo12:__imp_CreateIoCompletionPort]
	br	x16
#endif
	.endfn	CreateIoCompletionPort,globl
	.previous
