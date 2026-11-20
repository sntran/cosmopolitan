#include "libc/nt/codegen.h"
.imp	user32,__imp_UnhookWindowsHook,UnhookWindowsHook

	.text.windows
	.ftrace1
UnhookWindowsHook:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_UnhookWindowsHook(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_UnhookWindowsHook
	ldr	x16,[x16,#:lo12:__imp_UnhookWindowsHook]
	br	x16
#endif
	.endfn	UnhookWindowsHook,globl
	.previous
