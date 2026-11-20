#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSASetServiceW,WSASetServiceW

	.text.windows
	.ftrace1
WSASetService:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSASetServiceW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSASetServiceW
	ldr	x16,[x16,#:lo12:__imp_WSASetServiceW]
	br	x16
#endif
	.endfn	WSASetService,globl
	.previous
