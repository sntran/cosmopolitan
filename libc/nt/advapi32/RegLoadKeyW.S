#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegLoadKeyW,RegLoadKeyW

	.text.windows
	.ftrace1
RegLoadKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegLoadKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegLoadKeyW
	ldr	x16,[x16,#:lo12:__imp_RegLoadKeyW]
	br	x16
#endif
	.endfn	RegLoadKey,globl
	.previous
