#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ResizePseudoConsole,ResizePseudoConsole

	.text.windows
	.ftrace1
ResizePseudoConsole:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ResizePseudoConsole(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ResizePseudoConsole
	ldr	x16,[x16,#:lo12:__imp_ResizePseudoConsole]
	br	x16
#endif
	.endfn	ResizePseudoConsole,globl
	.previous
