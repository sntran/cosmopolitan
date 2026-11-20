#include "libc/nt/codegen.h"
.imp	API-MS-Win-Core-Synch-l1-2-0,__imp_WaitOnAddress,WaitOnAddress

	.text.windows
	.ftrace1
WaitOnAddress:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WaitOnAddress(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_WaitOnAddress
	ldr	x16,[x16,#:lo12:__imp_WaitOnAddress]
	br	x16
#endif
	.endfn	WaitOnAddress,globl
	.previous
