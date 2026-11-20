#include "libc/nt/codegen.h"
.imp	kernel32,__imp_TerminateThread,TerminateThread

	.text.windows
	.ftrace1
TerminateThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_TerminateThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_TerminateThread
	ldr	x16,[x16,#:lo12:__imp_TerminateThread]
	br	x16
#endif
	.endfn	TerminateThread,globl
	.previous
