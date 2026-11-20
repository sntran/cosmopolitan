#include "libc/nt/ntdllimport.h"
.ntimp	NtRaiseHardError,NtRaiseHardError

	.text.windows
	.ftrace1
NtRaiseHardError:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtRaiseHardError(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_NtRaiseHardError
	ldr	x16,[x16,#:lo12:__imp_NtRaiseHardError]
	br	x16
#endif
	.endfn	NtRaiseHardError,globl
	.previous
