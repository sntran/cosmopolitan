#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegCloseKey,RegCloseKey

	.text.windows
	.ftrace1
RegCloseKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RegCloseKey(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RegCloseKey
	ldr	x16,[x16,#:lo12:__imp_RegCloseKey]
	br	x16
#endif
	ret
	.endfn	RegCloseKey,globl
	.previous
