#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSACleanup,WSACleanup

	.text.windows
	.ftrace1
WSACleanup:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_WSACleanup(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_WSACleanup
	ldr	x16,[x16,#:lo12:__imp_WSACleanup]
	br	x16
#endif
	ret
	.endfn	WSACleanup,globl
	.previous
