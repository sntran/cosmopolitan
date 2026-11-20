#include "libc/nt/codegen.h"
.imp	kernel32,__imp_RegisterWaitForSingleObject,RegisterWaitForSingleObject

	.text.windows
	.ftrace1
RegisterWaitForSingleObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegisterWaitForSingleObject(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RegisterWaitForSingleObject
	ldr	x16,[x16,#:lo12:__imp_RegisterWaitForSingleObject]
	br	x16
#endif
	.endfn	RegisterWaitForSingleObject,globl
	.previous
