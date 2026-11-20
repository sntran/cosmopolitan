#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryInformationThread,NtQueryInformationThread

	.text.windows
	.ftrace1
NtQueryInformationThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryInformationThread(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryInformationThread
	ldr	x16,[x16,#:lo12:__imp_NtQueryInformationThread]
	br	x16
#endif
	.endfn	NtQueryInformationThread,globl
	.previous
