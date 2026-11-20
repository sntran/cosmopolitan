#include "libc/nt/ntdllimport.h"
.ntimp	NtQueryVirtualMemory,NtQueryVirtualMemory

	.text.windows
	.ftrace1
NtQueryVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtQueryVirtualMemory(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtQueryVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_NtQueryVirtualMemory]
	br	x16
#endif
	.endfn	NtQueryVirtualMemory,globl
	.previous
