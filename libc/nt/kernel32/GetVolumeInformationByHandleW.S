#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetVolumeInformationByHandleW,GetVolumeInformationByHandleW

	.text.windows
	.ftrace1
GetVolumeInformationByHandle:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetVolumeInformationByHandleW(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_GetVolumeInformationByHandleW
	ldr	x16,[x16,#:lo12:__imp_GetVolumeInformationByHandleW]
	br	x16
#endif
	.endfn	GetVolumeInformationByHandle,globl
	.previous
