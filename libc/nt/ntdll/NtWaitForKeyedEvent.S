#include "libc/nt/ntdllimport.h"
.ntimp	NtWaitForKeyedEvent,NtWaitForKeyedEvent

	.text.windows
	.ftrace1
NtWaitForKeyedEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtWaitForKeyedEvent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtWaitForKeyedEvent
	ldr	x16,[x16,#:lo12:__imp_NtWaitForKeyedEvent]
	br	x16
#endif
	.endfn	NtWaitForKeyedEvent,globl
	.previous
