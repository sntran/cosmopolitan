#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetThreadIOPendingFlag,GetThreadIOPendingFlag

	.text.windows
	.ftrace1
GetThreadIOPendingFlag:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetThreadIOPendingFlag(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetThreadIOPendingFlag
	ldr	x16,[x16,#:lo12:__imp_GetThreadIOPendingFlag]
	br	x16
#endif
	.endfn	GetThreadIOPendingFlag,globl
	.previous
