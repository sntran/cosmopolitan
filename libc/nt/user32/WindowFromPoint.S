#include "libc/nt/codegen.h"
.imp	user32,__imp_WindowFromPoint,WindowFromPoint

	.text.windows
	.ftrace1
WindowFromPoint:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_WindowFromPoint(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_WindowFromPoint
	ldr	x16,[x16,#:lo12:__imp_WindowFromPoint]
	br	x16
#endif
	ret
	.endfn	WindowFromPoint,globl
	.previous
