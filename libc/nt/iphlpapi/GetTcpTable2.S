#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetTcpTable2,GetTcpTable2

	.text.windows
	.ftrace1
GetTcpTable2:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetTcpTable2(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetTcpTable2
	ldr	x16,[x16,#:lo12:__imp_GetTcpTable2]
	br	x16
#endif
	.endfn	GetTcpTable2,globl
	.previous
