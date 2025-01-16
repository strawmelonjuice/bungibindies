import gleam/javascript/array.{type Array}

/// An implementation of javascript's `Array` type, but unlike the gleam/javascript/array module, this one allows for the use of `Any` as a type parameter.
/// This also means Gleam should not be touching this type, let Bun handle that.
pub type ParamArray

/// Create a new `ParamArray` instance.
@external(javascript, "../../../bun_sqlite_ffi.ts", "ParamArray_mnew")
pub fn new() -> ParamArray

/// Add a value to the end of the array.
@external(javascript, "../../../bun_sqlite_ffi.ts", "ParamArray_mpush")
pub fn push(array: ParamArray, value: a) -> ParamArray

/// Create a param array from a List.
pub fn list_to_paramarray(li: List(a)) -> ParamArray {
  array.from_list(li)
  |> array_to_paramarray
}

@external(javascript, "../../../bun_sqlite_ffi.ts", "ParamArray_m_from_array")
fn array_to_paramarray(arra: Array(a)) -> ParamArray
