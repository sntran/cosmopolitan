#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WaitForMultipleObjectsEx,WaitForMultipleObjectsEx

	.text.windows
	.ftrace1
WaitForMultipleObjectsEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WaitForMultipleObjectsEx(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WaitForMultipleObjectsEx
	ldr	x16,[x16,#:lo12:__imp_WaitForMultipleObjectsEx]
	br	x16
#endif
	.endfn	WaitForMultipleObjectsEx,globl
	.previous
