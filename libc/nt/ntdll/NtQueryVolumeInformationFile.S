#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryVolumeInformationFile,NtQueryVolumeInformationFile

	.text.windows
	.ftrace1
NtQueryVolumeInformationFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryVolumeInformationFile(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryVolumeInformationFile
	ldr	x16,[x16,#:lo12:__imp_NtQueryVolumeInformationFile]
	br	x16
#endif
	.endfn	NtQueryVolumeInformationFile,globl
	.previous
