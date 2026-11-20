#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSARecvDisconnect,WSARecvDisconnect

	.text.windows
	.ftrace1
WSARecvDisconnect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSARecvDisconnect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSARecvDisconnect
	ldr	x16,[x16,#:lo12:__imp_WSARecvDisconnect]
	br	x16
#endif
	.endfn	WSARecvDisconnect,globl
	.previous
