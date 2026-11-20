#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenKey,NtOpenKey

	.text.windows
	.ftrace1
NtOpenKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenKey(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenKey
	ldr	x16,[x16,#:lo12:__imp_NtOpenKey]
	br	x16
#endif
	.endfn	NtOpenKey,globl
	.previous
