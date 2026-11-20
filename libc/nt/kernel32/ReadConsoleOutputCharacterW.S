#include "libc/nt/codegen.h"
.imp	kernel32,__imp_ReadConsoleOutputCharacterW,ReadConsoleOutputCharacterW

	.text.windows
	.ftrace1
ReadConsoleOutputCharacter:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_ReadConsoleOutputCharacterW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_ReadConsoleOutputCharacterW
	ldr	x16,[x16,#:lo12:__imp_ReadConsoleOutputCharacterW]
	br	x16
#endif
	.endfn	ReadConsoleOutputCharacter,globl
	.previous
