#include "libc/nt/codegen.h"
.imp	shell32,__imp_DragAcceptFiles,DragAcceptFiles

	.text.windows
	.ftrace1
DragAcceptFiles:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_DragAcceptFiles(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_DragAcceptFiles
	ldr	x16,[x16,#:lo12:__imp_DragAcceptFiles]
	br	x16
#endif
	.endfn	DragAcceptFiles,globl
	.previous
