#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetTempPathA,GetTempPathA

	.text.windows
	.ftrace1
GetTempPathA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetTempPathA(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetTempPathA
	ldr	x16,[x16,#:lo12:__imp_GetTempPathA]
	br	x16
#endif
	.endfn	GetTempPathA,globl
	.previous
