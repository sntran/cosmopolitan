#include "libc/nt/codegen.h"
.imp	user32,__imp_GetRawInputData,GetRawInputData

	.text.windows
	.ftrace1
GetRawInputData:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetRawInputData(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_GetRawInputData
	ldr	x16,[x16,#:lo12:__imp_GetRawInputData]
	br	x16
#endif
	.endfn	GetRawInputData,globl
	.previous
