#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_GetHostNameW,GetHostNameW

	.text.windows
	.ftrace1
GetHostName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetHostNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetHostNameW
	ldr	x16,[x16,#:lo12:__imp_GetHostNameW]
	br	x16
#endif
	.endfn	GetHostName,globl
	.previous
