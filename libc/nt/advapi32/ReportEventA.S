#include "libc/nt/codegen.h"
.imp	advapi32,__imp_ReportEventA,ReportEventA

	.text.windows
	.ftrace1
ReportEventA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReportEventA(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_ReportEventA
	ldr	x16,[x16,#:lo12:__imp_ReportEventA]
	br	x16
#endif
	.endfn	ReportEventA,globl
	.previous
