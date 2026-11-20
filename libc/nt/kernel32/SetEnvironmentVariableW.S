#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetEnvironmentVariableW,SetEnvironmentVariableW

	.text.windows
	.ftrace1
SetEnvironmentVariable:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetEnvironmentVariableW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetEnvironmentVariableW
	ldr	x16,[x16,#:lo12:__imp_SetEnvironmentVariableW]
	br	x16
#endif
	.endfn	SetEnvironmentVariable,globl
	.previous
