#include "libc/nt/ntdllimport.h"
.ntimp	NtProtectVirtualMemory,NtProtectVirtualMemory

	.text.windows
	.ftrace1
NtProtectVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtProtectVirtualMemory(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtProtectVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_NtProtectVirtualMemory]
	br	x16
#endif
	.endfn	NtProtectVirtualMemory,globl
	.previous
