#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessInformation,GetProcessInformation

	.text.windows
	.ftrace1
GetProcessInformation:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessInformation(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessInformation
	ldr	x16,[x16,#:lo12:__imp_GetProcessInformation]
	br	x16
#endif
	.endfn	GetProcessInformation,globl
	.previous
