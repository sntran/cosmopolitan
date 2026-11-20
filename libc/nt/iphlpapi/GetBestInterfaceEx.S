#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetBestInterfaceEx,GetBestInterfaceEx

	.text.windows
	.ftrace1
GetBestInterfaceEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetBestInterfaceEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetBestInterfaceEx
	ldr	x16,[x16,#:lo12:__imp_GetBestInterfaceEx]
	br	x16
#endif
	.endfn	GetBestInterfaceEx,globl
	.previous
