#include "libc/nt/codegen.h"
.imp	kernel32,__imp_TlsSetValue,TlsSetValue

	.text.windows
	.ftrace1
TlsSetValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_TlsSetValue(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_TlsSetValue
	ldr	x16,[x16,#:lo12:__imp_TlsSetValue]
	br	x16
#endif
	.endfn	TlsSetValue,globl
	.previous
