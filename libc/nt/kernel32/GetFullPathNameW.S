#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetFullPathNameW,GetFullPathNameW

	.text.windows
	.ftrace1
GetFullPathName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetFullPathNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetFullPathNameW
	ldr	x16,[x16,#:lo12:__imp_GetFullPathNameW]
	br	x16
#endif
	.endfn	GetFullPathName,globl
	.previous
