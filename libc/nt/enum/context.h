#ifndef COSMOPOLITAN_LIBC_NT_ENUM_CONTEXT_H_
#define COSMOPOLITAN_LIBC_NT_ENUM_CONTEXT_H_

#ifdef __aarch64__
#define kNtContextArm64          0x00400000
#define kNtContextControl        (kNtContextArm64 | 0x00000001)
#define kNtContextInteger        (kNtContextArm64 | 0x00000002)
#define kNtContextFloatingPoint  (kNtContextArm64 | 0x00000004)
#define kNtContextDebugRegisters (kNtContextArm64 | 0x00000008)
#define kNtContextSegments       0
#define kNtContextFull \
  (kNtContextControl | kNtContextInteger | kNtContextFloatingPoint)
#define kNtContextAll \
  (kNtContextControl | kNtContextInteger | kNtContextFloatingPoint | \
   kNtContextDebugRegisters)
#else
#define kNtContextAmd64 0x00100000

#define kNtContextControl        (kNtContextAmd64 | 0x00000001)
#define kNtContextInteger        (kNtContextAmd64 | 0x00000002)
#define kNtContextSegments       (kNtContextAmd64 | 0x00000004)
#define kNtContextFloatingPoint  (kNtContextAmd64 | 0x00000008)
#define kNtContextDebugRegisters (kNtContextAmd64 | 0x00000010)

#define kNtContextFull \
  (kNtContextControl | kNtContextInteger | kNtContextFloatingPoint)

#define kNtContextAll                                           \
  (kNtContextControl | kNtContextInteger | kNtContextSegments | \
   kNtContextFloatingPoint | kNtContextDebugRegisters)

#define kNtContextXstate (kNtContextAmd64 | 0x00000040)
#endif

#endif /* COSMOPOLITAN_LIBC_NT_ENUM_CONTEXT_H_ */
