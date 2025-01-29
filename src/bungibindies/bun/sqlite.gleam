//// # `Bun:sqlite` module

import bungibindies/bun/sqlite/param_array.{type ParamArray}
import gleam/dynamic.{type Dynamic}
import gleam/javascript/array.{type Array}

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

/// [`bun:sqlite.Database -> exec()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use the `db.exec()` method on your `Database` instance to execute a SQL query. The result is a `RunResult` instance.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mexec")
pub fn exec(db: Database, query: String) -> RunResult

/// [`bun:sqlite.Statement -> prepare()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use the `db.prepare()` method on your `Database` instance to [prepare](https://www.sqlite.org/c3ref/prepare.html) a SQL query. The result is a `Statement` instance that will NOT be cached on the `Database` instance. _The query will not be executed.
/// > **Note** — Use the `.query()` method to prepare a query _with_ caching it on the `Database` instance.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mprepare")
pub fn prepare(db: Database, query: String) -> Statement

/// The `RunResult` type is an object with two properties: `lastInsertRowid` and `changes`.
/// It is emitted by the `run` function.
pub type RunResult {
  RunResult(last_insert_row_id: Int, changes: Int)
}

/// [`bun:sqlite.run()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use `.run()` to run a query and get back a `RunResult`. This is useful for schema-modifying queries (e.g. `CREATE TABLE`) or bulk write operations.
///
/// Internally, this calls [`sqlite3_reset`](https://www.sqlite.org/capi3ref.html#sqlite3_reset) and calls [`sqlite3_step`](https://www.sqlite.org/capi3ref.html#sqlite3_step) once. Stepping through all the rows is not necessary when you don't care about the results.
/// The `lastInsertRowid` property returns the ID of the last row inserted into the database. The `changes` property is the number of rows affected by the query.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mrun")
pub fn run(statement: Statement, params: ParamArray) -> RunResult

/// [`all`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use `.all()` to run a query and get back the results as an array of objects.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mall")
pub fn all(statement: Statement, params: ParamArray) -> Array(Dynamic)

/// [`get`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use `.get()` to run a query and get back the first result as an object.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mget")
pub fn get(statement: Statement, params: ParamArray) -> Dynamic

/// [`close()`](https://bun.sh/docs/api/sqlite)
/// - Sqlite
///
/// Use `.close()` to close the database connection.
@external(javascript, "../../bun_sqlite_ffi.ts", "Mclose")
pub fn close(db: Database) -> Nil
