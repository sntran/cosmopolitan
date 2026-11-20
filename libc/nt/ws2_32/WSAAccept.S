#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAAccept,WSAAccept

	.text.windows
	.ftrace1
WSAAccept:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAAccept(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAAccept
	ldr	x16,[x16,#:lo12:__imp_WSAAccept]
	br	x16
#endif
	.endfn	WSAAccept,globl
	.previous
