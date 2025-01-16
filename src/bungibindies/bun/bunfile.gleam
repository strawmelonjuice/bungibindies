//// A `BunFile` represents a lazily-loaded file; initializing it does not actually read the file from disk.
//// 
//// > **Note from Bun** — The `Bun.file` and `Bun.write` APIs documented on this page are heavily optimized and represent the recommended way to perform file-system tasks using Bun. For operations that are not yet available with `Bun.file`, such as `mkdir` or `readdir`, you can use Bun's [nearly complete](https://bun.sh/docs/runtime/nodejs-apis#node-fs) implementation of the [`node:fs`](https://nodejs.org/api/fs.html) module.

import gleam/dynamic.{type Dynamic}
import gleam/javascript/promise.{type Promise}

/// A `BunFile` represents a lazily-loaded file; initializing it does not actually read the file from disk.
pub type BunFile

/// [`Bunfile.text()`](https://bun.sh/docs/api/file-io#reading-files-bun-file)
/// - File I/O
///
/// Read the contents of a file as a string.
@external(javascript, "../../bun_bun_file_ffi.ts", "Mtext")
pub fn text(file: BunFile) -> Promise(String)

/// [`Bunfile.json()`](https://bun.sh/docs/api/file-io#reading-files-bun-file)
/// - File I/O
///
/// Read the contents of a file as a JSON object.
@external(javascript, "../../bun_bun_file_ffi.ts", "Mjson")
pub fn json(file: BunFile) -> Promise(Dynamic)

/// [`Bun.stdout`](https://bun.sh/docs/api/file-io#writing-files-bun-write)
/// - File I/O
/// 
/// Write to stdout
@external(javascript, "../../bun_bun_file_ffi.ts", "Cstdout")
pub fn stdout() -> BunFile

/// [`Bun.stderr`](https://bun.sh/docs/api/file-io#writing-files-bun-write)
/// - File I/O
///
/// Write to stderr
@external(javascript, "../../bun_bun_file_ffi.ts", "Cstderr")
pub fn stderr() -> BunFile

/// [`Bun.stdin`](https://bun.sh/docs/api/file-io#reading-files-bun-file)
/// - File I/O
/// 
/// Read from stdin
/// 
///This is read-only
@external(javascript, "../../bun_bun_file_ffi.ts", "Cstdin")
pub fn stdin() -> BunFile
