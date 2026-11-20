#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAEnumProtocolsW,WSAEnumProtocolsW

	.text.windows
	.ftrace1
WSAEnumProtocols:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAEnumProtocolsW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAEnumProtocolsW
	ldr	x16,[x16,#:lo12:__imp_WSAEnumProtocolsW]
	br	x16
#endif
	.endfn	WSAEnumProtocols,globl
	.previous
