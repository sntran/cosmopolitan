#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetTcpTable,GetTcpTable

	.text.windows
	.ftrace1
GetTcpTable:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetTcpTable(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetTcpTable
	ldr	x16,[x16,#:lo12:__imp_GetTcpTable]
	br	x16
#endif
	.endfn	GetTcpTable,globl
	.previous
