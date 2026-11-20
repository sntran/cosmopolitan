#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateSemaphoreW,CreateSemaphoreW

	.text.windows
	.ftrace1
CreateSemaphore:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateSemaphoreW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateSemaphoreW
	ldr	x16,[x16,#:lo12:__imp_CreateSemaphoreW]
	br	x16
#endif
	.endfn	CreateSemaphore,globl
	.previous
