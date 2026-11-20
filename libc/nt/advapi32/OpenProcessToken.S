#include "libc/nt/codegen.h"
.imp	advapi32,__imp_OpenProcessToken,OpenProcessToken

	.text.windows
	.ftrace1
OpenProcessToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_OpenProcessToken(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_OpenProcessToken
	ldr	x16,[x16,#:lo12:__imp_OpenProcessToken]
	br	x16
#endif
	.endfn	OpenProcessToken,globl
	.previous
