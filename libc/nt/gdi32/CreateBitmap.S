#include "libc/nt/codegen.h"
.imp	gdi32,__imp_CreateBitmap,CreateBitmap

	.text.windows
	.ftrace1
CreateBitmap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateBitmap(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateBitmap
	ldr	x16,[x16,#:lo12:__imp_CreateBitmap]
	br	x16
#endif
	.endfn	CreateBitmap,globl
	.previous
