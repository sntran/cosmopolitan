#include "libc/nt/ntdllimport.h"
.ntimp	RtlFreeUnicodeString,RtlFreeUnicodeString

	.text.windows
	.ftrace1
RtlFreeUnicodeString:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_RtlFreeUnicodeString(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_RtlFreeUnicodeString
	ldr	x16,[x16,#:lo12:__imp_RtlFreeUnicodeString]
	br	x16
#endif
	ret
	.endfn	RtlFreeUnicodeString,globl
	.previous
