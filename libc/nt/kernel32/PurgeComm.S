#include "libc/nt/codegen.h"
.imp	kernel32,__imp_PurgeComm,PurgeComm

	.text.windows
	.ftrace1
PurgeComm:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PurgeComm(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PurgeComm
	ldr	x16,[x16,#:lo12:__imp_PurgeComm]
	br	x16
#endif
	.endfn	PurgeComm,globl
	.previous
