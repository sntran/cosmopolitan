#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetCompressedFileSizeW,GetCompressedFileSizeW

	.text.windows
	.ftrace1
GetCompressedFileSize:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetCompressedFileSizeW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetCompressedFileSizeW
	ldr	x16,[x16,#:lo12:__imp_GetCompressedFileSizeW]
	br	x16
#endif
	.endfn	GetCompressedFileSize,globl
	.previous
