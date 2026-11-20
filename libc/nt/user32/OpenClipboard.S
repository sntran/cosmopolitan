#include "libc/nt/codegen.h"
.imp	user32,__imp_OpenClipboard,OpenClipboard

	.text.windows
	.ftrace1
OpenClipboard:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_OpenClipboard(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_OpenClipboard
	ldr	x16,[x16,#:lo12:__imp_OpenClipboard]
	br	x16
#endif
	ret
	.endfn	OpenClipboard,globl
	.previous
