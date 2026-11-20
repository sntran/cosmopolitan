#include "libc/nt/ntdllimport.h"
.ntimp	NtCancelIoFileEx,NtCancelIoFileEx

	.text.windows
	.ftrace1
NtCancelIoFileEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCancelIoFileEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCancelIoFileEx
	ldr	x16,[x16,#:lo12:__imp_NtCancelIoFileEx]
	br	x16
#endif
	.endfn	NtCancelIoFileEx,globl
	.previous
