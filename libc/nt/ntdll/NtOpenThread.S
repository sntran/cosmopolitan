#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenThread,NtOpenThread

	.text.windows
	.ftrace1
NtOpenThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenThread
	ldr	x16,[x16,#:lo12:__imp_NtOpenThread]
	br	x16
#endif
	.endfn	NtOpenThread,globl
	.previous
