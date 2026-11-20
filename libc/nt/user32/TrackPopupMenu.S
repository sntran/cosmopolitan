#include "libc/nt/codegen.h"
.imp	user32,__imp_TrackPopupMenu,TrackPopupMenu

	.text.windows
	.ftrace1
TrackPopupMenu:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_TrackPopupMenu(%rip),%rax
	jmp	__sysv2nt8
#elif defined(__aarch64__)
	adrp	x16,__imp_TrackPopupMenu
	ldr	x16,[x16,#:lo12:__imp_TrackPopupMenu]
	br	x16
#endif
	.endfn	TrackPopupMenu,globl
	.previous
