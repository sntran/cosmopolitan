#include "libc/nt/ntdllimport.h"
.ntimp	RtlEnterCriticalSection,RtlEnterCriticalSection

	.text.windows
	.ftrace1
RtlEnterCriticalSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlEnterCriticalSection(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlEnterCriticalSection
	ldr	x16,[x16,#:lo12:__imp_RtlEnterCriticalSection]
	br	x16
#endif
	ret
	.endfn	RtlEnterCriticalSection,globl
	.previous
