#include "libc/nt/codegen.h"
.imp	PowrProf,__imp_SetSuspendState,SetSuspendState

	.text.windows
	.ftrace1
SetSuspendState:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetSuspendState(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetSuspendState
	ldr	x16,[x16,#:lo12:__imp_SetSuspendState]
	br	x16
#endif
	.endfn	SetSuspendState,globl
	.previous
