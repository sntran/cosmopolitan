#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetFilePointer,SetFilePointer

	.text.windows
	.ftrace1
SetFilePointer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetFilePointer(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetFilePointer
	ldr	x16,[x16,#:lo12:__imp_SetFilePointer]
	br	x16
#endif
	.endfn	SetFilePointer,globl
	.previous
