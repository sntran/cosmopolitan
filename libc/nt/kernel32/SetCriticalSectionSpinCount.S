#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetCriticalSectionSpinCount,SetCriticalSectionSpinCount

	.text.windows
	.ftrace1
SetCriticalSectionSpinCount:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetCriticalSectionSpinCount(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetCriticalSectionSpinCount
	ldr	x16,[x16,#:lo12:__imp_SetCriticalSectionSpinCount]
	br	x16
#endif
	.endfn	SetCriticalSectionSpinCount,globl
	.previous
