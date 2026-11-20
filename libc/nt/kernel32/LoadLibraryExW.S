#include "libc/nt/codegen.h"
.imp	kernel32,__imp_LoadLibraryExW,LoadLibraryExW

	.text.windows
	.ftrace1
LoadLibraryEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_LoadLibraryExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_LoadLibraryExW
	ldr	x16,[x16,#:lo12:__imp_LoadLibraryExW]
	br	x16
#endif
	.endfn	LoadLibraryEx,globl
	.previous
