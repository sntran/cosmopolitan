#include "libc/nt/codegen.h"
.imp	ws2_32,__imp_FreeAddrInfoExW,FreeAddrInfoExW

	.text.windows
	.ftrace1
FreeAddrInfoEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_FreeAddrInfoExW(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_FreeAddrInfoExW
	ldr	x16,[x16,#:lo12:__imp_FreeAddrInfoExW]
	br	x16
#endif
	ret
	.endfn	FreeAddrInfoEx,globl
	.previous
