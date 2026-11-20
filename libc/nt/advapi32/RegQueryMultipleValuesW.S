#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegQueryMultipleValuesW,RegQueryMultipleValuesW

	.text.windows
	.ftrace1
RegQueryMultipleValues:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegQueryMultipleValuesW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RegQueryMultipleValuesW
	ldr	x16,[x16,#:lo12:__imp_RegQueryMultipleValuesW]
	br	x16
#endif
	.endfn	RegQueryMultipleValues,globl
	.previous
