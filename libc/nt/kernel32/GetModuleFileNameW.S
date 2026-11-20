#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetModuleFileNameW,GetModuleFileNameW

	.text.windows
	.ftrace1
GetModuleFileName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetModuleFileNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetModuleFileNameW
	ldr	x16,[x16,#:lo12:__imp_GetModuleFileNameW]
	br	x16
#endif
	.endfn	GetModuleFileName,globl
	.previous
