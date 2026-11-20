#include "libc/nt/ntdllimport.h"
.ntimp	NtReleaseKeyedEvent,NtReleaseKeyedEvent

	.text.windows
	.ftrace1
NtReleaseKeyedEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtReleaseKeyedEvent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtReleaseKeyedEvent
	ldr	x16,[x16,#:lo12:__imp_NtReleaseKeyedEvent]
	br	x16
#endif
	.endfn	NtReleaseKeyedEvent,globl
	.previous
