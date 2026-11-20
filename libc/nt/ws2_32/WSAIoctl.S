#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAIoctl,WSAIoctl

	.text.windows
	.ftrace1
WSAIoctl:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAIoctl(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAIoctl
	ldr	x16,[x16,#:lo12:__imp_WSAIoctl]
	br	x16
#endif
	.endfn	WSAIoctl,globl
	.previous
