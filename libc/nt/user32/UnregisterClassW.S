#include "libc/nt/codegen.h"
.imp	user32,__imp_UnregisterClassW,UnregisterClassW

	.text.windows
	.ftrace1
UnregisterClass:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_UnregisterClassW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_UnregisterClassW
	ldr	x16,[x16,#:lo12:__imp_UnregisterClassW]
	br	x16
#endif
	.endfn	UnregisterClass,globl
	.previous
