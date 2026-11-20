#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateEventW,CreateEventW

	.text.windows
	.ftrace1
CreateEvent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateEventW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateEventW
	ldr	x16,[x16,#:lo12:__imp_CreateEventW]
	br	x16
#endif
	.endfn	CreateEvent,globl
	.previous
