#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetThreadId,GetThreadId

	.text.windows
	.ftrace1
GetThreadId:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetThreadId(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetThreadId
	ldr	x16,[x16,#:lo12:__imp_GetThreadId]
	br	x16
#endif
	ret
	.endfn	GetThreadId,globl
	.previous
