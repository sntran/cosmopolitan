#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegDeleteValueW,RegDeleteValueW

	.text.windows
	.ftrace1
RegDeleteValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegDeleteValueW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegDeleteValueW
	ldr	x16,[x16,#:lo12:__imp_RegDeleteValueW]
	br	x16
#endif
	.endfn	RegDeleteValue,globl
	.previous
