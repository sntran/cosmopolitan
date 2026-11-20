#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetBestRoute,GetBestRoute

	.text.windows
	.ftrace1
GetBestRoute:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetBestRoute(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetBestRoute
	ldr	x16,[x16,#:lo12:__imp_GetBestRoute]
	br	x16
#endif
	.endfn	GetBestRoute,globl
	.previous
