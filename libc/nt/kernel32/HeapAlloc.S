#include "libc/nt/codegen.h"
.imp	kernel32,__imp_HeapAlloc,HeapAlloc

	.text.windows
	.ftrace1
HeapAlloc:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_HeapAlloc(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_HeapAlloc
	ldr	x16,[x16,#:lo12:__imp_HeapAlloc]
	br	x16
#endif
	.endfn	HeapAlloc,globl
	.previous
