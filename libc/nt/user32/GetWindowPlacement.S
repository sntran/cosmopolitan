#include "libc/nt/codegen.h"
.imp	user32,__imp_GetWindowPlacement,GetWindowPlacement

	.text.windows
	.ftrace1
GetWindowPlacement:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetWindowPlacement(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetWindowPlacement
	ldr	x16,[x16,#:lo12:__imp_GetWindowPlacement]
	br	x16
#endif
	.endfn	GetWindowPlacement,globl
	.previous
