#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetProcessIoCounters,GetProcessIoCounters

	.text.windows
	.ftrace1
GetProcessIoCounters:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessIoCounters(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessIoCounters
	ldr	x16,[x16,#:lo12:__imp_GetProcessIoCounters]
	br	x16
#endif
	.endfn	GetProcessIoCounters,globl
	.previous
