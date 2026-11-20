#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegCreateKeyW,RegCreateKeyW

	.text.windows
	.ftrace1
RegCreateKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegCreateKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegCreateKeyW
	ldr	x16,[x16,#:lo12:__imp_RegCreateKeyW]
	br	x16
#endif
	.endfn	RegCreateKey,globl
	.previous
