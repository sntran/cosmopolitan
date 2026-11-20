#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetTickCount64,GetTickCount64

	.text.windows
	.ftrace1
GetTickCount64:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetTickCount64(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetTickCount64
	ldr	x16,[x16,#:lo12:__imp_GetTickCount64]
	br	x16
#endif
	ret
	.endfn	GetTickCount64,globl
	.previous
