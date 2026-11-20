#include "libc/nt/codegen.h"
.imp	advapi32,__imp_AccessCheck,AccessCheck

	.text.windows
	.ftrace1
AccessCheck:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AccessCheck(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_AccessCheck
	ldr	x16,[x16,#:lo12:__imp_AccessCheck]
	br	x16
#endif
	.endfn	AccessCheck,globl
	.previous
