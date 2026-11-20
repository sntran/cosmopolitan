#include "libc/nt/ntdllimport.h"
.ntimp	NtQuerySection,NtQuerySection

	.text.windows
	.ftrace1
NtQuerySection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQuerySection(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQuerySection
	ldr	x16,[x16,#:lo12:__imp_NtQuerySection]
	br	x16
#endif
	.endfn	NtQuerySection,globl
	.previous
