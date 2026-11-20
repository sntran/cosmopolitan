#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenProcessToken,NtOpenProcessToken

	.text.windows
	.ftrace1
NtOpenProcessToken:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenProcessToken(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenProcessToken
	ldr	x16,[x16,#:lo12:__imp_NtOpenProcessToken]
	br	x16
#endif
	.endfn	NtOpenProcessToken,globl
	.previous
