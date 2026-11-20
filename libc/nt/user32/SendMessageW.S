#include "libc/nt/codegen.h"
.imp	user32,__imp_SendMessageW,SendMessageW

	.text.windows
	.ftrace1
SendMessage:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SendMessageW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SendMessageW
	ldr	x16,[x16,#:lo12:__imp_SendMessageW]
	br	x16
#endif
	.endfn	SendMessage,globl
	.previous
