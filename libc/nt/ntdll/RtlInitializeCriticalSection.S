#include "libc/nt/ntdllimport.h"
.ntimp	RtlInitializeCriticalSection,RtlInitializeCriticalSection

	.text.windows
	.ftrace1
RtlInitializeCriticalSection:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlInitializeCriticalSection(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlInitializeCriticalSection
	ldr	x16,[x16,#:lo12:__imp_RtlInitializeCriticalSection]
	br	x16
#endif
	ret
	.endfn	RtlInitializeCriticalSection,globl
	.previous
