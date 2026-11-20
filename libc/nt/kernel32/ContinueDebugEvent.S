#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ContinueDebugEvent,ContinueDebugEvent

	.text.windows
	.ftrace1
ContinueDebugEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ContinueDebugEvent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ContinueDebugEvent
	ldr	x16,[x16,#:lo12:__imp_ContinueDebugEvent]
	br	x16
#endif
	.endfn	ContinueDebugEvent,globl
	.previous
