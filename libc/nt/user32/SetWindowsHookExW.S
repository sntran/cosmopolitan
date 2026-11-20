#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowsHookExW,SetWindowsHookExW

	.text.windows
	.ftrace1
SetWindowsHookEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowsHookExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowsHookExW
	ldr	x16,[x16,#:lo12:__imp_SetWindowsHookExW]
	br	x16
#endif
	.endfn	SetWindowsHookEx,globl
	.previous
