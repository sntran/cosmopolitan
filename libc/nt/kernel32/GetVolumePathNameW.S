#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetVolumePathNameW,GetVolumePathNameW

	.text.windows
	.ftrace1
GetVolumePathName:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_GetVolumePathNameW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_GetVolumePathNameW
	ldr	x16,[x16,#:lo12:__imp_GetVolumePathNameW]
	br	x16
#endif
	.endfn	GetVolumePathName,globl
	.previous
