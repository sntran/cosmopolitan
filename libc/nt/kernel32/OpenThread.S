#include "libc/nt/codegen.h"
.imp	kernel32,__imp_OpenThread,OpenThread

	.text.windows
	.ftrace1
OpenThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_OpenThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_OpenThread
	ldr	x16,[x16,#:lo12:__imp_OpenThread]
	br	x16
#endif
	.endfn	OpenThread,globl
	.previous
