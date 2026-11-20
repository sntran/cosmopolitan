#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetCurrentDirectoryW,GetCurrentDirectoryW

	.text.windows
	.ftrace1
GetCurrentDirectory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetCurrentDirectoryW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetCurrentDirectoryW
	ldr	x16,[x16,#:lo12:__imp_GetCurrentDirectoryW]
	br	x16
#endif
	.endfn	GetCurrentDirectory,globl
	.previous
