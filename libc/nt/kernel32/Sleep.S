#include "libc/nt/codegen.h"
.imp	kernel32,__imp_Sleep,Sleep

	.text.windows
	.ftrace1
Sleep:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_Sleep(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_Sleep
	ldr	x16,[x16,#:lo12:__imp_Sleep]
	br	x16
#endif
	ret
	.endfn	Sleep,globl
	.previous
