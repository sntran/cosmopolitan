#include "libc/nt/codegen.h"
.imp	gdi32,__imp_ChoosePixelFormat,ChoosePixelFormat

	.text.windows
	.ftrace1
ChoosePixelFormat:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ChoosePixelFormat(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ChoosePixelFormat
	ldr	x16,[x16,#:lo12:__imp_ChoosePixelFormat]
	br	x16
#endif
	.endfn	ChoosePixelFormat,globl
	.previous
