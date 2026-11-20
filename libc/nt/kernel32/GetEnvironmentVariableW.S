#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetEnvironmentVariableW,GetEnvironmentVariableW

	.text.windows
	.ftrace1
GetEnvironmentVariable:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetEnvironmentVariableW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetEnvironmentVariableW
	ldr	x16,[x16,#:lo12:__imp_GetEnvironmentVariableW]
	br	x16
#endif
	.endfn	GetEnvironmentVariable,globl
	.previous
