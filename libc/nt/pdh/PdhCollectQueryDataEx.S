#include "libc/nt/codegen.h"
.imp	pdh,__imp_PdhCollectQueryDataEx,PdhCollectQueryDataEx

	.text.windows
	.ftrace1
PdhCollectQueryDataEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PdhCollectQueryDataEx(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PdhCollectQueryDataEx
	ldr	x16,[x16,#:lo12:__imp_PdhCollectQueryDataEx]
	br	x16
#endif
	.endfn	PdhCollectQueryDataEx,globl
	.previous
