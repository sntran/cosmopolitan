#include "libc/nt/ntdllimport.h"
.ntimp	NtCallbackReturn,NtCallbackReturn

	.text.windows
	.ftrace1
NtCallbackReturn:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCallbackReturn(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCallbackReturn
	ldr	x16,[x16,#:lo12:__imp_NtCallbackReturn]
	br	x16
#endif
	.endfn	NtCallbackReturn,globl
	.previous
