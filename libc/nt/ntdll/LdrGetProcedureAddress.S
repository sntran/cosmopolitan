#include "libc/nt/ntdllimport.h"
.ntimp	LdrGetProcedureAddress,LdrGetProcedureAddress

	.text.windows
	.ftrace1
LdrGetProcedureAddress:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_LdrGetProcedureAddress(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_LdrGetProcedureAddress
	ldr	x16,[x16,#:lo12:__imp_LdrGetProcedureAddress]
	br	x16
#endif
	.endfn	LdrGetProcedureAddress,globl
	.previous
