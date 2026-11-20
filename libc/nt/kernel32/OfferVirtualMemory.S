#include "libc/nt/codegen.h"
.imp	kernel32,__imp_OfferVirtualMemory,OfferVirtualMemory

	.text.windows
	.ftrace1
OfferVirtualMemory:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_OfferVirtualMemory(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_OfferVirtualMemory
	ldr	x16,[x16,#:lo12:__imp_OfferVirtualMemory]
	br	x16
#endif
	.endfn	OfferVirtualMemory,globl
	.previous
