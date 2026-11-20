#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegCreateKeyExW,RegCreateKeyExW

	.text.windows
	.ftrace1
RegCreateKeyEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegCreateKeyExW(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_RegCreateKeyExW
	ldr	x16,[x16,#:lo12:__imp_RegCreateKeyExW]
	br	x16
#endif
	.endfn	RegCreateKeyEx,globl
	.previous
