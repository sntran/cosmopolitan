#include "libc/nt/ntdllimport.h"
.ntimp	RtlLeaveCriticalSection,RtlLeaveCriticalSection

	.text.windows
	.ftrace1
RtlLeaveCriticalSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlLeaveCriticalSection(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlLeaveCriticalSection
	ldr	x16,[x16,#:lo12:__imp_RtlLeaveCriticalSection]
	br	x16
#endif
	ret
	.endfn	RtlLeaveCriticalSection,globl
	.previous
