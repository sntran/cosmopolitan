#include "libc/nt/codegen.h"
.imp	kernel32,__imp_AllocConsole,AllocConsole

	.text.windows
	.ftrace1
AllocConsole:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_AllocConsole(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_AllocConsole
	ldr	x16,[x16,#:lo12:__imp_AllocConsole]
	br	x16
#endif
	ret
	.endfn	AllocConsole,globl
	.previous
