#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSALookupServiceBeginW,WSALookupServiceBeginW

	.text.windows
	.ftrace1
WSALookupServiceBegin:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSALookupServiceBeginW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSALookupServiceBeginW
	ldr	x16,[x16,#:lo12:__imp_WSALookupServiceBeginW]
	br	x16
#endif
	.endfn	WSALookupServiceBegin,globl
	.previous
