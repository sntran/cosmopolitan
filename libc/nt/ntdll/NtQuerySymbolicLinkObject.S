#include "libc/nt/ntdllimport.h"
.ntimp	NtQuerySymbolicLinkObject,NtQuerySymbolicLinkObject

	.text.windows
	.ftrace1
NtQuerySymbolicLinkObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQuerySymbolicLinkObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQuerySymbolicLinkObject
	ldr	x16,[x16,#:lo12:__imp_NtQuerySymbolicLinkObject]
	br	x16
#endif
	.endfn	NtQuerySymbolicLinkObject,globl
	.previous
