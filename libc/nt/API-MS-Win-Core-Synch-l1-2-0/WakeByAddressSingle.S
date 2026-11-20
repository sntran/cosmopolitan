#include "libc/nt/codegen.h"
.imp	API-MS-Win-Core-Synch-l1-2-0,__imp_WakeByAddressSingle,WakeByAddressSingle

	.text.windows
	.ftrace1
WakeByAddressSingle:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_WakeByAddressSingle(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_WakeByAddressSingle
	ldr	x16,[x16,#:lo12:__imp_WakeByAddressSingle]
	br	x16
#endif
	ret
	.endfn	WakeByAddressSingle,globl
	.previous
