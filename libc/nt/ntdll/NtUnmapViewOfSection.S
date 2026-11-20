#include "libc/nt/ntdllimport.h"
.ntimp	NtUnmapViewOfSection,NtUnmapViewOfSection

	.text.windows
	.ftrace1
NtUnmapViewOfSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtUnmapViewOfSection(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtUnmapViewOfSection
	ldr	x16,[x16,#:lo12:__imp_NtUnmapViewOfSection]
	br	x16
#endif
	.endfn	NtUnmapViewOfSection,globl
	.previous
