#include "libc/nt/codegen.h"
.imp	user32,__imp_PostMessageW,PostMessageW

	.text.windows
	.ftrace1
PostMessage:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PostMessageW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PostMessageW
	ldr	x16,[x16,#:lo12:__imp_PostMessageW]
	br	x16
#endif
	.endfn	PostMessage,globl
	.previous
