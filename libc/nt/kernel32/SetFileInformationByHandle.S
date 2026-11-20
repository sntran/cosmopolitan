#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetFileInformationByHandle,SetFileInformationByHandle

	.text.windows
	.ftrace1
SetFileInformationByHandle:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetFileInformationByHandle(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetFileInformationByHandle
	ldr	x16,[x16,#:lo12:__imp_SetFileInformationByHandle]
	br	x16
#endif
	.endfn	SetFileInformationByHandle,globl
	.previous
