#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegSaveKeyW,RegSaveKeyW

	.text.windows
	.ftrace1
RegSaveKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegSaveKeyW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegSaveKeyW
	ldr	x16,[x16,#:lo12:__imp_RegSaveKeyW]
	br	x16
#endif
	.endfn	RegSaveKey,globl
	.previous
