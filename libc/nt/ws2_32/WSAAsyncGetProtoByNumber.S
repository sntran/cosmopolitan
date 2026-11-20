#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAAsyncGetProtoByNumber,WSAAsyncGetProtoByNumber

	.text.windows
	.ftrace1
WSAAsyncGetProtoByNumber:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAAsyncGetProtoByNumber(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAAsyncGetProtoByNumber
	ldr	x16,[x16,#:lo12:__imp_WSAAsyncGetProtoByNumber]
	br	x16
#endif
	.endfn	WSAAsyncGetProtoByNumber,globl
	.previous
