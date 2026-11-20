#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetSystemDirectoryW,GetSystemDirectoryW

	.text.windows
	.ftrace1
GetSystemDirectory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetSystemDirectoryW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetSystemDirectoryW
	ldr	x16,[x16,#:lo12:__imp_GetSystemDirectoryW]
	br	x16
#endif
	.endfn	GetSystemDirectory,globl
	.previous
