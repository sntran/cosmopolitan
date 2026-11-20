#include "libc/nt/codegen.h"
.imp	gdi32,__imp_SetTextJustification,SetTextJustification

	.text.windows
	.ftrace1
SetTextJustification:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetTextJustification(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetTextJustification
	ldr	x16,[x16,#:lo12:__imp_SetTextJustification]
	br	x16
#endif
	.endfn	SetTextJustification,globl
	.previous
