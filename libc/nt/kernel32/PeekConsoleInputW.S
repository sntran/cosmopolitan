#include "libc/nt/codegen.h"
.imp	kernel32,__imp_PeekConsoleInputW,PeekConsoleInputW

	.text.windows
	.ftrace1
PeekConsoleInput:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_PeekConsoleInputW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_PeekConsoleInputW
	ldr	x16,[x16,#:lo12:__imp_PeekConsoleInputW]
	br	x16
#endif
	.endfn	PeekConsoleInput,globl
	.previous
