#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegGetValueW,RegGetValueW

	.text.windows
	.ftrace1
RegGetValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegGetValueW(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_RegGetValueW
	ldr	x16,[x16,#:lo12:__imp_RegGetValueW]
	br	x16
#endif
	.endfn	RegGetValue,globl
	.previous
