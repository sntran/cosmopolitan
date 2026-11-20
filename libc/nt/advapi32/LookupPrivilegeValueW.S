#include "libc/nt/codegen.h"
.imp	advapi32,__imp_LookupPrivilegeValueW,LookupPrivilegeValueW

	.text.windows
	.ftrace1
LookupPrivilegeValue:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_LookupPrivilegeValueW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_LookupPrivilegeValueW
	ldr	x16,[x16,#:lo12:__imp_LookupPrivilegeValueW]
	br	x16
#endif
	.endfn	LookupPrivilegeValue,globl
	.previous
