#include "libc/nt/codegen.h"
.imp	kernel32,__imp_IsWow64Process2,IsWow64Process2

	.text.windows
	.ftrace1
IsWow64Process2:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_IsWow64Process2(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_IsWow64Process2
	ldr	x16,[x16,#:lo12:__imp_IsWow64Process2]
	br	x16
#endif
	.endfn	IsWow64Process2,globl
	.previous
