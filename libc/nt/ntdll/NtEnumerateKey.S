#include "libc/nt/ntdllimport.h"
.ntimp	NtEnumerateKey,NtEnumerateKey

	.text.windows
	.ftrace1
NtEnumerateKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtEnumerateKey(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtEnumerateKey
	ldr	x16,[x16,#:lo12:__imp_NtEnumerateKey]
	br	x16
#endif
	.endfn	NtEnumerateKey,globl
	.previous
