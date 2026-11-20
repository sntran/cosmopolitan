#include "libc/nt/ntdllimport.h"
.ntimp	NtSetContextThread,NtSetContextThread

	.text.windows
	.ftrace1
NtSetContextThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSetContextThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSetContextThread
	ldr	x16,[x16,#:lo12:__imp_NtSetContextThread]
	br	x16
#endif
	.endfn	NtSetContextThread,globl
	.previous
