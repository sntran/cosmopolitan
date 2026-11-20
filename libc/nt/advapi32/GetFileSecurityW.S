#include "libc/nt/codegen.h"
.imp	advapi32,__imp_GetFileSecurityW,GetFileSecurityW

	.text.windows
	.ftrace1
GetFileSecurity:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetFileSecurityW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetFileSecurityW
	ldr	x16,[x16,#:lo12:__imp_GetFileSecurityW]
	br	x16
#endif
	.endfn	GetFileSecurity,globl
	.previous
