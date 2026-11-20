#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetWindowsDirectoryW,GetWindowsDirectoryW

	.text.windows
	.ftrace1
GetWindowsDirectory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetWindowsDirectoryW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetWindowsDirectoryW
	ldr	x16,[x16,#:lo12:__imp_GetWindowsDirectoryW]
	br	x16
#endif
	.endfn	GetWindowsDirectory,globl
	.previous
