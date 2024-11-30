# Compilers-24Fall

This repository contains the assignment code for the "Compilers" course at Fudan University (Fall 2024).

## Notes

* I've made significant improvements to the original repository, which had bad programming practices. For example:
  * The code was written in C with STL.
  * The code had severe memory leaks.
    > While some may argue that memory leaks are acceptable in compiler projects (since they don't run continuously), I believe even short-lived compilers should be free of memory issues. Memory leaks can lead to safety vulnerabilities, out-of-memory (OOM) errors, and subtle memory-related bugs. Moreover, if I can't manage dynamic memory correctly in a small project (around 10k LOC), it's unlikely that I'll handle it well in larger projects.
  * The code also had inconsistent and confusing naming conventions and comments.

* The project is primarily implemented and tested on Apple Silicon Macs. The reference environment is as follows:
  ```shell
  $ clang++ --version
  Homebrew clang version 19.1.0
  Target: arm64-apple-darwin24.1.0
  Thread model: posix
  InstalledDir: /opt/homebrew/Cellar/llvm/19.1.0/bin
  ```
  ```shell
  $ uname -a
  Darwin MacBook-Pro-2.local 24.1.0 Darwin Kernel Version 24.1.0: Mon Sep  2 19:59:57 PDT 2024; root:xnu-11215.40.48~33/RELEASE_ARM64_T8103 arm64
  ```
  However, the project can be easily ported to other platforms if needed.

* The refactoring effort has been substantial, which results in two late submissions of the assignments. Despite significant changes, some issues remain in the code (for example, the AST generation is still in its original form). For those interested, there is also a [Rust implementation](https://github.com/Boreas618/teaplc-rs) of this compiler available.
