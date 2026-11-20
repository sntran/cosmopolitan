#include "libc/nt/codegen.h"
.imp	kernel32,__imp_IsProcessorFeaturePresent,IsProcessorFeaturePresent

	.text.windows
	.ftrace1
IsProcessorFeaturePresent:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	%rdi,%rcx
	sub	$32,%rsp
	call	*__imp_IsProcessorFeaturePresent(%rip)
	leave
#elif defined(__aarch64__)
	adrp	x16,__imp_IsProcessorFeaturePresent
	ldr	x16,[x16,#:lo12:__imp_IsProcessorFeaturePresent]
	br	x16
#endif
	ret
	.endfn	IsProcessorFeaturePresent,globl
	.previous
