#include "libc/nt/codegen.h"
.imp	kernel32,__imp_AddVectoredContinueHandler,AddVectoredContinueHandler

	.text.windows
	.ftrace1
AddVectoredContinueHandler:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AddVectoredContinueHandler(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AddVectoredContinueHandler
	ldr	x16,[x16,#:lo12:__imp_AddVectoredContinueHandler]
	br	x16
#endif
	.endfn	AddVectoredContinueHandler,globl
	.previous
