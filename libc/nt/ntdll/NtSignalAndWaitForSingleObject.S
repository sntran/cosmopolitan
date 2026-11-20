#include "libc/nt/ntdllimport.h"
.ntimp	NtSignalAndWaitForSingleObject,NtSignalAndWaitForSingleObject

	.text.windows
	.ftrace1
NtSignalAndWaitForSingleObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSignalAndWaitForSingleObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSignalAndWaitForSingleObject
	ldr	x16,[x16,#:lo12:__imp_NtSignalAndWaitForSingleObject]
	br	x16
#endif
	.endfn	NtSignalAndWaitForSingleObject,globl
	.previous
