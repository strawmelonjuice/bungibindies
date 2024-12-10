//// Gleam bindings to the Bun runtime API's.
import plinth/javascript/console
import gleam/javascript/array
import plinth/node/process

// not removing main for now, will be used for testing
pub fn main() {
  let assert Ok(s) = process.argv()|> array.get(0)
  console.log("Hello from '"<> s <> "'!")
}
