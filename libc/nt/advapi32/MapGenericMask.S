#include "libc/nt/codegen.h"
.imp	advapi32,__imp_MapGenericMask,MapGenericMask

	.text.windows
	.ftrace1
MapGenericMask:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MapGenericMask(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_MapGenericMask
	ldr	x16,[x16,#:lo12:__imp_MapGenericMask]
	br	x16
#endif
	.endfn	MapGenericMask,globl
	.previous
