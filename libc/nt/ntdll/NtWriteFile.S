#include "libc/nt/ntdllimport.h"
.ntimp	NtWriteFile,NtWriteFile

	.text.windows
	.ftrace1
NtWriteFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtWriteFile(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_NtWriteFile
	ldr	x16,[x16,#:lo12:__imp_NtWriteFile]
	br	x16
#endif
	.endfn	NtWriteFile,globl
	.previous
