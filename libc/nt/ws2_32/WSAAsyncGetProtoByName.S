#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAAsyncGetProtoByName,WSAAsyncGetProtoByName

	.text.windows
	.ftrace1
WSAAsyncGetProtoByName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAAsyncGetProtoByName(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAAsyncGetProtoByName
	ldr	x16,[x16,#:lo12:__imp_WSAAsyncGetProtoByName]
	br	x16
#endif
	.endfn	WSAAsyncGetProtoByName,globl
	.previous
