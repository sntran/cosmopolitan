#include "libc/nt/codegen.h"
.imp	kernel32,__imp_CreateToolhelp32Snapshot,CreateToolhelp32Snapshot

	.text.windows
	.ftrace1
CreateToolhelp32Snapshot:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CreateToolhelp32Snapshot(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CreateToolhelp32Snapshot
	ldr	x16,[x16,#:lo12:__imp_CreateToolhelp32Snapshot]
	br	x16
#endif
	.endfn	CreateToolhelp32Snapshot,globl
	.previous
