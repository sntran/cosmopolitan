#include "libc/nt/ntdllimport.h"
.ntimp	NtWriteVirtualMemory,NtWriteVirtualMemory

	.text.windows
	.ftrace1
NtWriteVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtWriteVirtualMemory(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtWriteVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_NtWriteVirtualMemory]
	br	x16
#endif
	.endfn	NtWriteVirtualMemory,globl
	.previous
