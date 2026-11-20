#include "libc/nt/codegen.h"
.imp	user32,__imp_CallNextHookEx,CallNextHookEx

	.text.windows
	.ftrace1
CallNextHookEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CallNextHookEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CallNextHookEx
	ldr	x16,[x16,#:lo12:__imp_CallNextHookEx]
	br	x16
#endif
	.endfn	CallNextHookEx,globl
	.previous
