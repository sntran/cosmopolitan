#include "libc/nt/codegen.h"
.imp	user32,__imp_SetClipboardData,SetClipboardData

	.text.windows
	.ftrace1
SetClipboardData:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetClipboardData(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetClipboardData
	ldr	x16,[x16,#:lo12:__imp_SetClipboardData]
	br	x16
#endif
	.endfn	SetClipboardData,globl
	.previous
