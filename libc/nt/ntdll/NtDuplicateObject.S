#include "libc/nt/ntdllimport.h"
.ntimp	NtDuplicateObject,NtDuplicateObject

	.text.windows
	.ftrace1
NtDuplicateObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtDuplicateObject(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_NtDuplicateObject
	ldr	x16,[x16,#:lo12:__imp_NtDuplicateObject]
	br	x16
#endif
	.endfn	NtDuplicateObject,globl
	.previous
