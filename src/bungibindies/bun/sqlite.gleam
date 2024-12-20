//// # `Bun:sqlite` module

pub type Database

/// [`bun:sqlite.Database -> New()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Create a new database connection
@external(javascript, "../../bun_sqlite_ffi.ts", "Cnew")
pub fn new(to: String) -> Database
/// [`bun:sqlite.Database -> Exec()`](https://bun.sh/docs/api/file-io#reading-files-bun-file)
