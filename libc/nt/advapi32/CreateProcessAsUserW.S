#include "libc/nt/codegen.h"
.imp	advapi32,__imp_CreateProcessAsUserW,CreateProcessAsUserW

	.text.windows
	.ftrace1
CreateProcessAsUser:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateProcessAsUserW(%rip),%rax
	jmp	__sysv2nt12
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateProcessAsUserW
	ldr	x16,[x16,#:lo12:__imp_CreateProcessAsUserW]
	br	x16
#endif
	.endfn	CreateProcessAsUser,globl
	.previous
