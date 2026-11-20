#include "libc/nt/codegen.h"
.imp	user32,__imp_GetClipboardData,GetClipboardData

	.text.windows
	.ftrace1
GetClipboardData:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetClipboardData(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetClipboardData
	ldr	x16,[x16,#:lo12:__imp_GetClipboardData]
	br	x16
#endif
	ret
	.endfn	GetClipboardData,globl
	.previous
