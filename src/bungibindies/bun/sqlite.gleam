//// # `Bun:sqlite` module

/// The `Database` type is an instance of a database collection.
pub type Database

/// A `Statement` is a _prepared query_, which means it's been parsed and compiled into an efficient binary form. It can be executed multiple times in a performant way.
pub type Statement

/// [`bun:sqlite.Database -> New()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Create a new database connection
@external(javascript, "../../bun_sqlite_ffi.ts", "Cnew")
pub fn new(to: String) -> Database

/// [`bun:sqlite.Database -> query()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use the `db.query()` method on your `Database` instance to [prepare](https://www.sqlite.org/c3ref/prepare.html) a SQL query. The result is a `Statement` instance that will be cached on the `Database` instance. _The query will not be executed.
/// > **Note** — Use the `.prepare()` method to prepare a query _without_ caching it on the `Database` instance.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mquery")
pub fn query(db: Database, query: String) -> Statement

/// [`bun:sqlite.Statement -> prepare()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use the `db.prepare()` method on your `Database` instance to [prepare](https://www.sqlite.org/c3ref/prepare.html) a SQL query. The result is a `Statement` instance that will NOT be cached on the `Database` instance. _The query will not be executed.
/// > **Note** — Use the `.query()` method to prepare a query _with_ caching it on the `Database` instance.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mprepare")
pub fn prepare(db: Database, query: String) -> Statement
