#include "libc/nt/codegen.h"
.imp	user32,__imp_DestroyWindow,DestroyWindow

	.text.windows
	.ftrace1
DestroyWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_DestroyWindow(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_DestroyWindow
	ldr	x16,[x16,#:lo12:__imp_DestroyWindow]
	br	x16
#endif
	ret
	.endfn	DestroyWindow,globl
	.previous
