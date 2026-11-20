#include "libc/nt/ntdllimport.h"
.ntimp	NtAllocateVirtualMemory,NtAllocateVirtualMemory

	.text.windows
	.ftrace1
NtAllocateVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtAllocateVirtualMemory(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtAllocateVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_NtAllocateVirtualMemory]
	br	x16
#endif
	.endfn	NtAllocateVirtualMemory,globl
	.previous
