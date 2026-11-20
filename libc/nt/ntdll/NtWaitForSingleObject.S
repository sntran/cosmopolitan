#include "libc/nt/ntdllimport.h"
.ntimp	NtWaitForSingleObject,NtWaitForSingleObject

	.text.windows
	.ftrace1
NtWaitForSingleObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtWaitForSingleObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtWaitForSingleObject
	ldr	x16,[x16,#:lo12:__imp_NtWaitForSingleObject]
	br	x16
#endif
	.endfn	NtWaitForSingleObject,globl
	.previous
