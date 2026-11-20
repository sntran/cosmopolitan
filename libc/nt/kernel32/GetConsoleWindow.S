#include "libc/nt/codegen.h"
.imp	kernel32,__imp_GetConsoleWindow,GetConsoleWindow

	.text.windows
	.ftrace1
GetConsoleWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetConsoleWindow(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetConsoleWindow
	ldr	x16,[x16,#:lo12:__imp_GetConsoleWindow]
	br	x16
#endif
	ret
	.endfn	GetConsoleWindow,globl
	.previous
