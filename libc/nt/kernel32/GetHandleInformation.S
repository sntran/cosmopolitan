#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetHandleInformation,GetHandleInformation

	.text.windows
	.ftrace1
GetHandleInformation:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetHandleInformation(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetHandleInformation
	ldr	x16,[x16,#:lo12:__imp_GetHandleInformation]
	br	x16
#endif
	.endfn	GetHandleInformation,globl
	.previous
