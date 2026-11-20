#include "libc/nt/ntdllimport.h"
.ntimp	NtFlushBuffersFile,NtFlushBuffersFile

	.text.windows
	.ftrace1
NtFlushBuffersFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtFlushBuffersFile(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtFlushBuffersFile
	ldr	x16,[x16,#:lo12:__imp_NtFlushBuffersFile]
	br	x16
#endif
	.endfn	NtFlushBuffersFile,globl
	.previous
