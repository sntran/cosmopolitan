#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateProcess,NtCreateProcess

	.text.windows
	.ftrace1
NtCreateProcess:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateProcess(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateProcess
	ldr	x16,[x16,#:lo12:__imp_NtCreateProcess]
	br	x16
#endif
	.endfn	NtCreateProcess,globl
	.previous
