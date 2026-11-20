#include "libc/nt/codegen.h"
.imp	kernel32,__imp_UnmapViewOfFile2,UnmapViewOfFile2

	.text.windows
	.ftrace1
UnmapViewOfFile2:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_UnmapViewOfFile2(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_UnmapViewOfFile2
	ldr	x16,[x16,#:lo12:__imp_UnmapViewOfFile2]
	br	x16
#endif
	.endfn	UnmapViewOfFile2,globl
	.previous
