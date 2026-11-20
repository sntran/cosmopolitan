#include "libc/nt/ntdllimport.h"
.ntimp	NtDeviceIoControlFile,NtDeviceIoControlFile

	.text.windows
	.ftrace1
NtDeviceIoControlFile:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_NtDeviceIoControlFile(%rip),%rax
	jmp	__sysv2nt10
#elif defined(__aarch64__)
	adrp	x16,__imp_NtDeviceIoControlFile
	ldr	x16,[x16,#:lo12:__imp_NtDeviceIoControlFile]
	br	x16
#endif
	.endfn	NtDeviceIoControlFile,globl
	.previous
