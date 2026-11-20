#include "libc/nt/ntdllimport.h"
.ntimp	NtDelayExecution,NtDelayExecution

	.text.windows
	.ftrace1
NtDelayExecution:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtDelayExecution(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtDelayExecution
	ldr	x16,[x16,#:lo12:__imp_NtDelayExecution]
	br	x16
#endif
	.endfn	NtDelayExecution,globl
	.previous
