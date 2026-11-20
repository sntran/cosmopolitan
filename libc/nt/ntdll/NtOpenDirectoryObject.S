#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenDirectoryObject,NtOpenDirectoryObject

	.text.windows
	.ftrace1
NtOpenDirectoryObject:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenDirectoryObject(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenDirectoryObject
	ldr	x16,[x16,#:lo12:__imp_NtOpenDirectoryObject]
	br	x16
#endif
	.endfn	NtOpenDirectoryObject,globl
	.previous
