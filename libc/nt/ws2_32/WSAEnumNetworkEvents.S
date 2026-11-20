#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAEnumNetworkEvents,WSAEnumNetworkEvents

	.text.windows
	.ftrace1
WSAEnumNetworkEvents:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAEnumNetworkEvents(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAEnumNetworkEvents
	ldr	x16,[x16,#:lo12:__imp_WSAEnumNetworkEvents]
	br	x16
#endif
	.endfn	WSAEnumNetworkEvents,globl
	.previous
