#include "libc/nt/codegen.h"
.imp	user32,__imp_MessageBoxW,MessageBoxW

	.text.windows
	.ftrace1
MessageBox:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MessageBoxW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_MessageBoxW
	ldr	x16,[x16,#:lo12:__imp_MessageBoxW]
	br	x16
#endif
	.endfn	MessageBox,globl
	.previous
