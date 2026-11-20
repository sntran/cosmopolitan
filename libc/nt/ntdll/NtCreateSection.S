#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateSection,NtCreateSection

	.text.windows
	.ftrace1
NtCreateSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateSection(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateSection
	ldr	x16,[x16,#:lo12:__imp_NtCreateSection]
	br	x16
#endif
	.endfn	NtCreateSection,globl
	.previous
