#include "libc/nt/ntdllimport.h"
.ntimp	NtQuerySystemInformation,NtQuerySystemInformation

	.text.windows
	.ftrace1
NtQuerySystemInformation:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQuerySystemInformation(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQuerySystemInformation
	ldr	x16,[x16,#:lo12:__imp_NtQuerySystemInformation]
	br	x16
#endif
	.endfn	NtQuerySystemInformation,globl
	.previous
