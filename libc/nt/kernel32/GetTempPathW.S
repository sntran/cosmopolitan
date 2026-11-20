#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetTempPathW,GetTempPathW

	.text.windows
	.ftrace1
GetTempPath:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetTempPathW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetTempPathW
	ldr	x16,[x16,#:lo12:__imp_GetTempPathW]
	br	x16
#endif
	.endfn	GetTempPath,globl
	.previous
