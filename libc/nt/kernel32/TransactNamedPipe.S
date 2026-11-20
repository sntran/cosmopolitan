#include "libc/nt/codegen.h"
.imp	kernel32,__imp_TransactNamedPipe,TransactNamedPipe

	.text.windows
	.ftrace1
TransactNamedPipe:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_TransactNamedPipe(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_TransactNamedPipe
	ldr	x16,[x16,#:lo12:__imp_TransactNamedPipe]
	br	x16
#endif
	.endfn	TransactNamedPipe,globl
	.previous
