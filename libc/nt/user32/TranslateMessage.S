#include "libc/nt/codegen.h"
.imp	user32,__imp_TranslateMessage,TranslateMessage

	.text.windows
	.ftrace1
TranslateMessage:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_TranslateMessage(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_TranslateMessage
	ldr	x16,[x16,#:lo12:__imp_TranslateMessage]
	br	x16
#endif
	ret
	.endfn	TranslateMessage,globl
	.previous
