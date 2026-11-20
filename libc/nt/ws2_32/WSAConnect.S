#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAConnect,WSAConnect

	.text.windows
	.ftrace1
WSAConnect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAConnect(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAConnect
	ldr	x16,[x16,#:lo12:__imp_WSAConnect]
	br	x16
#endif
	.endfn	WSAConnect,globl
	.previous
