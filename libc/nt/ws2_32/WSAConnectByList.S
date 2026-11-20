#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAConnectByList,WSAConnectByList

	.text.windows
	.ftrace1
WSAConnectByList:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAConnectByList(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAConnectByList
	ldr	x16,[x16,#:lo12:__imp_WSAConnectByList]
	br	x16
#endif
	.endfn	WSAConnectByList,globl
	.previous
