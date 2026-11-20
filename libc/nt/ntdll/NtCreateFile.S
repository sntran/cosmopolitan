#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateFile,NtCreateFile

	.text.windows
	.ftrace1
NtCreateFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateFile(%rip),%rax
	jmp	__sysv2nt12
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateFile
	ldr	x16,[x16,#:lo12:__imp_NtCreateFile]
	br	x16
#endif
	.endfn	NtCreateFile,globl
	.previous
