import bungibindies/bun
import bungibindies/bun/bunfile
import gleam/javascript/promise
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

/// Tests if files can be read
pub fn file_read_test() {
  use data <- promise.await({ bun.file("./test/hello.txt") |> bunfile.text() })
  data
  |> should.equal("Hello world! This file is for testing :)\n")
  promise.resolve(Nil)
}
