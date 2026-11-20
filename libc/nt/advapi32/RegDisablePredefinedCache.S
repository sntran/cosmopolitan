#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegDisablePredefinedCache,RegDisablePredefinedCache

	.text.windows
	.ftrace1
RegDisablePredefinedCache:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegDisablePredefinedCache(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegDisablePredefinedCache
	ldr	x16,[x16,#:lo12:__imp_RegDisablePredefinedCache]
	br	x16
#endif
	ret
	.endfn	RegDisablePredefinedCache,globl
	.previous
