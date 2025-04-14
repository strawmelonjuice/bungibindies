import gleam/dict

@internal
pub type InternalMap(key, value)

@internal
pub fn from_dict(some_dict: dict.Dict(a, b)) -> InternalMap(a, b) {
  let new_map = map_new()
  dict.each(some_dict, fn(k, v) { map_set(new_map, k, v) })
  new_map
}

@external(javascript, "./type_gymnastics_ts.ts", "map_new")
fn map_new() -> InternalMap(key, value)

@external(javascript, "./type_gymnastics_ts.ts", "map_set")
fn map_set(
  a: InternalMap(key, value),
  b: key,
  c: value,
) -> InternalMap(key, value)
