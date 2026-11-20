#include "libc/nt/codegen.h"
.imp	advapi32,__imp_GetUserNameW,GetUserNameW

	.text.windows
	.ftrace1
GetUserName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetUserNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetUserNameW
	ldr	x16,[x16,#:lo12:__imp_GetUserNameW]
	br	x16
#endif
	.endfn	GetUserName,globl
	.previous
