#include "libc/nt/codegen.h"
.imp	user32,__imp_ClientToScreen,ClientToScreen

	.text.windows
	.ftrace1
ClientToScreen:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ClientToScreen(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_ClientToScreen
	ldr	x16,[x16,#:lo12:__imp_ClientToScreen]
	br	x16
#endif
	.endfn	ClientToScreen,globl
	.previous
