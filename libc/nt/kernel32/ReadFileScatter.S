#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadFileScatter,ReadFileScatter

	.text.windows
	.ftrace1
ReadFileScatter:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadFileScatter(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadFileScatter
	ldr	x16,[x16,#:lo12:__imp_ReadFileScatter]
	br	x16
#endif
	.endfn	ReadFileScatter,globl
	.previous
