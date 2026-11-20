#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryFullAttributesFile,NtQueryFullAttributesFile

	.text.windows
	.ftrace1
NtQueryFullAttributesFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryFullAttributesFile(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryFullAttributesFile
	ldr	x16,[x16,#:lo12:__imp_NtQueryFullAttributesFile]
	br	x16
#endif
	.endfn	NtQueryFullAttributesFile,globl
	.previous
