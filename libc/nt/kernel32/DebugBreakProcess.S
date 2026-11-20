#include "libc/nt/codegen.h"
.imp	kernel32,__imp_DebugBreakProcess,DebugBreakProcess

	.text.windows
	.ftrace1
DebugBreakProcess:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_DebugBreakProcess(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_DebugBreakProcess
	ldr	x16,[x16,#:lo12:__imp_DebugBreakProcess]
	br	x16
#endif
	ret
	.endfn	DebugBreakProcess,globl
	.previous
