#include "libc/nt/codegen.h"
.imp	pdh,__imp_PdhGetFormattedCounterValue,PdhGetFormattedCounterValue

	.text.windows
	.ftrace1
PdhGetFormattedCounterValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PdhGetFormattedCounterValue(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PdhGetFormattedCounterValue
	ldr	x16,[x16,#:lo12:__imp_PdhGetFormattedCounterValue]
	br	x16
#endif
	.endfn	PdhGetFormattedCounterValue,globl
	.previous
