#include "libc/nt/ntdllimport.h"
.ntimp	NtCreateNamedPipeFile,NtCreateNamedPipeFile

	.text.windows
	.ftrace1
NtCreateNamedPipeFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtCreateNamedPipeFile(%rip),%rax
	jmp	__sysv2nt14
#elif defined(__aarch64__)
	adrp	x16,__imp_NtCreateNamedPipeFile
	ldr	x16,[x16,#:lo12:__imp_NtCreateNamedPipeFile]
	br	x16
#endif
	.endfn	NtCreateNamedPipeFile,globl
	.previous
