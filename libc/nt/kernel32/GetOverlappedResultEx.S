#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetOverlappedResultEx,GetOverlappedResultEx

	.text.windows
	.ftrace1
GetOverlappedResultEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetOverlappedResultEx(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetOverlappedResultEx
	ldr	x16,[x16,#:lo12:__imp_GetOverlappedResultEx]
	br	x16
#endif
	.endfn	GetOverlappedResultEx,globl
	.previous
