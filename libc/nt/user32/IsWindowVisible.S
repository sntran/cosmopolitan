#include "libc/nt/codegen.h"
.imp	user32,__imp_IsWindowVisible,IsWindowVisible

	.text.windows
	.ftrace1
IsWindowVisible:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_IsWindowVisible(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_IsWindowVisible
	ldr	x16,[x16,#:lo12:__imp_IsWindowVisible]
	br	x16
#endif
	ret
	.endfn	IsWindowVisible,globl
	.previous
