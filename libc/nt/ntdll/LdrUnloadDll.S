#include "libc/nt/ntdllimport.h"
.ntimp	LdrUnloadDll,LdrUnloadDll

	.text.windows
	.ftrace1
LdrUnloadDll:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_LdrUnloadDll(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_LdrUnloadDll
	ldr	x16,[x16,#:lo12:__imp_LdrUnloadDll]
	br	x16
#endif
	ret
	.endfn	LdrUnloadDll,globl
	.previous
