#include "libc/nt/ntdllimport.h"
.ntimp	NtDeleteFile,NtDeleteFile

	.text.windows
	.ftrace1
NtDeleteFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_NtDeleteFile(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_NtDeleteFile
	ldr	x16,[x16,#:lo12:__imp_NtDeleteFile]
	br	x16
#endif
	ret
	.endfn	NtDeleteFile,globl
	.previous
