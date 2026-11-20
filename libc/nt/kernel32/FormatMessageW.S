#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FormatMessageW,FormatMessageW

	.text.windows
	.ftrace1
FormatMessage:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_FormatMessageW(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_FormatMessageW
	ldr	x16,[x16,#:lo12:__imp_FormatMessageW]
	br	x16
#endif
	.endfn	FormatMessage,globl
	.previous
