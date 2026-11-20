#include "libc/nt/codegen.h"
.imp	kernel32,__imp_HeapCompact,HeapCompact

	.text.windows
	.ftrace1
HeapCompact:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_HeapCompact(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_HeapCompact
	ldr	x16,[x16,#:lo12:__imp_HeapCompact]
	br	x16
#endif
	.endfn	HeapCompact,globl
	.previous
