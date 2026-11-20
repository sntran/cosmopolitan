#include "libc/nt/codegen.h"
.imp	psapi,__imp_EnumProcessModulesEx,EnumProcessModulesEx

	.text.windows
	.ftrace1
EnumProcessModulesEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_EnumProcessModulesEx(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_EnumProcessModulesEx
	ldr	x16,[x16,#:lo12:__imp_EnumProcessModulesEx]
	br	x16
#endif
	.endfn	EnumProcessModulesEx,globl
	.previous
