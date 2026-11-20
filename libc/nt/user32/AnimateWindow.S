#include "libc/nt/codegen.h"
.imp	user32,__imp_AnimateWindow,AnimateWindow

	.text.windows
	.ftrace1
AnimateWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AnimateWindow(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AnimateWindow
	ldr	x16,[x16,#:lo12:__imp_AnimateWindow]
	br	x16
#endif
	.endfn	AnimateWindow,globl
	.previous
