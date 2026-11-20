#include "libc/nt/ntdllimport.h"
.ntimp	CsrClientCallServer,CsrClientCallServer

	.text.windows
	.ftrace1
CsrClientCallServer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CsrClientCallServer(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CsrClientCallServer
	ldr	x16,[x16,#:lo12:__imp_CsrClientCallServer]
	br	x16
#endif
	.endfn	CsrClientCallServer,globl
	.previous
