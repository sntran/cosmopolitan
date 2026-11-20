#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_AllocateAndGetTcpExTableFromStack,AllocateAndGetTcpExTableFromStack

	.text.windows
	.ftrace1
AllocateAndGetTcpExTableFromStack:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AllocateAndGetTcpExTableFromStack(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_AllocateAndGetTcpExTableFromStack
	ldr	x16,[x16,#:lo12:__imp_AllocateAndGetTcpExTableFromStack]
	br	x16
#endif
	.endfn	AllocateAndGetTcpExTableFromStack,globl
	.previous
