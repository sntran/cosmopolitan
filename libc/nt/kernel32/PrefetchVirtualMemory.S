#include "libc/nt/codegen.h"
.imp	kernel32,__imp_PrefetchVirtualMemory,PrefetchVirtualMemory

	.text.windows
	.ftrace1
PrefetchVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PrefetchVirtualMemory(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PrefetchVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_PrefetchVirtualMemory]
	br	x16
#endif
	.endfn	PrefetchVirtualMemory,globl
	.previous
