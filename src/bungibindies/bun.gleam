//// Gleam bindings to the Bun runtime API's.

import bungibindies/bun/bunfile.{type BunFile}
import gleam/javascript/array.{type Array}
import gleam/javascript/map.{type Map}
import gleam/javascript/promise.{type Promise}

// Utilities

/// [`Bun.version`](https://bun.sh/docs/api/utils#bun-version)
/// - Utilities
///
/// > A string containing the version of the bun CLI that is currently running.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cversion")
pub fn version() -> String

/// [`Bun.revision`](https://bun.sh/docs/api/utils#bun-revision)
/// - Utilities
///
/// > A string containing the git revision of the bun CLI that is currently running.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Crevision")
pub fn revision() -> String

/// [`Bun.env`](https://bun.sh/docs/api/utils#bun-env)
/// - Utilities
///
/// > Fetches the value of an environment variable.
pub fn env(key: String) -> Result(String, Nil) {
  case v_env(key) |> array.to_list {
    [value] -> Ok(value)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "Cenv")
fn v_env(key: String) -> Array(String)

/// [`Bun.main`](https://bun.sh/docs/api/utils#bun-main)
/// - Utilities
///
/// > An absolute path to the entrypoint javascript module of the current program (the file that was executed with bun run).
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cmain")
pub fn main_() -> String

/// [`Bun.sleep()`](https://bun.sh/docs/api/utils#bun-sleep)
/// - Utilities
///
/// > Sleeps for the given number of milliseconds.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Csleep")
pub fn sleep(ms: Float) -> Nil

/// [`Bun.sleepSync()`](https://bun.sh/docs/api/utils#bun-sleepsync)
/// - Utilities
///
/// > Sleeps for the given number of milliseconds synchronously.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CsleepSync")
pub fn sleep_sync(ms: Float) -> Nil

/// [`Bun.which()`](https://bun.sh/docs/api/utils#bun-which)
/// - Utilities
///
/// > Returns the path to the given executable if it is in the PATH.
pub fn which(executable: String) -> Result(String, Nil) {
  case v_which(executable) |> array.to_list {
    [path] -> Ok(path)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "Cwhich")
fn v_which(executable: String) -> Array(String)

/// [`Bun.which()`](https://bun.sh/docs/api/utils#bun-which)
/// - Utilities
///
/// > Returns the path to the given executable if it is in the PATH
pub fn which_with_options(
  executable: String,
  options: Map(String, String),
) -> Result(String, Nil) {
  case v_which_with_options(executable, options) |> array.to_list {
    [path] -> Ok(path)
    _ -> Error(Nil)
  }
}

@external(javascript, "../bun_bun_utilities_ffi.ts", "CwhichWithOptions")
fn v_which_with_options(
  executable: String,
  options: Map(String, String),
) -> Array(String)

/// [`Bun.randomUUIDv7()](https://bun.sh/docs/api/utils#bun-randomuuidv7)
/// - Utilities
///
/// > Returns a UUID v7, which is monotonic and suitable for sorting and databases.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CrandomUUIDv7")
pub fn random_uuid_v7() -> String

/// [`Bun.randomUUIDv7()`](https://bun.sh/docs/api/utils#bun-randomuuidv7)
/// - Utilities
///
/// > Returns a UUID v7, which is monotonic and suitable for sorting and databases as a buffer.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CrandomUUIDv7_buffer")
pub fn random_uuid_v7_buffer() -> Array(Int)

/// [`Bun.peek()`](https://bun.sh/docs/api/utils#bun-peek)
/// - Utilities
///
/// > Reads a promise's result without await or .then, but only if the promise has already fulfilled or rejected.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cpeek")
pub fn peek(promise: Promise(a)) -> Result(a, Nil)

/// [`Bun.openInEditor()`](https://bun.sh/docs/api/utils#bun-openineditor)
/// - Utilities
///
/// > Opens a file in the user's editor.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CopenInEditor")
pub fn open_in_editor(path: String) -> Nil

/// [`Bun.openInEditor()`](https://bun.sh/docs/api/utils#bun-openineditor)
/// - Utilities
///
/// > Opens a file in the user's editor.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CopenInEditorWithOptions")
pub fn open_in_editor_with_options(
  path: String,
  options: Map(String, String),
) -> Nil

/// [`Bun.deepEquals()`](https://bun.sh/docs/api/utils#bun-deepequals)
/// - Utilities
///
/// > Recursively checks if two objects are equivalent. This is used internally by `expect().toEqual()` in `bun/test`.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CdeepEquals")
pub fn deep_equals(a: a, b: a) -> Bool

/// [`Bun.deepEquals()`](https://bun.sh/docs/api/utils#bun-deepequals)
/// - Utilities
///
/// > Recursively checks if two objects are equivalent. This is used internally by `expect().toEqual()` in `bun/test`.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CdeepEqualsStrict")
pub fn deep_equals_strict(a: a, b: a) -> Bool

/// [`Bun.escapeHTML()`](https://bun.sh/docs/api/utils#bun-escapehtml)
/// - Utilities
///
/// > `Bun.escapeHTML(value: string | object | number | boolean): string`
/// Escapes the following characters from an input string:
///
/// > - `"` becomes `&quot;`
/// - `&` becomes `&amp;`
/// - `'` becomes `&#x27;`
/// - `<` becomes `&lt;`
/// - `>` becomes `&gt;`
///
/// > This function is optimized for large input. On an M1X, it processes 480 MB/s -
/// 20 GB/s, depending on how much data is being escaped and whether there is non-ascii
/// text. Non-string types will be converted to a string before escaping.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CescapeHTML")
pub fn escape_html(value: a) -> String

/// [`Bun.stringWidth()`](https://bun.sh/docs/api/utils#bun-stringwidth)
/// - Utilities
///
/// > Get the column count of a string as it would be displayed in a terminal.
/// Supports ANSI escape codes, emoji, and wide characters.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CstringWidth")
pub fn string_width(
  value: String,
  count_ansi_escape_codes: Bool,
  ambiguous_is_narrow: Bool,
) -> Int

/// [`Bun.fileURLToPath()`](https://bun.sh/docs/api/utils#bun-fileurltopath)
/// - Utilities
///
/// > Converts a file URL to a file path.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CfileURLToPath")
pub fn file_url_to_path(url: String) -> String

/// [`Bun.pathToFileURL()`](https://bun.sh/docs/api/utils#bun-pathtofileurl)
/// - Utilities
///
/// > Converts a file path to a file URL.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CpathToFileURL")
pub fn path_to_file_url(path: String) -> String

/// [`Bun.inspect()`](https://bun.sh/docs/api/utils#bun-inspect)
/// - Utilities
///
/// > Returns a string representation of an object.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cinspect")
pub fn inspect(value: a) -> String

/// [`Bun.nanoseconds()`](https://bun.sh/docs/api/utils#bun-nanoseconds)
/// - Utilities
///
/// > Returns the number of nanoseconds since the current `bun` process started, as a `number`. Useful for high-precision timing and benchmarking.
@external(javascript, "../bun_bun_utilities_ffi.ts", "Cnanoseconds")
pub fn nanoseconds() -> Float

/// [`Bun.resolveSync()`](https://bun.sh/docs/api/utils#bun-resolvesync)
/// - Utilities
///
/// > Resolves a file path or module specifier using Bun's internal module resolution algorithm. The first argument is the path to resolve, and the second argument is the "root". If no match is found, an `Error` is thrown.
@external(javascript, "../bun_bun_utilities_ffi.ts", "CresolveSync")
pub fn resolve_sync(module: String, parent: String) -> String

// File I/O

/// [`Bun.file()`](https://bun.sh/docs/api/fs#bun-file)
/// - File I/O
///
/// Create a BunFile instance with the `Bun.file(path)` function.
@external(javascript, "../bun_bun_file_ffi.ts", "Cfile")
pub fn file(path: String) -> BunFile

/// [`Bun.write()`](https://bun.sh/docs/api/fs#bun-write)
/// - File I/O
///
/// The `Bun.write` function is a multi-tool for writing payloads of all kinds to disk.
///
/// @param destination — The file to write to
/// @param data — The data to copy into destination.
/// @returns — A promise that resolves with the number of bytes written.
@external(javascript, "../bun_bun_file_ffi.ts", "Cwrite")
pub fn write(destination: BunFile, data: a) -> Promise(Int)
