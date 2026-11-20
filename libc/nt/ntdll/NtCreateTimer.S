#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateTimer,NtCreateTimer

	.text.windows
	.ftrace1
NtCreateTimer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateTimer(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateTimer
	ldr	x16,[x16,#:lo12:__imp_NtCreateTimer]
	br	x16
#endif
	.endfn	NtCreateTimer,globl
	.previous
