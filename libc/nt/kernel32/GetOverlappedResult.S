#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetOverlappedResult,GetOverlappedResult

	.text.windows
	.ftrace1
GetOverlappedResult:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetOverlappedResult(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetOverlappedResult
	ldr	x16,[x16,#:lo12:__imp_GetOverlappedResult]
	br	x16
#endif
	.endfn	GetOverlappedResult,globl
	.previous
