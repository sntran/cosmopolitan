#include "libc/nt/ntdllimport.h"
.ntimp	NtReadVirtualMemory,NtReadVirtualMemory

	.text.windows
	.ftrace1
NtReadVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtReadVirtualMemory(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtReadVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_NtReadVirtualMemory]
	br	x16
#endif
	.endfn	NtReadVirtualMemory,globl
	.previous
