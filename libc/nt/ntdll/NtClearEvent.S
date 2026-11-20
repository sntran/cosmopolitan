#include "libc/nt/ntdllimport.h"
.ntimp	NtClearEvent,NtClearEvent

	.text.windows
	.ftrace1
NtClearEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_NtClearEvent(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_NtClearEvent
	ldr	x16,[x16,#:lo12:__imp_NtClearEvent]
	br	x16
#endif
	ret
	.endfn	NtClearEvent,globl
	.previous
