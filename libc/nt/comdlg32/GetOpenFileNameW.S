#include "libc/nt/codegen.h"
.imp	comdlg32,__imp_GetOpenFileNameW,GetOpenFileNameW

	.text.windows
	.ftrace1
GetOpenFileName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetOpenFileNameW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetOpenFileNameW
	ldr	x16,[x16,#:lo12:__imp_GetOpenFileNameW]
	br	x16
#endif
	ret
	.endfn	GetOpenFileName,globl
	.previous
