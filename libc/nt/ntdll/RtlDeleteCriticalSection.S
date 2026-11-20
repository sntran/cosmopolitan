#include "libc/nt/ntdllimport.h"
.ntimp	RtlDeleteCriticalSection,RtlDeleteCriticalSection

	.text.windows
	.ftrace1
RtlDeleteCriticalSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlDeleteCriticalSection(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlDeleteCriticalSection
	ldr	x16,[x16,#:lo12:__imp_RtlDeleteCriticalSection]
	br	x16
#endif
	ret
	.endfn	RtlDeleteCriticalSection,globl
	.previous
