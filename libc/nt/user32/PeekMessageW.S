#include "libc/nt/codegen.h"
.imp	user32,__imp_PeekMessageW,PeekMessageW

	.text.windows
	.ftrace1
PeekMessage:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PeekMessageW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_PeekMessageW
	ldr	x16,[x16,#:lo12:__imp_PeekMessageW]
	br	x16
#endif
	.endfn	PeekMessage,globl
	.previous
