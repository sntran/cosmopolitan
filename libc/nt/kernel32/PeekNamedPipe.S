#include "libc/nt/codegen.h"
.imp	kernel32,__imp_PeekNamedPipe,PeekNamedPipe

	.text.windows
	.ftrace1
PeekNamedPipe:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PeekNamedPipe(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_PeekNamedPipe
	ldr	x16,[x16,#:lo12:__imp_PeekNamedPipe]
	br	x16
#endif
	.endfn	PeekNamedPipe,globl
	.previous
