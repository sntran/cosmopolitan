#include "libc/nt/codegen.h"
.imp	user32,__imp_KillTimer,KillTimer

	.text.windows
	.ftrace1
KillTimer:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_KillTimer(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_KillTimer
	ldr	x16,[x16,#:lo12:__imp_KillTimer]
	br	x16
#endif
	.endfn	KillTimer,globl
	.previous
