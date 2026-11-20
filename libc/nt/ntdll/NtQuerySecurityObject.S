#include "libc/nt/ntdllimport.h"
.ntimp	NtQuerySecurityObject,NtQuerySecurityObject

	.text.windows
	.ftrace1
NtQuerySecurityObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQuerySecurityObject(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQuerySecurityObject
	ldr	x16,[x16,#:lo12:__imp_NtQuerySecurityObject]
	br	x16
#endif
	.endfn	NtQuerySecurityObject,globl
	.previous
