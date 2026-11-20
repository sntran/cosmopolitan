#include "libc/nt/ntdllimport.h"
.ntimp	NtStartProfile,NtStartProfile

	.text.windows
	.ftrace1
NtStartProfile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_NtStartProfile(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_NtStartProfile
	ldr	x16,[x16,#:lo12:__imp_NtStartProfile]
	br	x16
#endif
	ret
	.endfn	NtStartProfile,globl
	.previous
