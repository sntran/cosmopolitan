#include "libc/nt/codegen.h"
.imp	gdi32,__imp_CreateCompatibleBitmap,CreateCompatibleBitmap

	.text.windows
	.ftrace1
CreateCompatibleBitmap:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateCompatibleBitmap(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateCompatibleBitmap
	ldr	x16,[x16,#:lo12:__imp_CreateCompatibleBitmap]
	br	x16
#endif
	.endfn	CreateCompatibleBitmap,globl
	.previous
