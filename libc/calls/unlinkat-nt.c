/*-*- mode:c;indent-tabs-mode:nil;c-basic-offset:2;tab-width:8;coding:utf-8 -*-│
│ vi: set et ft=c ts=2 sts=2 sw=2 fenc=utf-8                               :vi │
╞══════════════════════════════════════════════════════════════════════════════╡
│ Copyright 2020 Justine Alexandra Roberts Tunney                              │
│                                                                              │
│ Permission to use, copy, modify, and/or distribute this software for         │
│ any purpose with or without fee is hereby granted, provided that the         │
│ above copyright notice and this permission notice appear in all copies.      │
│                                                                              │
│ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL                │
│ WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED                │
│ WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE             │
│ AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL         │
│ DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR        │
│ PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER               │
│ TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR             │
│ PERFORMANCE OF THIS SOFTWARE.                                                │
╚─────────────────────────────────────────────────────────────────────────────*/
#include "libc/calls/syscall_support-nt.internal.h"
#include "libc/errno.h"
#include "libc/macros.h"
#include "libc/nt/createfile.h"
#include "libc/nt/enum/accessmask.h"
#include "libc/nt/enum/creationdisposition.h"
#include "libc/nt/enum/fileflagandattributes.h"
#include "libc/nt/enum/filesharemode.h"
#include "libc/nt/enum/io.h"
#include "libc/nt/enum/movefileexflags.h"
#include "libc/nt/errors.h"
#include "libc/nt/files.h"
#include "libc/nt/process.h"
#include "libc/nt/runtime.h"
#include "libc/nt/struct/win32fileattributedata.h"
#include "libc/nt/struct/win32finddata.h"
#include "libc/nt/synchronization.h"
#include "libc/str/str.h"
#include "libc/sysv/consts/at.h"
#include "libc/sysv/errfuns.h"

static textwindows bool IsDirectorySymlink(const char16_t *path) {
  int e;
  int64_t h;
  struct NtWin32FindData data;
  struct NtWin32FileAttributeData info;
  e = errno;
  if (GetFileAttributesEx(path, 0, &info) &&
      ((info.dwFileAttributes & kNtFileAttributeDirectory) &&
       (info.dwFileAttributes & kNtFileAttributeReparsePoint)) &&
      (h = FindFirstFile(path, &data)) != -1) {
    FindClose(h);
    return data.dwReserved0 == kNtIoReparseTagSymlink ||
           data.dwReserved0 == kNtIoReparseTagMountPoint;
  } else {
    errno = e;
    return false;
  }
}

// True when the directory PATH has an entry that does not wait for its
// deletion. Such an entry opens, and an entry with a deletion that waits
// gives an access error. Then RemoveDirectory() fails for a real reason,
// and a wait does not help.
static textwindows bool HasLiveEntry(const char16_t *path) {
  char16_t buf[PATH_MAX];
  struct NtWin32FindData data;
  bool live = false;
  int64_t h, f;
  size_t n, m;
  n = strlen16(path);
  if (n && (path[n - 1] == '\\' || path[n - 1] == '/'))
    --n;
  if (n + 2 + ARRAYLEN(data.cFileName) > ARRAYLEN(buf))
    return false;
  memcpy(buf, path, n * sizeof(char16_t));
  buf[n] = '\\';
  buf[n + 1] = '*';
  buf[n + 2] = 0;
  if ((h = FindFirstFile(buf, &data)) == -1)
    return false;
  do {
    if (data.cFileName[0] == '.' &&
        (!data.cFileName[1] ||
         (data.cFileName[1] == '.' && !data.cFileName[2])))
      continue;
    m = strlen16(data.cFileName);
    memcpy(buf + n + 1, data.cFileName, (m + 1) * sizeof(char16_t));
    f = CreateFile(buf, kNtFileReadAttributes,
                   kNtFileShareRead | kNtFileShareWrite | kNtFileShareDelete,
                   0, kNtOpenExisting,
                   kNtFileFlagBackupSemantics | kNtFileFlagOpenReparsePoint,
                   0);
    if (f != -1) {
      CloseHandle(f);
      live = true;
    }
  } while (!live && FindNextFile(h, &data));
  FindClose(h);
  return live;
}

static textwindows int sys_rmdir_nt(const char16_t *path) {
  int ms;
  for (ms = 1;; ms *= 2) {
    if (RemoveDirectory(path))
      return 0;
    // Files can linger, for absolutely no reason.
    // Possibly some Windows Defender bug on Win7.
    // Sleep for up to one second w/ expo backoff.
    // Alternative is use Microsoft internal APIs.
    // Never could have imagined it'd be this bad.
    if (GetLastError() == kNtErrorDirNotEmpty && ms <= 1024) {
      // A wait helps only when each entry waits for its deletion.
      if (HasLiveEntry(path)) {
        SetLastError(kNtErrorDirNotEmpty);
        break;
      }
      Sleep(ms);
      continue;
    } else {
      break;
    }
  }
  return __winerr();
}

static textwindows int sys_unlink_nt(const char16_t *path) {
  if (IsDirectorySymlink(path)) {
    return sys_rmdir_nt(path);
  } else if (DeleteFile(path)) {
    return 0;
  } else {
    return -1;
  }
}

textwindows int sys_unlinkat_nt_impl(const char16_t *path, int flags) {
  if (flags & AT_REMOVEDIR) {
    return sys_rmdir_nt(path);
  } else {
    return sys_unlink_nt(path);
  }
}

textwindows int sys_unlinkat_nt(int dirfd, const char *path, int flags) {
  char16_t path16[PATH_MAX];

  // check validity of flags
  if (flags & ~AT_REMOVEDIR) {
    return einval();
  }

  // translate unix to windows path
  int n;
  if ((n = __mkntpathat(dirfd, path, 0, path16)) == -1) {
    return -1;
  }

  // optimistic first attempt
  int e = errno;
  int rc = sys_unlinkat_nt_impl(path16, flags);

  // reactively ensure unlink() deletes read-only files
  if (rc == -1 && errno == kNtErrorAccessDenied) {
    uint32_t attr;
    if ((attr = GetFileAttributes(path16)) != -1u &&
        (attr & kNtFileAttributeReadonly) &&
        SetFileAttributes(path16, attr & ~kNtFileAttributeReadonly)) {
      errno = e;
      rc = sys_unlinkat_nt_impl(path16, flags);
    } else {
      errno = kNtErrorAccessDenied;
    }
  }

  // return status
  return __fix_enotdir(rc, path16);
}
