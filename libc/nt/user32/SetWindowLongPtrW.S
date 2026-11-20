#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowLongPtrW,SetWindowLongPtrW

	.text.windows
	.ftrace1
SetWindowLongPtr:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowLongPtrW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowLongPtrW
	ldr	x16,[x16,#:lo12:__imp_SetWindowLongPtrW]
	br	x16
#endif
	.endfn	SetWindowLongPtr,globl
	.previous
