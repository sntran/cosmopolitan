#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetModuleHandleExW,GetModuleHandleExW

	.text.windows
	.ftrace1
GetModuleHandleEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetModuleHandleExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetModuleHandleExW
	ldr	x16,[x16,#:lo12:__imp_GetModuleHandleExW]
	br	x16
#endif
	.endfn	GetModuleHandleEx,globl
	.previous
