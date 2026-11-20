#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegQueryInfoKeyW,RegQueryInfoKeyW

	.text.windows
	.ftrace1
RegQueryInfoKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegQueryInfoKeyW(%rip),%rax
	jmp	__sysv2nt12
#elif defined(__aarch64__)
	adrp	x16,__imp_RegQueryInfoKeyW
	ldr	x16,[x16,#:lo12:__imp_RegQueryInfoKeyW]
	br	x16
#endif
	.endfn	RegQueryInfoKey,globl
	.previous
