#include "libc/nt/codegen.h"
.imp	user32,__imp_AppendMenuA,AppendMenuA

	.text.windows
	.ftrace1
AppendMenuA:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_AppendMenuA(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_AppendMenuA
	ldr	x16,[x16,#:lo12:__imp_AppendMenuA]
	br	x16
#endif
	.endfn	AppendMenuA,globl
	.previous
