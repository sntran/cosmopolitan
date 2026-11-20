#include "libc/nt/codegen.h"
.imp	shell32,__imp_DragFinish,DragFinish

	.text.windows
	.ftrace1
DragFinish:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_DragFinish(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_DragFinish
	ldr	x16,[x16,#:lo12:__imp_DragFinish]
	br	x16
#endif
	ret
	.endfn	DragFinish,globl
	.previous
