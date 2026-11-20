#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetFileTime,GetFileTime

	.text.windows
	.ftrace1
GetFileTime:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetFileTime(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetFileTime
	ldr	x16,[x16,#:lo12:__imp_GetFileTime]
	br	x16
#endif
	.endfn	GetFileTime,globl
	.previous
