#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegSetValueExW,RegSetValueExW

	.text.windows
	.ftrace1
RegSetValueEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegSetValueExW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RegSetValueExW
	ldr	x16,[x16,#:lo12:__imp_RegSetValueExW]
	br	x16
#endif
	.endfn	RegSetValueEx,globl
	.previous
