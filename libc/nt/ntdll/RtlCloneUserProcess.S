#include "libc/nt/ntdllimport.h"
.ntimp	RtlCloneUserProcess,RtlCloneUserProcess

	.text.windows
	.ftrace1
RtlCloneUserProcess:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlCloneUserProcess(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlCloneUserProcess
	ldr	x16,[x16,#:lo12:__imp_RtlCloneUserProcess]
	br	x16
#endif
	.endfn	RtlCloneUserProcess,globl
	.previous
