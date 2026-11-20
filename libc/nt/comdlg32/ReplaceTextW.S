#include "libc/nt/codegen.h"
.imp	comdlg32,__imp_ReplaceTextW,ReplaceTextW

	.text.windows
	.ftrace1
ReplaceText:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_ReplaceTextW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_ReplaceTextW
	ldr	x16,[x16,#:lo12:__imp_ReplaceTextW]
	br	x16
#endif
	ret
	.endfn	ReplaceText,globl
	.previous
