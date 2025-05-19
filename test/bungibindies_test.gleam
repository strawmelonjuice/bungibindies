import birdie
import bungibindies
import bungibindies/bun
import bungibindies/bun/bunfile
import bungibindies/bun/spawn.{OptionsToSubprocess}
import bungibindies/bun/sqlite
import bungibindies/bun/sqlite/param_array
import gleam/dynamic/decode
import gleam/javascript/array
import gleam/javascript/promise
import gleam/list
import gleam/option
import gleam/string
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn runs_in_bun_test() {
  // Well, this isn't really a test of this library, it's more that if this one fails, well, the rest of the tests will fail too.
  let result = bungibindies.runs_in_bun()
  result
  |> should.equal(Ok(Nil))
}

/// Tests if files can be read
pub fn file_read_test() {
  use data <- promise.await({
    bun.file("./test/testfiles/reading.txt") |> bunfile.text()
  })
  data
  |> string.trim()
  |> should.equal("Hello world! This file is for testing reading :)")
  |> promise.resolve()
}

pub fn file_write_test() {
  let data = "Hello world! This file is for testing writing :)"
  let file = bun.file("./test/testfiles/writing.txt")
  use _ <- promise.await({ file |> bun.write(data) })
  // If `file_read_test()` fails, this will fail too
  use read_data <- promise.await({ file |> bunfile.text() })
  read_data
  |> string.trim()
  |> should.equal(data)
  |> promise.resolve()
}

pub fn sqlite_1_test() {
  // Create a new in-memory database
  let db = sqlite.new(":memory:")
  // Create a sample table
  db
  |> sqlite.query("CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)")
  |> sqlite.run(param_array.new())
  db
  // Insert sample data
  |> sqlite.query("INSERT INTO test (name) VALUES ('Alice')")
  |> sqlite.run(param_array.new())
  db
  |> sqlite.query("INSERT INTO test (name) VALUES ('Bob')")
  |> sqlite.run(param_array.new())
  let result =
    db |> sqlite.query("SELECT * FROM test") |> sqlite.all(param_array.new())
  // Close the database
  db |> sqlite.close()
  // Decode and check the result
  result
  |> array.to_list()
  |> list.map(fn(row) { decode.run(row, test_person_decoder()) })
  |> should.equal([Ok(#(1, "Alice")), Ok(#(2, "Bob"))])
}

fn test_person_decoder() -> decode.Decoder(#(Int, String)) {
  use id <- decode.field("id", decode.int)
  use name <- decode.field("name", decode.string)
  decode.success(#(id, name))
}

pub fn spawn_test() {
  let assert Ok(bunbin) = bun.which("bun") as "THIS IS INSANE"
  let result =
    spawn.sync(OptionsToSubprocess(
      cmd: [bunbin, "x", "cowsay", "hello"],
      cwd: option.None,
      env: option.None,
      stderr: option.None,
      stdout: option.None,
    ))
  let assert Ok(output) = spawn.stdout(result)
  output |> birdie.snap(title: "cowsay hello (bun spawnsync test)")
}
