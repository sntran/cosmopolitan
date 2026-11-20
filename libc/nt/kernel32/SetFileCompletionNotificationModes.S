#include "libc/nt/codegen.h"
.imp	kernel32,__imp_SetFileCompletionNotificationModes,SetFileCompletionNotificationModes

	.text.windows
	.ftrace1
SetFileCompletionNotificationModes:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_SetFileCompletionNotificationModes(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_SetFileCompletionNotificationModes
	ldr	x16,[x16,#:lo12:__imp_SetFileCompletionNotificationModes]
	br	x16
#endif
	.endfn	SetFileCompletionNotificationModes,globl
	.previous
