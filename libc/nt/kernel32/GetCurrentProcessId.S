#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetCurrentProcessId,GetCurrentProcessId

	.text.windows
	.ftrace1
GetCurrentProcessId:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetCurrentProcessId(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetCurrentProcessId
	ldr	x16,[x16,#:lo12:__imp_GetCurrentProcessId]
	br	x16
#endif
	ret
	.endfn	GetCurrentProcessId,globl
	.previous
