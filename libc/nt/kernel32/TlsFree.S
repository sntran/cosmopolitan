#include "libc/nt/codegen.h"
.imp	kernel32,__imp_TlsFree,TlsFree

	.text.windows
	.ftrace1
TlsFree:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_TlsFree(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_TlsFree
	ldr	x16,[x16,#:lo12:__imp_TlsFree]
	br	x16
#endif
	ret
	.endfn	TlsFree,globl
	.previous
