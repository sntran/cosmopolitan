#include "libc/nt/ntdllimport.h"
.ntimp	NtClose,NtClose

	.text.windows
	.ftrace1
NtClose:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_NtClose(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_NtClose
	ldr	x16,[x16,#:lo12:__imp_NtClose]
	br	x16
#endif
	ret
	.endfn	NtClose,globl
	.previous
