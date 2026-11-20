#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegRestoreKeyW,RegRestoreKeyW

	.text.windows
	.ftrace1
RegRestoreKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegRestoreKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegRestoreKeyW
	ldr	x16,[x16,#:lo12:__imp_RegRestoreKeyW]
	br	x16
#endif
	.endfn	RegRestoreKey,globl
	.previous
