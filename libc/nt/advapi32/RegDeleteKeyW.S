#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegDeleteKeyW,RegDeleteKeyW

	.text.windows
	.ftrace1
RegDeleteKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegDeleteKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegDeleteKeyW
	ldr	x16,[x16,#:lo12:__imp_RegDeleteKeyW]
	br	x16
#endif
	.endfn	RegDeleteKey,globl
	.previous
