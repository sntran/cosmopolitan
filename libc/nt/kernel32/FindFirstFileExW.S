#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FindFirstFileExW,FindFirstFileExW

	.text.windows
	.ftrace1
FindFirstFileEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_FindFirstFileExW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_FindFirstFileExW
	ldr	x16,[x16,#:lo12:__imp_FindFirstFileExW]
	br	x16
#endif
	.endfn	FindFirstFileEx,globl
	.previous
