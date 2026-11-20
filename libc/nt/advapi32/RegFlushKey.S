#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegFlushKey,RegFlushKey

	.text.windows
	.ftrace1
RegFlushKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegFlushKey(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegFlushKey
	ldr	x16,[x16,#:lo12:__imp_RegFlushKey]
	br	x16
#endif
	ret
	.endfn	RegFlushKey,globl
	.previous
