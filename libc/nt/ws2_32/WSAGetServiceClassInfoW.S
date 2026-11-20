#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAGetServiceClassInfoW,WSAGetServiceClassInfoW

	.text.windows
	.ftrace1
WSAGetServiceClassInfo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAGetServiceClassInfoW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAGetServiceClassInfoW
	ldr	x16,[x16,#:lo12:__imp_WSAGetServiceClassInfoW]
	br	x16
#endif
	.endfn	WSAGetServiceClassInfo,globl
	.previous
