#include "libc/nt/codegen.h"
.imp	comdlg32,__imp_ChooseColorW,ChooseColorW

	.text.windows
	.ftrace1
ChooseColor:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_ChooseColorW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_ChooseColorW
	ldr	x16,[x16,#:lo12:__imp_ChooseColorW]
	br	x16
#endif
	ret
	.endfn	ChooseColor,globl
	.previous
