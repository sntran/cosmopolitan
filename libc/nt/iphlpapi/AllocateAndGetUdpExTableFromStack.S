#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_AllocateAndGetUdpExTableFromStack,AllocateAndGetUdpExTableFromStack

	.text.windows
	.ftrace1
AllocateAndGetUdpExTableFromStack:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AllocateAndGetUdpExTableFromStack(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_AllocateAndGetUdpExTableFromStack
	ldr	x16,[x16,#:lo12:__imp_AllocateAndGetUdpExTableFromStack]
	br	x16
#endif
	.endfn	AllocateAndGetUdpExTableFromStack,globl
	.previous
