#include "libc/nt/ntdllimport.h"
.ntimp	NtTerminateThread,NtTerminateThread

	.text.windows
	.ftrace1
NtTerminateThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtTerminateThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtTerminateThread
	ldr	x16,[x16,#:lo12:__imp_NtTerminateThread]
	br	x16
#endif
	.endfn	NtTerminateThread,globl
	.previous
