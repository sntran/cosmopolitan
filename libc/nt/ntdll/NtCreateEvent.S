#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateEvent,NtCreateEvent

	.text.windows
	.ftrace1
NtCreateEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateEvent(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateEvent
	ldr	x16,[x16,#:lo12:__imp_NtCreateEvent]
	br	x16
#endif
	.endfn	NtCreateEvent,globl
	.previous
