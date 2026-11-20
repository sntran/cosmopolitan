#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryInformationJobObject,NtQueryInformationJobObject

	.text.windows
	.ftrace1
NtQueryInformationJobObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryInformationJobObject(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryInformationJobObject
	ldr	x16,[x16,#:lo12:__imp_NtQueryInformationJobObject]
	br	x16
#endif
	.endfn	NtQueryInformationJobObject,globl
	.previous
