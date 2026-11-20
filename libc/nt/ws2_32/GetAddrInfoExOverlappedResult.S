#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_GetAddrInfoExOverlappedResult,GetAddrInfoExOverlappedResult

	.text.windows
	.ftrace1
GetAddrInfoExOverlappedResult:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_GetAddrInfoExOverlappedResult(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetAddrInfoExOverlappedResult
	ldr	x16,[x16,#:lo12:__imp_GetAddrInfoExOverlappedResult]
	br	x16
#endif
	ret
	.endfn	GetAddrInfoExOverlappedResult,globl
	.previous
