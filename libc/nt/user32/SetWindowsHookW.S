#include "libc/nt/codegen.h"
.imp	user32,__imp_SetWindowsHookW,SetWindowsHookW

	.text.windows
	.ftrace1
SetWindowsHook:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetWindowsHookW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetWindowsHookW
	ldr	x16,[x16,#:lo12:__imp_SetWindowsHookW]
	br	x16
#endif
	.endfn	SetWindowsHook,globl
	.previous
