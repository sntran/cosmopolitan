#include "libc/nt/codegen.h"
.imp	user32,__imp_ReleaseDC,ReleaseDC

	.text.windows
	.ftrace1
ReleaseDC:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReleaseDC(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ReleaseDC
	ldr	x16,[x16,#:lo12:__imp_ReleaseDC]
	br	x16
#endif
	.endfn	ReleaseDC,globl
	.previous
