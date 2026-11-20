#include "libc/nt/codegen.h"
.imp	user32,__imp_MapVirtualKeyExW,MapVirtualKeyExW

	.text.windows
	.ftrace1
MapVirtualKeyEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_MapVirtualKeyExW(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_MapVirtualKeyExW
	ldr	x16,[x16,#:lo12:__imp_MapVirtualKeyExW]
	br	x16
#endif
	.endfn	MapVirtualKeyEx,globl
	.previous
