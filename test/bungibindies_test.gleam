import bungibindies/bun
import bungibindies/bun/bunfile
import gleam/javascript/promise
import gleam/string
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
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
