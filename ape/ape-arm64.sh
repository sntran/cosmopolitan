#!/bin/sh
# Builds ape-arm64.exe, the native loader of Windows on ARM64 for the
# aarch64 half of an APE file (ape/ape-arm64.c).
#
#   ape/ape-arm64.sh OUTPUT
#
# The loader needs no C library and no Windows SDK: clang compiles it,
# llvm-dlltool makes the import libraries, and lld-link links it. On
# Debian and Ubuntu, these are the packages clang, lld and llvm.
set -eu

out=${1:?usage: ape/ape-arm64.sh OUTPUT}
src=$(cd "$(dirname "$0")" && pwd)/ape-arm64.c

for tool in clang lld-link llvm-dlltool; do
  if ! command -v "$tool" >/dev/null; then
    echo "$0: needs $tool (the packages clang, lld and llvm)" >&2
    exit 1
  fi
done

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# The functions of Windows that ape-arm64.c imports.
cat >"$tmp/kernel32.def" <<EOF
LIBRARY kernel32.dll
EXPORTS
GetCommandLineW
GetEnvironmentStringsW
WideCharToMultiByte
CreateFileW
ReadFile
SetFilePointerEx
CloseHandle
VirtualAlloc
VirtualProtect
VirtualQuery
FlushInstructionCache
GetCurrentProcess
GetStdHandle
WriteFile
ExitProcess
GetLastError
LoadLibraryA
GetProcAddress
GetEnvironmentVariableW
AddVectoredExceptionHandler
SetUnhandledExceptionFilter
EOF
cat >"$tmp/shell32.def" <<EOF
LIBRARY shell32.dll
EXPORTS
CommandLineToArgvW
EOF

llvm-dlltool -m arm64 -d "$tmp/kernel32.def" -l "$tmp/kernel32.lib"
llvm-dlltool -m arm64 -d "$tmp/shell32.def" -l "$tmp/shell32.lib"
clang --target=aarch64-pc-windows-msvc -ffreestanding -fno-stack-protector \
  -fno-builtin -O2 -Wall -Werror -c "$src" -o "$tmp/ape-arm64.obj"

# The stack is committed: the code of cosmocc has no stack probes.
# /Brepro: no time in the file, so the same source gives the same file.
# /highentropyva:no: Windows puts the stacks and the heaps of the process
# below 4 GiB. With high entropy, they go to random addresses up to some
# TiB, and about 1 start in 4000 found a block at the fixed address of
# the aarch64 half (32 GiB). ARM64 refuses /dynamicbase:no.
lld-link /machine:arm64 /subsystem:console /entry:Entry /nodefaultlib \
  /stack:8388608,8388608 /highentropyva:no /Brepro "/out:$out" \
  "$tmp/ape-arm64.obj" "$tmp/kernel32.lib" "$tmp/shell32.lib"
