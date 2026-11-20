#include "libc/nt/ntdllimport.h"
.ntimp	NtRaiseException,NtRaiseException

	.text.windows
	.ftrace1
NtRaiseException:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtRaiseException(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtRaiseException
	ldr	x16,[x16,#:lo12:__imp_NtRaiseException]
	br	x16
#endif
	.endfn	NtRaiseException,globl
	.previous
