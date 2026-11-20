#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_GetNumberOfInterfaces,GetNumberOfInterfaces

	.text.windows
	.ftrace1
GetNumberOfInterfaces:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetNumberOfInterfaces(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetNumberOfInterfaces
	ldr	x16,[x16,#:lo12:__imp_GetNumberOfInterfaces]
	br	x16
#endif
	ret
	.endfn	GetNumberOfInterfaces,globl
	.previous
