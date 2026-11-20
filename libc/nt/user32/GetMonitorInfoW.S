#include "libc/nt/codegen.h"
.imp	user32,__imp_GetMonitorInfoW,GetMonitorInfoW

	.text.windows
	.ftrace1
GetMonitorInfo:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetMonitorInfoW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetMonitorInfoW
	ldr	x16,[x16,#:lo12:__imp_GetMonitorInfoW]
	br	x16
#endif
	.endfn	GetMonitorInfo,globl
	.previous
