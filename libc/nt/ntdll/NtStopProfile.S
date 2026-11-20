#include "libc/nt/ntdllimport.h"
.ntimp	NtStopProfile,NtStopProfile

	.text.windows
	.ftrace1
NtStopProfile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_NtStopProfile(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_NtStopProfile
	ldr	x16,[x16,#:lo12:__imp_NtStopProfile]
	br	x16
#endif
	ret
	.endfn	NtStopProfile,globl
	.previous
