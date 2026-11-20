#include "libc/nt/ntdllimport.h"
.ntimp	NtOpenProcess,NtOpenProcess

	.text.windows
	.ftrace1
NtOpenProcess:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtOpenProcess(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtOpenProcess
	ldr	x16,[x16,#:lo12:__imp_NtOpenProcess]
	br	x16
#endif
	.endfn	NtOpenProcess,globl
	.previous
