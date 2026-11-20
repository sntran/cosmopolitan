#include "libc/nt/ntdllimport.h"
.ntimp	NtGetContextThread,NtGetContextThread

	.text.windows
	.ftrace1
NtGetContextThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtGetContextThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtGetContextThread
	ldr	x16,[x16,#:lo12:__imp_NtGetContextThread]
	br	x16
#endif
	.endfn	NtGetContextThread,globl
	.previous
