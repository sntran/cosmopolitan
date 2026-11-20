#include "libc/nt/codegen.h"
.imp	kernel32,__imp_FillConsoleOutputCharacterW,FillConsoleOutputCharacterW

	.text.windows
	.ftrace1
FillConsoleOutputCharacter:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_FillConsoleOutputCharacterW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_FillConsoleOutputCharacterW
	ldr	x16,[x16,#:lo12:__imp_FillConsoleOutputCharacterW]
	br	x16
#endif
	.endfn	FillConsoleOutputCharacter,globl
	.previous
