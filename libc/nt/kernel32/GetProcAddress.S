#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcAddress,GetProcAddress

	.text.windows
	.ftrace1
GetProcAddress:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcAddress(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcAddress
	ldr	x16,[x16,#:lo12:__imp_GetProcAddress]
	br	x16
#endif
	.endfn	GetProcAddress,globl
	.previous
