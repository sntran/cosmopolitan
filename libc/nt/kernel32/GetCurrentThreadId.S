#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetCurrentThreadId,GetCurrentThreadId

	.text.windows
	.ftrace1
GetCurrentThreadId:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetCurrentThreadId(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetCurrentThreadId
	ldr	x16,[x16,#:lo12:__imp_GetCurrentThreadId]
	br	x16
#endif
	ret
	.endfn	GetCurrentThreadId,globl
	.previous
