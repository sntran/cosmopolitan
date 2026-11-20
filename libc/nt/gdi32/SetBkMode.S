#include "libc/nt/codegen.h"
.imp	gdi32,__imp_SetBkMode,SetBkMode

	.text.windows
	.ftrace1
SetBkMode:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetBkMode(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetBkMode
	ldr	x16,[x16,#:lo12:__imp_SetBkMode]
	br	x16
#endif
	.endfn	SetBkMode,globl
	.previous
