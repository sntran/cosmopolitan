#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetAdapterIndex,GetAdapterIndex

	.text.windows
	.ftrace1
GetAdapterIndex:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetAdapterIndex(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetAdapterIndex
	ldr	x16,[x16,#:lo12:__imp_GetAdapterIndex]
	br	x16
#endif
	.endfn	GetAdapterIndex,globl
	.previous
