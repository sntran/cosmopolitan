#include "libc/nt/codegen.h"
.imp	API-MS-Win-Core-Realtime-l1-1-1,__imp_QueryUnbiasedInterruptTimePrecise,QueryUnbiasedInterruptTimePrecise

	.text.windows
	.ftrace1
QueryUnbiasedInterruptTimePrecise:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_QueryUnbiasedInterruptTimePrecise(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_QueryUnbiasedInterruptTimePrecise
	ldr	x16,[x16,#:lo12:__imp_QueryUnbiasedInterruptTimePrecise]
	br	x16
#endif
	ret
	.endfn	QueryUnbiasedInterruptTimePrecise,globl
	.previous
