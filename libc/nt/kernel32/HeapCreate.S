#include "libc/nt/codegen.h"
.imp	kernel32,__imp_HeapCreate,HeapCreate

	.text.windows
	.ftrace1
HeapCreate:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_HeapCreate(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_HeapCreate
	ldr	x16,[x16,#:lo12:__imp_HeapCreate]
	br	x16
#endif
	.endfn	HeapCreate,globl
	.previous
