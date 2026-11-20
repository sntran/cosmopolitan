#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegQueryReflectionKey,RegQueryReflectionKey

	.text.windows
	.ftrace1
RegQueryReflectionKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegQueryReflectionKey(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegQueryReflectionKey
	ldr	x16,[x16,#:lo12:__imp_RegQueryReflectionKey]
	br	x16
#endif
	.endfn	RegQueryReflectionKey,globl
	.previous
