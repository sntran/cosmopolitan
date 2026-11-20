#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FormatMessageA,FormatMessageA

	.text.windows
	.ftrace1
FormatMessageA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_FormatMessageA(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_FormatMessageA
	ldr	x16,[x16,#:lo12:__imp_FormatMessageA]
	br	x16
#endif
	.endfn	FormatMessageA,globl
	.previous
