#include "libc/nt/codegen.h"
.imp	kernel32,__imp_UnlockFile,UnlockFile

	.text.windows
	.ftrace1
UnlockFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_UnlockFile(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_UnlockFile
	ldr	x16,[x16,#:lo12:__imp_UnlockFile]
	br	x16
#endif
	.endfn	UnlockFile,globl
	.previous
