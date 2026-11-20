#include "libc/nt/codegen.h"
.imp	user32,__imp_ShowWindow,ShowWindow

	.text.windows
	.ftrace1
ShowWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ShowWindow(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ShowWindow
	ldr	x16,[x16,#:lo12:__imp_ShowWindow]
	br	x16
#endif
	.endfn	ShowWindow,globl
	.previous
