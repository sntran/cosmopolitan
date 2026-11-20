#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ResumeThread,ResumeThread

	.text.windows
	.ftrace1
ResumeThread:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_ResumeThread(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_ResumeThread
	ldr	x16,[x16,#:lo12:__imp_ResumeThread]
	br	x16
#endif
	ret
	.endfn	ResumeThread,globl
	.previous
