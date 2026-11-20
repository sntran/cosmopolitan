#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetBestInterface,GetBestInterface

	.text.windows
	.ftrace1
GetBestInterface:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetBestInterface(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetBestInterface
	ldr	x16,[x16,#:lo12:__imp_GetBestInterface]
	br	x16
#endif
	.endfn	GetBestInterface,globl
	.previous
