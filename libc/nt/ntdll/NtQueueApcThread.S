#include "libc/nt/ntdllimport.h"
.ntimp	NtQueueApcThread,NtQueueApcThread

	.text.windows
	.ftrace1
NtQueueApcThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueueApcThread(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueueApcThread
	ldr	x16,[x16,#:lo12:__imp_NtQueueApcThread]
	br	x16
#endif
	.endfn	NtQueueApcThread,globl
	.previous
