#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAGetLastError,WSAGetLastError

	.text.windows
	.ftrace1
WSAGetLastError:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_WSAGetLastError(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAGetLastError
	ldr	x16,[x16,#:lo12:__imp_WSAGetLastError]
	br	x16
#endif
	ret
	.endfn	WSAGetLastError,globl
	.previous
