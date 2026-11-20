#include "libc/nt/ntdllimport.h"
.ntimp	NtSetEvent,NtSetEvent

	.text.windows
	.ftrace1
NtSetEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtSetEvent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtSetEvent
	ldr	x16,[x16,#:lo12:__imp_NtSetEvent]
	br	x16
#endif
	.endfn	NtSetEvent,globl
	.previous
