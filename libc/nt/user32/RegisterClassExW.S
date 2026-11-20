#include "libc/nt/codegen.h"
.imp	user32,__imp_RegisterClassExW,RegisterClassExW

	.text.windows
	.ftrace1
RegisterClassEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegisterClassExW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegisterClassExW
	ldr	x16,[x16,#:lo12:__imp_RegisterClassExW]
	br	x16
#endif
	ret
	.endfn	RegisterClassEx,globl
	.previous
