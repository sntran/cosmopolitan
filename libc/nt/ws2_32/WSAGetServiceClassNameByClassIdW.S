#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_WSAGetServiceClassNameByClassIdW,WSAGetServiceClassNameByClassIdW

	.text.windows
	.ftrace1
WSAGetServiceClassNameByClassId:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WSAGetServiceClassNameByClassIdW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WSAGetServiceClassNameByClassIdW
	ldr	x16,[x16,#:lo12:__imp_WSAGetServiceClassNameByClassIdW]
	br	x16
#endif
	.endfn	WSAGetServiceClassNameByClassId,globl
	.previous
