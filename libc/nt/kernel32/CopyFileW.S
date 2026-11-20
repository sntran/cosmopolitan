#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CopyFileW,CopyFileW

	.text.windows
	.ftrace1
CopyFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CopyFileW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CopyFileW
	ldr	x16,[x16,#:lo12:__imp_CopyFileW]
	br	x16
#endif
	.endfn	CopyFile,globl
	.previous
