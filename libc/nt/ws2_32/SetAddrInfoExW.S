#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_SetAddrInfoExW,SetAddrInfoExW

	.text.windows
	.ftrace1
SetAddrInfoEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetAddrInfoExW(%rip),%rax
	jmp	__sysv2nt12
#elif defined(__aarch64__)
	adrp	x16,__imp_SetAddrInfoExW
	ldr	x16,[x16,#:lo12:__imp_SetAddrInfoExW]
	br	x16
#endif
	.endfn	SetAddrInfoEx,globl
	.previous
