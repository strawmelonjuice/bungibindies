import gleam/javascript/promise
import bungibindies/bun/bunfile
import gleeunit
import gleeunit/should
import bungibindies/bun


pub fn main() {
  gleeunit.main()
}

/// Tests if files can be read
pub fn file_read_test() {
  let a = bun.file("./test/hello.txt")|>bunfile.text()
  use data <- promise.await(a)
  data
  |> should.equal("Hello world! This file is for testing :)\n")
  promise.resolve(Nil)
}
