#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegOpenUserClassesRoot,RegOpenUserClassesRoot

	.text.windows
	.ftrace1
RegOpenUserClassesRoot:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegOpenUserClassesRoot(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_RegOpenUserClassesRoot
	ldr	x16,[x16,#:lo12:__imp_RegOpenUserClassesRoot]
	br	x16
#endif
	.endfn	RegOpenUserClassesRoot,globl
	.previous
