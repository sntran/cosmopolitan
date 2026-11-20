#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateEventExW,CreateEventExW

	.text.windows
	.ftrace1
CreateEventEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateEventExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateEventExW
	ldr	x16,[x16,#:lo12:__imp_CreateEventExW]
	br	x16
#endif
	.endfn	CreateEventEx,globl
	.previous
