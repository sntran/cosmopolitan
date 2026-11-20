#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_GetAddrInfoExW,GetAddrInfoExW

	.text.windows
	.ftrace1
GetAddrInfoEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetAddrInfoExW(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_GetAddrInfoExW
	ldr	x16,[x16,#:lo12:__imp_GetAddrInfoExW]
	br	x16
#endif
	.endfn	GetAddrInfoEx,globl
	.previous
