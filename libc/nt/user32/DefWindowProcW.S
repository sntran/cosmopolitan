#include "libc/nt/codegen.h"
.imp	user32,__imp_DefWindowProcW,DefWindowProcW

	.text.windows
	.ftrace1
DefWindowProc:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DefWindowProcW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_DefWindowProcW
	ldr	x16,[x16,#:lo12:__imp_DefWindowProcW]
	br	x16
#endif
	.endfn	DefWindowProc,globl
	.previous
