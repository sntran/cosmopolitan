#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetLogicalDrives,GetLogicalDrives

	.text.windows
	.ftrace1
GetLogicalDrives:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetLogicalDrives(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetLogicalDrives
	ldr	x16,[x16,#:lo12:__imp_GetLogicalDrives]
	br	x16
#endif
	ret
	.endfn	GetLogicalDrives,globl
	.previous
