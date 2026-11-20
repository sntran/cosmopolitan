#include "libc/nt/codegen.h"
.imp	user32,__imp_DrawTextExW,DrawTextExW

	.text.windows
	.ftrace1
DrawTextEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DrawTextExW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_DrawTextExW
	ldr	x16,[x16,#:lo12:__imp_DrawTextExW]
	br	x16
#endif
	.endfn	DrawTextEx,globl
	.previous
