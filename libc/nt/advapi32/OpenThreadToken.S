#include "libc/nt/codegen.h"
.imp	advapi32,__imp_OpenThreadToken,OpenThreadToken

	.text.windows
	.ftrace1
OpenThreadToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_OpenThreadToken(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_OpenThreadToken
	ldr	x16,[x16,#:lo12:__imp_OpenThreadToken]
	br	x16
#endif
	.endfn	OpenThreadToken,globl
	.previous
