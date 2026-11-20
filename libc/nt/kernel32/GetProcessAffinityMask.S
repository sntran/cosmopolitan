#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessAffinityMask,GetProcessAffinityMask

	.text.windows
	.ftrace1
GetProcessAffinityMask:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessAffinityMask(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessAffinityMask
	ldr	x16,[x16,#:lo12:__imp_GetProcessAffinityMask]
	br	x16
#endif
	.endfn	GetProcessAffinityMask,globl
	.previous
