#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAStartup,WSAStartup

	.text.windows
	.ftrace1
WSAStartup:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAStartup(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAStartup
	ldr	x16,[x16,#:lo12:__imp_WSAStartup]
	br	x16
#endif
	.endfn	WSAStartup,globl
	.previous
