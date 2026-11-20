#include "libc/nt/codegen.h"
.imp	advapi32,__imp_RegOpenKeyExW,RegOpenKeyExW

	.text.windows
	.ftrace1
RegOpenKeyEx:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_RegOpenKeyExW(%rip),%rax
	jmp	__sysv2nt6
#elif defined(__aarch64__)
	adrp	x16,__imp_RegOpenKeyExW
	ldr	x16,[x16,#:lo12:__imp_RegOpenKeyExW]
	br	x16
#endif
	.endfn	RegOpenKeyEx,globl
	.previous
