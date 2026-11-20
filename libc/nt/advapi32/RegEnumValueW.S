#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegEnumValueW,RegEnumValueW

	.text.windows
	.ftrace1
RegEnumValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegEnumValueW(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_RegEnumValueW
	ldr	x16,[x16,#:lo12:__imp_RegEnumValueW]
	br	x16
#endif
	.endfn	RegEnumValue,globl
	.previous
