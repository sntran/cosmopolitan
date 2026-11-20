#include "libc/nt/codegen.h"
.imp	kernel32,__imp_WriteConsoleOutputCharacterW,WriteConsoleOutputCharacterW

	.text.windows
	.ftrace1
WriteConsoleOutputCharacter:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_WriteConsoleOutputCharacterW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_WriteConsoleOutputCharacterW
	ldr	x16,[x16,#:lo12:__imp_WriteConsoleOutputCharacterW]
	br	x16
#endif
	.endfn	WriteConsoleOutputCharacter,globl
	.previous
