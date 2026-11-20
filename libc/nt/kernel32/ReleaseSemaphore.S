#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReleaseSemaphore,ReleaseSemaphore

	.text.windows
	.ftrace1
ReleaseSemaphore:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReleaseSemaphore(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ReleaseSemaphore
	ldr	x16,[x16,#:lo12:__imp_ReleaseSemaphore]
	br	x16
#endif
	.endfn	ReleaseSemaphore,globl
	.previous
