#include "libc/nt/codegen.h"
.imp	user32,__imp_RedrawWindow,RedrawWindow

	.text.windows
	.ftrace1
RedrawWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RedrawWindow(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RedrawWindow
	ldr	x16,[x16,#:lo12:__imp_RedrawWindow]
	br	x16
#endif
	.endfn	RedrawWindow,globl
	.previous
