#include "libc/nt/codegen.h"
.imp	comdlg32,__imp_ChooseFontW,ChooseFontW

	.text.windows
	.ftrace1
ChooseFont:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_ChooseFontW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_ChooseFontW
	ldr	x16,[x16,#:lo12:__imp_ChooseFontW]
	br	x16
#endif
	ret
	.endfn	ChooseFont,globl
	.previous
