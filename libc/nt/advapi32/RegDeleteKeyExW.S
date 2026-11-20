#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegDeleteKeyExW,RegDeleteKeyExW

	.text.windows
	.ftrace1
RegDeleteKeyEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegDeleteKeyExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegDeleteKeyExW
	ldr	x16,[x16,#:lo12:__imp_RegDeleteKeyExW]
	br	x16
#endif
	.endfn	RegDeleteKeyEx,globl
	.previous
