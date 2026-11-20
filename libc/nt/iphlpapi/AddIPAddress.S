#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_AddIPAddress,AddIPAddress

	.text.windows
	.ftrace1
AddIPAddress:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AddIPAddress(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_AddIPAddress
	ldr	x16,[x16,#:lo12:__imp_AddIPAddress]
	br	x16
#endif
	.endfn	AddIPAddress,globl
	.previous
