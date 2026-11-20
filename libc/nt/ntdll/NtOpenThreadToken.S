#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenThreadToken,NtOpenThreadToken

	.text.windows
	.ftrace1
NtOpenThreadToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenThreadToken(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenThreadToken
	ldr	x16,[x16,#:lo12:__imp_NtOpenThreadToken]
	br	x16
#endif
	.endfn	NtOpenThreadToken,globl
	.previous
