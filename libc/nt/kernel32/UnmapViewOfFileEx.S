#include "libc/nt/codegen.h"
.imp	kernel32,__imp_UnmapViewOfFileEx,UnmapViewOfFileEx

	.text.windows
	.ftrace1
UnmapViewOfFileEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_UnmapViewOfFileEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_UnmapViewOfFileEx
	ldr	x16,[x16,#:lo12:__imp_UnmapViewOfFileEx]
	br	x16
#endif
	.endfn	UnmapViewOfFileEx,globl
	.previous
