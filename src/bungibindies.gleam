/// Check if running in the Bun runtime. Returns `Ok(Nil)` if running in Bun, `Error(Nil)` otherwise.
pub fn runs_in_bun() {
  case i_runs_in_bun() {
    True -> Ok(Nil)
    False -> Error(Nil)
  }
}

@external(javascript, "./bungibindies_ffi.ts", "Cruns_in_bun")
fn i_runs_in_bun() -> Bool
