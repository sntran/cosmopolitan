#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryInformationToken,NtQueryInformationToken

	.text.windows
	.ftrace1
NtQueryInformationToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryInformationToken(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryInformationToken
	ldr	x16,[x16,#:lo12:__imp_NtQueryInformationToken]
	br	x16
#endif
	.endfn	NtQueryInformationToken,globl
	.previous
