#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryObject,NtQueryObject

	.text.windows
	.ftrace1
NtQueryObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryObject(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryObject
	ldr	x16,[x16,#:lo12:__imp_NtQueryObject]
	br	x16
#endif
	.endfn	NtQueryObject,globl
	.previous
