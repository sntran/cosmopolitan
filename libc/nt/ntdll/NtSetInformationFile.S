#include "libc/nt/ntdllimport.h"
.ntimp	NtSetInformationFile,NtSetInformationFile

	.text.windows
	.ftrace1
NtSetInformationFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSetInformationFile(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSetInformationFile
	ldr	x16,[x16,#:lo12:__imp_NtSetInformationFile]
	br	x16
#endif
	.endfn	NtSetInformationFile,globl
	.previous
