#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryInformationFile,NtQueryInformationFile

	.text.windows
	.ftrace1
NtQueryInformationFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryInformationFile(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryInformationFile
	ldr	x16,[x16,#:lo12:__imp_NtQueryInformationFile]
	br	x16
#endif
	.endfn	NtQueryInformationFile,globl
	.previous
