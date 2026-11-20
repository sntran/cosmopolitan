#include "libc/nt/codegen.h"
.imp	kernel32,__imp_Process32FirstW,Process32FirstW

	.text.windows
	.ftrace1
Process32First:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_Process32FirstW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_Process32FirstW
	ldr	x16,[x16,#:lo12:__imp_Process32FirstW]
	br	x16
#endif
	.endfn	Process32First,globl
	.previous
