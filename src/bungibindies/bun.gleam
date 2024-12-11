//// Gleam bindings to the Bun runtime API's.

import gleam/javascript/array.{type Array}
import gleam/javascript/map.{type Map}
import gleam/javascript/promise.{type Promise}

// 	Bun.version Bun.revision Bun.env Bun.main Bun.sleep() Bun.sleepSync() Bun.which() Bun.peek() Bun.openInEditor() Bun.deepEquals() Bun.escapeHTML() Bun.fileURLToPath() Bun.pathToFileURL() Bun.gzipSync() Bun.gunzipSync() Bun.deflateSync() Bun.inflateSync() Bun.inspect() Bun.nanoseconds() Bun.readableStreamTo*() Bun.resolveSync()

// Utilities

/// # `Bun.version`
/// - Utilities
/// 
/// A string containing the version of the bun CLI that is currently running.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cversion")
pub fn version() -> String

/// # `Bun.revision`
/// - Utilities
/// 
/// A string containing the git revision of the bun CLI that is currently running.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Crevision")
pub fn revision() -> String

/// # `Bun.env`
/// - Utilities
/// 
/// Fetches the value of an environment variable.
pub fn env(key: String) -> Result(String, Nil) {
  case v_env(key) {
    [value] -> Ok(value)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "Cenv")
fn v_env(key: String) -> List(String)

/// # `Bun.main`
/// - Utilities
/// 
/// An absolute path to the entrypoint javascript module of the current program (the file that was executed with bun run).
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cmain")
pub fn main_() -> String

/// # `Bun.sleep()`
/// - Utilities
/// 
/// Sleeps for the given number of milliseconds.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Csleep")
pub fn sleep(ms: Float) -> Nil

/// # `Bun.sleepSync()`
/// - Utilities
/// 
/// Sleeps for the given number of milliseconds.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CsleepSync")
pub fn sleep_sync(ms: Float) -> Nil

/// # `Bun.which()`
/// - Utilities
/// 
/// Returns the path to the given executable if it is in the PATH, otherwise returns an empty string.
pub fn which(executable: String) -> Result(String, Nil) {
  case v_which(executable) {
    [path] -> Ok(path)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "Cwhich")
fn v_which(executable: String) -> List(String)

/// # `Bun.which()`
/// - Utilities
/// 
/// Returns the path to the given executable if it is in the PATH, otherwise returns an empty string.
pub fn which_with_options(
  executable: String,
  options: Map(String, String),
) -> Result(String, Nil) {
  case v_which_with_options(executable, options) {
    [path] -> Ok(path)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "CwhichWithOptions")
fn v_which_with_options(
  executable: String,
  options: Map(String, String),
) -> List(String)

/// # `Bun.randomUUIDv7()`
/// - Utilities
/// 
/// Returns a UUID v7, which is monotonic and suitable for sorting and databases.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CrandomUUIDv7")
pub fn random_uuid_v7() -> String

/// # `Bun.randomUUIDv7()`
/// - Utilities
/// 
/// Returns a UUID v7, which is monotonic and suitable for sorting and databases as a buffer.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CrandomUUIDv7_buffer")
pub fn random_uuid_v7_buffer() -> Array(Int)

/// # `Bun.peek()`	
/// - Utilities
/// 
/// Reads a promise's result without await or .then, but only if the promise has already fulfilled or rejected.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cpeek")
pub fn peek(promise: Promise(a)) -> Result(a, Nil)

/// # `Bun.openInEditor()`
/// - Utilities
/// 
/// Opens a file in the user's editor.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CopenInEditor")
pub fn open_in_editor(path: String) -> Nil

/// # `Bun.openInEditor()`
/// - Utilities
/// 
/// Opens a file in the user's editor.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CopenInEditorWithOptions")
pub fn open_in_editor_with_options(
  path: String,
  options: Map(String, String),
) -> Nil

/// # `Bun.deepEquals()`
/// - Utilities
/// 
/// Recursively checks if two objects are equivalent. This is used internally by `expect().toEqual()` in `bun/test`.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CdeepEquals")
pub fn deep_equals(a: a, b: a) -> Bool

/// # `Bun.deepEquals()`
/// - Utilities
/// 
/// Recursively checks if two objects are equivalent. This is used internally by `expect().toEqual()` in `bun/test`.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CdeepEqualsStrict")
pub fn deep_equals_strict(a: a, b: a) -> Bool

/// # `Bun.escapeHTML()`
/// - Utilities
/// 
/// `Bun.escapeHTML(value: string | object | number | boolean): string`
/// Escapes the following characters from an input string:
///
/// - `"` becomes `&quot;`
/// - `&` becomes `&amp;`
/// - `'` becomes `&#x27;`
/// - `<` becomes `&lt;`
/// - `>` becomes `&gt;`
///
/// This function is optimized for large input. On an M1X, it processes 480 MB/s -
/// 20 GB/s, depending on how much data is being escaped and whether there is non-ascii
/// text. Non-string types will be converted to a string before escaping.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CescapeHTML")
pub fn escape_html(value: a) -> String

/// # `Bun.stringWidth()`
/// - Utilities
/// 
/// Get the column count of a string as it would be displayed in a terminal.
/// Supports ANSI escape codes, emoji, and wide characters.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CstringWidth")
pub fn string_width(
  value: String,
  count_ansi_escape_codes: Bool,
  ambiguous_is_narrow: Bool,
) -> Int

/// # `Bun.fileURLToPath()`
/// - Utilities
/// 
/// Converts a file URL to a file path.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CfileURLToPath")
pub fn file_url_to_path(url: String) -> String

/// # `Bun.pathToFileURL()`
/// - Utilities
/// 
/// Converts a file path to a file URL.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CpathToFileURL")
pub fn path_to_file_url(path: String) -> String

/// # `Bun.gzipSync()`
/// - Utilities
/// 
/// Compresses an array of bytes using gzip.
/// 
/// NOT IMPLEMENTED
pub fn gzip_sync(_data: BitArray) -> BitArray {
  panic as "Not implemented"
}

/// # `Bun.gunzipSync()`
/// - Utilities
/// 
/// Decompresses an array of bytes using gzip.
/// NOT IMPLEMENTED
pub fn gunzip_sync(_data: BitArray) -> BitArray {
  panic as "Not implemented"
}

/// # `Bun.deflateSync()`
/// - Utilities
/// 
/// Compresses an array of bytes using deflate.
/// NOT IMPLEMENTED
pub fn deflate_sync(_data: BitArray) -> BitArray {
  panic as "Not implemented"
}

/// # `Bun.inflateSync()`
/// - Utilities
/// 
/// Decompresses an array of bytes using deflate.
/// NOT IMPLEMENTED
pub fn inflate_sync(_data: BitArray) -> BitArray {
  panic as "Not implemented"
}

/// # `Bun.inspect()`
/// - Utilities
/// 
/// Returns a string representation of an object.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cinspect")
pub fn inspect(value: a) -> String

/// # `Bun.nanoseconds()`
/// - Utilities
/// 
/// Returns the number of nanoseconds since the current `bun` process started, as a `number`. Useful for high-precision timing and benchmarking.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cnanoseconds")
pub fn nanoseconds() -> Float

/// # `Bun.resolveSync()`
/// - Utilities
/// 
/// Resolves a file path or module specifier using Bun's internal module resolution algorithm. The first argument is the path to resolve, and the second argument is the "root". If no match is found, an `Error` is thrown.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CresolveSync")
pub fn resolve_sync(module: String, parent: String) -> String
