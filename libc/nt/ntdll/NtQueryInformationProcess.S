#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryInformationProcess,NtQueryInformationProcess

	.text.windows
	.ftrace1
NtQueryInformationProcess:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryInformationProcess(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryInformationProcess
	ldr	x16,[x16,#:lo12:__imp_NtQueryInformationProcess]
	br	x16
#endif
	.endfn	NtQueryInformationProcess,globl
	.previous
