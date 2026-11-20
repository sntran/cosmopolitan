#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetComputerNameExW,GetComputerNameExW

	.text.windows
	.ftrace1
GetComputerNameEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetComputerNameExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetComputerNameExW
	ldr	x16,[x16,#:lo12:__imp_GetComputerNameExW]
	br	x16
#endif
	.endfn	GetComputerNameEx,globl
	.previous
