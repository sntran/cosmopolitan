#include "libc/nt/codegen.h"
.imp	user32,__imp_MonitorFromWindow,MonitorFromWindow

	.text.windows
	.ftrace1
MonitorFromWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MonitorFromWindow(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_MonitorFromWindow
	ldr	x16,[x16,#:lo12:__imp_MonitorFromWindow]
	br	x16
#endif
	.endfn	MonitorFromWindow,globl
	.previous
