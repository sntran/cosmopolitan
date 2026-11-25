// The entry of a signal handler on aarch64 (C73).
//
// The libc keeps the thread pointer in x28. Assembly code of other
// projects (for example OpenSSL) uses x28 as a register that a call
// keeps, so x28 can hold any value when a signal comes. Linux and XNU
// start the handler with the x28 of the interrupted code. These entries
// load x28 from the second copy of the thread pointer in tpidr_el0
// (see __set_tls_copy) before they call the code of the libc. The
// kernel puts back the x28 of the interrupted code at the return.
//
// The tool fixupobj changes each mrs of tpidr_el0 into a mov from x28,
// except an mrs that `hint #0x7f` follows.
//
// The copy is used only when it points to a thread block: the first
// field of a thread block (tib_self) is the address of the block, and
// x28 points to the end of the block (1024 bytes). Code of other
// projects that changes tpidr_el0 (the C library of the system after
// cosmo_dlopen) thus does not give a wrong x28.

#include "libc/macros.h"

#ifdef __aarch64__

.privileged

	.macro	tls_from_copy
	mrs	x9,tpidr_el0
	hint	#0x7f			// fixupobj keeps this mrs
	cbz	x9,1f
	sub	x10,x9,#1024
	ldr	x11,[x10]
	cmp	x11,x10
	b.ne	1f
	mov	x28,x9
1:
	.endm

//	The handler of each signal on Linux.
//
//	@param	w0 is the signal
//	@param	x1 is the siginfo_t
//	@param	x2 is the ucontext_t
__sigenter_linux_arm64:
	tls_from_copy
	b	__sigenter_linux
	.endfn	__sigenter_linux_arm64,globl,hidden

//	The handler of each signal on XNU.
__sigenter_xnu_arm64:
	tls_from_copy
	b	__sigenter_xnu
	.endfn	__sigenter_xnu_arm64,globl,hidden

#endif /* __aarch64__ */
