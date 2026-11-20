#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegDisableReflectionKey,RegDisableReflectionKey

	.text.windows
	.ftrace1
RegDisableReflectionKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegDisableReflectionKey(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegDisableReflectionKey
	ldr	x16,[x16,#:lo12:__imp_RegDisableReflectionKey]
	br	x16
#endif
	ret
	.endfn	RegDisableReflectionKey,globl
	.previous
