#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAAddressToStringW,WSAAddressToStringW

	.text.windows
	.ftrace1
WSAAddressToString:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAAddressToStringW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAAddressToStringW
	ldr	x16,[x16,#:lo12:__imp_WSAAddressToStringW]
	br	x16
#endif
	.endfn	WSAAddressToString,globl
	.previous
