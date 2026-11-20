#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAEventSelect,WSAEventSelect

	.text.windows
	.ftrace1
WSAEventSelect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAEventSelect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAEventSelect
	ldr	x16,[x16,#:lo12:__imp_WSAEventSelect]
	br	x16
#endif
	.endfn	WSAEventSelect,globl
	.previous
