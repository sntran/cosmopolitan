#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateKey,NtCreateKey

	.text.windows
	.ftrace1
NtCreateKey:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateKey(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateKey
	ldr	x16,[x16,#:lo12:__imp_NtCreateKey]
	br	x16
#endif
	.endfn	NtCreateKey,globl
	.previous
