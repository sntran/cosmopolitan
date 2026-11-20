#include "libc/nt/ntdllimport.h"
.ntimp	ZwAreMappedFilesTheSame,ZwAreMappedFilesTheSame

	.text.windows
	.ftrace1
ZwAreMappedFilesTheSame:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ZwAreMappedFilesTheSame(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ZwAreMappedFilesTheSame
	ldr	x16,[x16,#:lo12:__imp_ZwAreMappedFilesTheSame]
	br	x16
#endif
	.endfn	ZwAreMappedFilesTheSame,globl
	.previous
