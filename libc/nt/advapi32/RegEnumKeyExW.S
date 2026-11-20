#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegEnumKeyExW,RegEnumKeyExW

	.text.windows
	.ftrace1
RegEnumKeyEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegEnumKeyExW(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_RegEnumKeyExW
	ldr	x16,[x16,#:lo12:__imp_RegEnumKeyExW]
	br	x16
#endif
	.endfn	RegEnumKeyEx,globl
	.previous
