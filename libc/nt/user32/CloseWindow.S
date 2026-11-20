#include "libc/nt/codegen.h"
.imp	user32,__imp_CloseWindow,CloseWindow

	.text.windows
	.ftrace1
CloseWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_CloseWindow(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_CloseWindow
	ldr	x16,[x16,#:lo12:__imp_CloseWindow]
	br	x16
#endif
	ret
	.endfn	CloseWindow,globl
	.previous
