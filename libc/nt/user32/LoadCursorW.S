#include "libc/nt/codegen.h"
.imp	user32,__imp_LoadCursorW,LoadCursorW

	.text.windows
	.ftrace1
LoadCursor:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_LoadCursorW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_LoadCursorW
	ldr	x16,[x16,#:lo12:__imp_LoadCursorW]
	br	x16
#endif
	.endfn	LoadCursor,globl
	.previous
