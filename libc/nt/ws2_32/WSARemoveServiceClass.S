#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSARemoveServiceClass,WSARemoveServiceClass

	.text.windows
	.ftrace1
WSARemoveServiceClass:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_WSARemoveServiceClass(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_WSARemoveServiceClass
	ldr	x16,[x16,#:lo12:__imp_WSARemoveServiceClass]
	br	x16
#endif
	ret
	.endfn	WSARemoveServiceClass,globl
	.previous
