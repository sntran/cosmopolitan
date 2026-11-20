#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenSymbolicLinkObject,NtOpenSymbolicLinkObject

	.text.windows
	.ftrace1
NtOpenSymbolicLinkObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenSymbolicLinkObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenSymbolicLinkObject
	ldr	x16,[x16,#:lo12:__imp_NtOpenSymbolicLinkObject]
	br	x16
#endif
	.endfn	NtOpenSymbolicLinkObject,globl
	.previous
