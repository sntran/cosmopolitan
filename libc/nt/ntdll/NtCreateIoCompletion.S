#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateIoCompletion,NtCreateIoCompletion

	.text.windows
	.ftrace1
NtCreateIoCompletion:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateIoCompletion(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateIoCompletion
	ldr	x16,[x16,#:lo12:__imp_NtCreateIoCompletion]
	br	x16
#endif
	.endfn	NtCreateIoCompletion,globl
	.previous
