#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegSetValueW,RegSetValueW

	.text.windows
	.ftrace1
RegSetValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegSetValueW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RegSetValueW
	ldr	x16,[x16,#:lo12:__imp_RegSetValueW]
	br	x16
#endif
	.endfn	RegSetValue,globl
	.previous
