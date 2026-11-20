#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_GetAddrInfoW,GetAddrInfoW

	.text.windows
	.ftrace1
GetAddrInfo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetAddrInfoW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetAddrInfoW
	ldr	x16,[x16,#:lo12:__imp_GetAddrInfoW]
	br	x16
#endif
	.endfn	GetAddrInfo,globl
	.previous
