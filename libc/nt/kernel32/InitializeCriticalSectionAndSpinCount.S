#include "libc/nt/codegen.h"
.imp	kernel32,__imp_InitializeCriticalSectionAndSpinCount,InitializeCriticalSectionAndSpinCount

	.text.windows
	.ftrace1
InitializeCriticalSectionAndSpinCount:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_InitializeCriticalSectionAndSpinCount(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_InitializeCriticalSectionAndSpinCount
	ldr	x16,[x16,#:lo12:__imp_InitializeCriticalSectionAndSpinCount]
	br	x16
#endif
	.endfn	InitializeCriticalSectionAndSpinCount,globl
	.previous
