#include "libc/nt/codegen.h"
.imp	user32,__imp_RegisterClassW,RegisterClassW

	.text.windows
	.ftrace1
RegisterClass:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegisterClassW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegisterClassW
	ldr	x16,[x16,#:lo12:__imp_RegisterClassW]
	br	x16
#endif
	ret
	.endfn	RegisterClass,globl
	.previous
