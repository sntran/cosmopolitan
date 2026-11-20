#include "libc/nt/codegen.h"
.imp	kernel32,__imp_DuplicateHandle,DuplicateHandle

	.text.windows
	.ftrace1
DuplicateHandle:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DuplicateHandle(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_DuplicateHandle
	ldr	x16,[x16,#:lo12:__imp_DuplicateHandle]
	br	x16
#endif
	.endfn	DuplicateHandle,globl
	.previous
