#include "libc/nt/codegen.h"
.imp	gdi32,__imp_SetPixelFormat,SetPixelFormat

	.text.windows
	.ftrace1
SetPixelFormat:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetPixelFormat(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetPixelFormat
	ldr	x16,[x16,#:lo12:__imp_SetPixelFormat]
	br	x16
#endif
	.endfn	SetPixelFormat,globl
	.previous
