#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryAttributesFile,NtQueryAttributesFile

	.text.windows
	.ftrace1
NtQueryAttributesFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryAttributesFile(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryAttributesFile
	ldr	x16,[x16,#:lo12:__imp_NtQueryAttributesFile]
	br	x16
#endif
	.endfn	NtQueryAttributesFile,globl
	.previous
