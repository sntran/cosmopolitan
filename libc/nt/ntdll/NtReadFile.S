#include "libc/nt/ntdllimport.h"
.ntimp	NtReadFile,NtReadFile

	.text.windows
	.ftrace1
NtReadFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtReadFile(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_NtReadFile
	ldr	x16,[x16,#:lo12:__imp_NtReadFile]
	br	x16
#endif
	.endfn	NtReadFile,globl
	.previous
