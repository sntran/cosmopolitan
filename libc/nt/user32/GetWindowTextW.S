#include "libc/nt/codegen.h"
.imp	user32,__imp_GetWindowTextW,GetWindowTextW

	.text.windows
	.ftrace1
GetWindowText:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetWindowTextW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetWindowTextW
	ldr	x16,[x16,#:lo12:__imp_GetWindowTextW]
	br	x16
#endif
	.endfn	GetWindowText,globl
	.previous
