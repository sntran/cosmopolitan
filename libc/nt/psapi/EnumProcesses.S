#include "libc/nt/codegen.h"
.imp	psapi,__imp_EnumProcesses,EnumProcesses

	.text.windows
	.ftrace1
EnumProcesses:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_EnumProcesses(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_EnumProcesses
	ldr	x16,[x16,#:lo12:__imp_EnumProcesses]
	br	x16
#endif
	.endfn	EnumProcesses,globl
	.previous
