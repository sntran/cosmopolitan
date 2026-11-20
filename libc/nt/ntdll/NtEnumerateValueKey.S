#include "libc/nt/ntdllimport.h"
.ntimp	NtEnumerateValueKey,NtEnumerateValueKey

	.text.windows
	.ftrace1
NtEnumerateValueKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtEnumerateValueKey(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtEnumerateValueKey
	ldr	x16,[x16,#:lo12:__imp_NtEnumerateValueKey]
	br	x16
#endif
	.endfn	NtEnumerateValueKey,globl
	.previous
