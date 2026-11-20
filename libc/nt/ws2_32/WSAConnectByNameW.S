#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAConnectByNameW,WSAConnectByNameW

	.text.windows
	.ftrace1
WSAConnectByName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAConnectByNameW(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAConnectByNameW
	ldr	x16,[x16,#:lo12:__imp_WSAConnectByNameW]
	br	x16
#endif
	.endfn	WSAConnectByName,globl
	.previous
