#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetQueuedCompletionStatusEx,GetQueuedCompletionStatusEx

	.text.windows
	.ftrace1
GetQueuedCompletionStatusEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetQueuedCompletionStatusEx(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetQueuedCompletionStatusEx
	ldr	x16,[x16,#:lo12:__imp_GetQueuedCompletionStatusEx]
	br	x16
#endif
	.endfn	GetQueuedCompletionStatusEx,globl
	.previous
