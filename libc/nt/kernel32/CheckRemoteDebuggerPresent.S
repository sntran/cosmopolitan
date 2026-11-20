#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CheckRemoteDebuggerPresent,CheckRemoteDebuggerPresent

	.text.windows
	.ftrace1
CheckRemoteDebuggerPresent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CheckRemoteDebuggerPresent(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CheckRemoteDebuggerPresent
	ldr	x16,[x16,#:lo12:__imp_CheckRemoteDebuggerPresent]
	br	x16
#endif
	.endfn	CheckRemoteDebuggerPresent,globl
	.previous
