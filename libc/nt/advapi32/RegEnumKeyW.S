#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegEnumKeyW,RegEnumKeyW

	.text.windows
	.ftrace1
RegEnumKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegEnumKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegEnumKeyW
	ldr	x16,[x16,#:lo12:__imp_RegEnumKeyW]
	br	x16
#endif
	.endfn	RegEnumKey,globl
	.previous
