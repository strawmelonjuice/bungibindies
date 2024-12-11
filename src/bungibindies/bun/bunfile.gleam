//// A `BunFile` represents a lazily-loaded file; initializing it does not actually read the file from disk.

import gleam/javascript/map.{type Map}
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
pub fn json(file: BunFile) -> Promise(Map(String, String))
