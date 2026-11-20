#include "libc/nt/codegen.h"
.imp	gdi32,__imp_CreateDIBSection,CreateDIBSection

	.text.windows
	.ftrace1
CreateDIBSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateDIBSection(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateDIBSection
	ldr	x16,[x16,#:lo12:__imp_CreateDIBSection]
	br	x16
#endif
	.endfn	CreateDIBSection,globl
	.previous
