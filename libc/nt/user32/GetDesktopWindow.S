#include "libc/nt/codegen.h"
.imp	user32,__imp_GetDesktopWindow,GetDesktopWindow

	.text.windows
	.ftrace1
GetDesktopWindow:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	sub	$32,%rsp
	call	*__imp_GetDesktopWindow(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_GetDesktopWindow
	ldr	x16,[x16,#:lo12:__imp_GetDesktopWindow]
	br	x16
#endif
	ret
	.endfn	GetDesktopWindow,globl
	.previous
