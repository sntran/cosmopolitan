#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSASend,WSASend

	.text.windows
	.ftrace1
WSASend:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSASend(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_WSASend
	ldr	x16,[x16,#:lo12:__imp_WSASend]
	br	x16
#endif
	.endfn	WSASend,globl
	.previous
