#include "libc/nt/codegen.h"
.imp	iphlpapi,__imp_CaptureInterfaceHardwareCrossTimestamp,CaptureInterfaceHardwareCrossTimestamp

	.text.windows
	.ftrace1
CaptureInterfaceHardwareCrossTimestamp:
	.ftrace2
#ifdef __x86_64__
	push	%rbp
	mov	%rsp,%rbp
	mov	__imp_CaptureInterfaceHardwareCrossTimestamp(%rip),%rax
	jmp	__sysv2nt
#elif defined(__aarch64__)
	adrp	x16,__imp_CaptureInterfaceHardwareCrossTimestamp
	ldr	x16,[x16,#:lo12:__imp_CaptureInterfaceHardwareCrossTimestamp]
	br	x16
#endif
	.endfn	CaptureInterfaceHardwareCrossTimestamp,globl
	.previous
