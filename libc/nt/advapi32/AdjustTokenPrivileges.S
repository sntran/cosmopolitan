#include "libc/nt/codegen.h"
.imp	advapi32,__imp_AdjustTokenPrivileges,AdjustTokenPrivileges

	.text.windows
	.ftrace1
AdjustTokenPrivileges:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AdjustTokenPrivileges(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_AdjustTokenPrivileges
	ldr	x16,[x16,#:lo12:__imp_AdjustTokenPrivileges]
	br	x16
#endif
	.endfn	AdjustTokenPrivileges,globl
	.previous
