#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSASendDisconnect,WSASendDisconnect

	.text.windows
	.ftrace1
WSASendDisconnect:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSASendDisconnect(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSASendDisconnect
	ldr	x16,[x16,#:lo12:__imp_WSASendDisconnect]
	br	x16
#endif
	.endfn	WSASendDisconnect,globl
	.previous
