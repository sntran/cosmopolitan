#include "libc/nt/codegen.h"
.imp	user32,__imp_ScreenToClient,ScreenToClient

	.text.windows
	.ftrace1
ScreenToClient:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ScreenToClient(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ScreenToClient
	ldr	x16,[x16,#:lo12:__imp_ScreenToClient]
	br	x16
#endif
	.endfn	ScreenToClient,globl
	.previous
