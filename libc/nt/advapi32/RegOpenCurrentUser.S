#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegOpenCurrentUser,RegOpenCurrentUser

	.text.windows
	.ftrace1
RegOpenCurrentUser:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegOpenCurrentUser(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegOpenCurrentUser
	ldr	x16,[x16,#:lo12:__imp_RegOpenCurrentUser]
	br	x16
#endif
	.endfn	RegOpenCurrentUser,globl
	.previous
