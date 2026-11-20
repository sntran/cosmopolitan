#include "libc/nt/codegen.h"
.imp	kernel32,__imp_MultiByteToWideChar,MultiByteToWideChar

	.text.windows
	.ftrace1
MultiByteToWideChar:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MultiByteToWideChar(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_MultiByteToWideChar
	ldr	x16,[x16,#:lo12:__imp_MultiByteToWideChar]
	br	x16
#endif
	.endfn	MultiByteToWideChar,globl
	.previous
