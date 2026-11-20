#include "libc/nt/ntdllimport.h"
.ntimp	RtlQueryEnvironmentVariable,RtlQueryEnvironmentVariable

	.text.windows
	.ftrace1
RtlQueryEnvironmentVariable:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlQueryEnvironmentVariable(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlQueryEnvironmentVariable
	ldr	x16,[x16,#:lo12:__imp_RtlQueryEnvironmentVariable]
	br	x16
#endif
	.endfn	RtlQueryEnvironmentVariable,globl
	.previous
