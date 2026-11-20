#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WideCharToMultiByte,WideCharToMultiByte

	.text.windows
	.ftrace1
WideCharToMultiByte:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WideCharToMultiByte(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_WideCharToMultiByte
	ldr	x16,[x16,#:lo12:__imp_WideCharToMultiByte]
	br	x16
#endif
	.endfn	WideCharToMultiByte,globl
	.previous
