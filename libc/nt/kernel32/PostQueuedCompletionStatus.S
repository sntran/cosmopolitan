#include "libc/nt/codegen.h"
.imp	kernel32,__imp_PostQueuedCompletionStatus,PostQueuedCompletionStatus

	.text.windows
	.ftrace1
PostQueuedCompletionStatus:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PostQueuedCompletionStatus(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PostQueuedCompletionStatus
	ldr	x16,[x16,#:lo12:__imp_PostQueuedCompletionStatus]
	br	x16
#endif
	.endfn	PostQueuedCompletionStatus,globl
	.previous
