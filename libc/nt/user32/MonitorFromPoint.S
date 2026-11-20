#include "libc/nt/codegen.h"
.imp	user32,__imp_MonitorFromPoint,MonitorFromPoint

	.text.windows
	.ftrace1
MonitorFromPoint:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MonitorFromPoint(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_MonitorFromPoint
	ldr	x16,[x16,#:lo12:__imp_MonitorFromPoint]
	br	x16
#endif
	.endfn	MonitorFromPoint,globl
	.previous
