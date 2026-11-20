#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenSection,NtOpenSection

	.text.windows
	.ftrace1
NtOpenSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenSection(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenSection
	ldr	x16,[x16,#:lo12:__imp_NtOpenSection]
	br	x16
#endif
	.endfn	NtOpenSection,globl
	.previous
