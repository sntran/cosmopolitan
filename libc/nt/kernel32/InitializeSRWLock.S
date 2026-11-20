#include "libc/nt/codegen.h"
.imp	kernel32,__imp_InitializeSRWLock,InitializeSRWLock

	.text.windows
	.ftrace1
InitializeSRWLock:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_InitializeSRWLock(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_InitializeSRWLock
	ldr	x16,[x16,#:lo12:__imp_InitializeSRWLock]
	br	x16
#endif
	ret
	.endfn	InitializeSRWLock,globl
	.previous
