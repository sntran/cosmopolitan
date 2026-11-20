#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetThreadTimes,GetThreadTimes

	.text.windows
	.ftrace1
GetThreadTimes:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetThreadTimes(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetThreadTimes
	ldr	x16,[x16,#:lo12:__imp_GetThreadTimes]
	br	x16
#endif
	.endfn	GetThreadTimes,globl
	.previous
