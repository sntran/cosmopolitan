#include "libc/nt/ntdllimport.h"
.ntimp	RtlConvertSidToUnicodeString,RtlConvertSidToUnicodeString

	.text.windows
	.ftrace1
RtlConvertSidToUnicodeString:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RtlConvertSidToUnicodeString(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlConvertSidToUnicodeString
	ldr	x16,[x16,#:lo12:__imp_RtlConvertSidToUnicodeString]
	br	x16
#endif
	.endfn	RtlConvertSidToUnicodeString,globl
	.previous
