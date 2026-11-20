#include "libc/nt/codegen.h"
.imp	user32,__imp_GetWindow,GetWindow

	.text.windows
	.ftrace1
GetWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetWindow(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetWindow
	ldr	x16,[x16,#:lo12:__imp_GetWindow]
	br	x16
#endif
	.endfn	GetWindow,globl
	.previous
