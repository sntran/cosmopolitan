#include "libc/nt/codegen.h"
.imp	kernel32,__imp_LoadLibraryA,LoadLibraryA

	.text.windows
	.ftrace1
LoadLibraryA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_LoadLibraryA(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_LoadLibraryA
	ldr	x16,[x16,#:lo12:__imp_LoadLibraryA]
	br	x16
#endif
	ret
	.endfn	LoadLibraryA,globl
	.previous
