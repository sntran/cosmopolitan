#include "libc/nt/ntdllimport.h"
.ntimp	NtMapViewOfSection,NtMapViewOfSection

	.text.windows
	.ftrace1
NtMapViewOfSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtMapViewOfSection(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_NtMapViewOfSection
	ldr	x16,[x16,#:lo12:__imp_NtMapViewOfSection]
	br	x16
#endif
	.endfn	NtMapViewOfSection,globl
	.previous
