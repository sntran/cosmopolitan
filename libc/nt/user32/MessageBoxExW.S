#include "libc/nt/codegen.h"
.imp	user32,__imp_MessageBoxExW,MessageBoxExW

	.text.windows
	.ftrace1
MessageBoxEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MessageBoxExW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_MessageBoxExW
	ldr	x16,[x16,#:lo12:__imp_MessageBoxExW]
	br	x16
#endif
	.endfn	MessageBoxEx,globl
	.previous
