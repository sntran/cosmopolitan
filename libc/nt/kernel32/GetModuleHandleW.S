#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetModuleHandleW,GetModuleHandleW

	.text.windows
	.ftrace1
GetModuleHandleW:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetModuleHandleW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetModuleHandleW
	ldr	x16,[x16,#:lo12:__imp_GetModuleHandleW]
	br	x16
#endif
	ret
	.endfn	GetModuleHandleW,globl
	.previous
