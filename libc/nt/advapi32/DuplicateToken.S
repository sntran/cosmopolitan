#include "libc/nt/codegen.h"
.imp	advapi32,__imp_DuplicateToken,DuplicateToken

	.text.windows
	.ftrace1
DuplicateToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DuplicateToken(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_DuplicateToken
	ldr	x16,[x16,#:lo12:__imp_DuplicateToken]
	br	x16
#endif
	.endfn	DuplicateToken,globl
	.previous
