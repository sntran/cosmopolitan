# The patches of this fork

This fork of [jart/cosmopolitan](https://github.com/jart/cosmopolitan)
keeps fixes that the projects of its owner need, such as
[BEAM.com](https://github.com/sntran/BEAM.com) and
[tailwind.com](https://github.com/sntran/tailwind.com). Other projects
can use them too.

- The branch `master` is an exact copy of `jart/cosmopolitan`. Do not
  commit to it.
- The branch `main` is the tag `4.0.2` of upstream, with one commit for
  each change of the table below.
- Each release `4.0.2-patched.N` has `cosmocc-4.0.2-patched.N.zip`: the
  official cosmocc 4.0.2 with the libc, the tools, the loaders and the
  headers of `main`.

The C-numbers are the entries of
[docs/UPSTREAM.md](https://github.com/sntran/BEAM.com/blob/main/docs/UPSTREAM.md)
of BEAM.com, with the symptom, the cause and the measurements of each
fault.

## Use the patched cosmocc

1. Download `cosmocc-4.0.2-patched.N.zip` and `SHA256SUMS` from the
   releases of this repository.
2. Check the file:

   ```sh
   sha256sum -c SHA256SUMS
   gh attestation verify cosmocc-4.0.2-patched.N.zip --repo sntran/cosmopolitan
   ```

3. Use it as cosmocc 4.0.2. The compilers are the compilers of the
   official release.

Caution: on macOS arm64, the shell header of an APE file compiles the
loader `ape-m1.c` only when `$TMPDIR/.ape-1.10` or `~/.ape-1.10` does
not exist. A Mac that ran an older APE file keeps the old loader there.
Remove these files once, so that the fixed loader (C51, C57) is used.

### Windows on ARM64

The file `bin/ape-arm64.exe` is the native loader of Windows on ARM64.
It runs the aarch64 half of an APE file as native code:

```sh
ape-arm64.exe PROGRAM [ARGUMENTS]
```

Windows starts an APE file as its x86_64 half, under the x64 emulation.
A program that wants its native half on Windows on ARM64 puts the loader
in its zip, and its x86_64 half starts the loader with its own path.
`TryNativeArm64()` of `tool/cosmocc/check/hello.c` shows how.

## The changes

| C-number | Commit | Systems | Upstream `master` of 2026-11-19 |
|---|---|---|---|
| C49 | ape: make the code of the x86_64 loader readable | Linux on Rosetta | Open |
| C51, C57 | ape-m1: check that the fixed addresses of a program are free | macOS arm64 | Open |
| C47 | pledge: "inet" allows the buffer options of a socket on Linux | Linux | Open |
| C50 | unveil: "c" controls the removal of files on Linux | Linux | Open |
| C61, C62 | Windows: poll() of any count of sockets, and a wait with the wall clock | Windows | Open |
| C61, C63 | Windows: select() above 128 fds, and errors in each set | Windows | C61 fixed (the array is on the heap). C63 open. |
| C64 | Windows: close() does not flush a written file to the disk | Windows | Fixed: close() does not flush. |
| C68 | Windows: rmdir() of a directory with a real entry fails at once | Windows | Changed: rmdir() does not try again. |
| C58 | Windows on ARM64: a Windows layer for the aarch64 libc | Windows on ARM64 | Open: Windows is for x86_64 only. |
| C58 | Windows on ARM64: the native loader ape-arm64.exe | Windows on ARM64 | Open |
| C69 | XNU: a futex wait with a deadline that passed ends at once | macOS | Open |
| C71 | nsync: a semaphore wait of NetBSD waits again after EINTR | NetBSD | Open |

The commit "Build and check the patched cosmocc in CI" adds this file,
the workflow `.github/workflows/cosmocc.yml`, and the checks of
`tool/cosmocc/check`.
It also removes the workflows of upstream that do not apply to this
fork: the nightly build of cosmocc and the labels of pull requests.

### Changes that are not here yet

BEAM.com has workarounds in its own code for these faults of the libc.
A fix in this fork can replace them:

- C60: send() on a non-blocking socket blocks on Windows.
- C65: close() of a socket with a linger leaks the connection on
  Windows.
- C67: a timer of 1 ms takes about 15 ms on Windows. Upstream `master`
  calls `timeBeginPeriod(1)` at the start.
- C48: seccomp() makes the system call sendmsg on aarch64.
- C53: bind() refuses a Unix socket with a short path.

## The checks

The workflow builds cosmocc and runs two checks on Linux (x86_64 and
aarch64), macOS arm64, Windows x64, and Windows on ARM64:

- `tool/cosmocc/check/hello.c`: 20 checks of the libc. On Windows on
  ARM64, the aarch64 half runs with the loader of its zip.
- `tool/cosmocc/check/fixes.c`: the changes C47, C50, C61, C62, C63,
  C68 and C69. On Windows on ARM64, both halves run.

With the libc of the official cosmocc 4.0.2, `fixes.c` fails the checks
of C47 and C50 on Linux, and the check of C69 on macOS. With the patched
files, these checks pass.

## Make a release

1. Merge the pull request into `main`, and wait for the workflow
   "Patched cosmocc" on `main` to pass.
2. Start the release in one of two ways:
   - In the browser: open "Actions", then "Patched cosmocc", then "Run
     workflow". Select the branch `main`, and type the version
     `4.0.2-patched.N` in the field "release".
   - With git: push the tag `4.0.2-patched.N` on that commit of `main`.
3. The workflow builds cosmocc again, runs the checks, and publishes the
   release. A run by hand makes the tag on the commit of the run. It
   refuses a version that is not `4.0.2-patched.N`, a tag that exists,
   and a branch other than `main`.

Caution: the workflow publishes a release for each tag that matches
`*-patched.*`. Push such a tag only on a commit of `main`.

## Send a change upstream

The source of `master` is not the source of 4.0.2, so a change of
`main` can need a new form for `master`.

1. Make the branch `fix/TOPIC` from `master`.
2. Apply the change of `main`, and change it for the source of
   `master`.
3. Open a pull request from `fix/TOPIC` to `jart/cosmopolitan`.
4. Write the number of the pull request in the table above.

## Take a new release of upstream

1. Synchronize `master` with `jart/cosmopolitan` ("Sync fork" on
   GitHub).
2. Make a branch from the new tag of upstream.
3. Apply each commit of `main` in order (`git cherry-pick`). Drop a
   commit that upstream already has, and change a commit that does not
   apply.
4. Change `COSMOCC_BASE` and `COSMOCC_BASE_SHA256` in
   `.github/workflows/cosmocc.yml`.
5. Open a pull request, and make that branch the new `main`. The
   releases of the new base have the names `VERSION-patched.N`.
