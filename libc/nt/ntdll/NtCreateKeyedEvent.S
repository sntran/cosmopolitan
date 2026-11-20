#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateKeyedEvent,NtCreateKeyedEvent

	.text.windows
	.ftrace1
NtCreateKeyedEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateKeyedEvent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateKeyedEvent
	ldr	x16,[x16,#:lo12:__imp_NtCreateKeyedEvent]
	br	x16
#endif
	.endfn	NtCreateKeyedEvent,globl
	.previous
