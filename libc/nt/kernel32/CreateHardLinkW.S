#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateHardLinkW,CreateHardLinkW

	.text.windows
	.ftrace1
CreateHardLink:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateHardLinkW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateHardLinkW
	ldr	x16,[x16,#:lo12:__imp_CreateHardLinkW]
	br	x16
#endif
	.endfn	CreateHardLink,globl
	.previous
