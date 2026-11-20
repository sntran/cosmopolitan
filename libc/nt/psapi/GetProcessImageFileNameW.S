#include "libc/nt/codegen.h"
.imp	psapi,__imp_GetProcessImageFileNameW,GetProcessImageFileNameW

	.text.windows
	.ftrace1
GetProcessImageFileName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetProcessImageFileNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetProcessImageFileNameW
	ldr	x16,[x16,#:lo12:__imp_GetProcessImageFileNameW]
	br	x16
#endif
	.endfn	GetProcessImageFileName,globl
	.previous
