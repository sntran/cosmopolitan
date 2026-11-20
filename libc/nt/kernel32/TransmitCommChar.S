#include "libc/nt/codegen.h"
.imp	kernel32,__imp_TransmitCommChar,TransmitCommChar

	.text.windows
	.ftrace1
TransmitCommChar:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_TransmitCommChar(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_TransmitCommChar
	ldr	x16,[x16,#:lo12:__imp_TransmitCommChar]
	br	x16
#endif
	.endfn	TransmitCommChar,globl
	.previous
