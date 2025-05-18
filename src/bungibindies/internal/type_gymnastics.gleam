import gleam/dict
import gleam/javascript/array
import gleam/option.{type Option, None, Some}

// InternalMap functions

@internal
pub type InternalMap(key, value)

@external(javascript, "./type_gymnastics_ts.ts", "map_new")
pub fn map_new() -> InternalMap(key, value)

@external(javascript, "./type_gymnastics_ts.ts", "map_set")
pub fn map_set(
  a: InternalMap(key, value),
  b: key,
  c: value,
) -> InternalMap(key, value)

@external(javascript, "./type_gymnastics_ts.ts", "map_set")
pub fn map_update(
  a: InternalMap(key, value),
  b: key,
  c: fn(value) -> value,
) -> InternalMap(key, value)

pub fn map_from_dict(a_dict: dict.Dict(key, value)) -> InternalMap(key, value) {
  let a_list = dict.to_list(a_dict)
  map_to_dict_iteration(map_new(), a_list)
}

fn map_to_dict_iteration(
  a: InternalMap(key, value),
  b: List(#(key, value)),
) -> InternalMap(key, value) {
  case b {
    [] -> a
    [head, ..tail] -> map_to_dict_iteration(map_set(a, head.0, head.1), tail)
  }
}

// SomethingOrUndefined functions

@internal
pub type SomethingOrUndefined

@external(javascript, "./type_gymnastics_ts", "fn_undefined")
fn undefined() -> SomethingOrUndefined

@external(javascript, "./type_gymnastics_ts", "fn_type")
fn tojs(whatever: a) -> SomethingOrUndefined

pub fn option_to_something(what: Option(whatever)) -> SomethingOrUndefined {
  case what {
    None -> undefined()
    Some(mommy) -> tojs(mommy)
  }
}

pub fn option_to_something_list_to_array(
  what: Option(List(whatever)),
) -> SomethingOrUndefined {
  case what {
    None -> undefined()
    Some([]) -> undefined()
    Some(mommy) -> tojs(array.from_list(mommy))
  }
}
