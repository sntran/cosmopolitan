#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetAdaptersAddresses,GetAdaptersAddresses

	.text.windows
	.ftrace1
GetAdaptersAddresses:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetAdaptersAddresses(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetAdaptersAddresses
	ldr	x16,[x16,#:lo12:__imp_GetAdaptersAddresses]
	br	x16
#endif
	.endfn	GetAdaptersAddresses,globl
	.previous
