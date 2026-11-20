#include "libc/nt/ntdllimport.h"
.ntimp	NtSetInformationThread,NtSetInformationThread

	.text.windows
	.ftrace1
NtSetInformationThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSetInformationThread(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSetInformationThread
	ldr	x16,[x16,#:lo12:__imp_NtSetInformationThread]
	br	x16
#endif
	.endfn	NtSetInformationThread,globl
	.previous
