#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FreeEnvironmentStringsW,FreeEnvironmentStringsW

	.text.windows
	.ftrace1
FreeEnvironmentStrings:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_FreeEnvironmentStringsW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_FreeEnvironmentStringsW
	ldr	x16,[x16,#:lo12:__imp_FreeEnvironmentStringsW]
	br	x16
#endif
	ret
	.endfn	FreeEnvironmentStrings,globl
	.previous
