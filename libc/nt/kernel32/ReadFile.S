#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadFile,ReadFile

	.text.windows
	.ftrace1
ReadFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadFile(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadFile
	ldr	x16,[x16,#:lo12:__imp_ReadFile]
	br	x16
#endif
	.endfn	ReadFile,globl
	.previous
