import gleam/javascript/array.{type Array}

/// The response to a request
pub type Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_new")
pub fn new() -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_set_body")
pub fn set_body(res: Response, body: a) -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_set_statusText")
pub fn set_status_text(res: Response, status_text: String) -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_set_status")
pub fn set_status(res: Response, status: Int) -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_set_headers")
pub fn set_headers(res: Response, headers: Array(#(String, String))) -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_url")
pub fn url(res: Response) -> String

@external(javascript, ".././bun_serve_ffi.ts", "M_res_clone")
pub fn clone(res: Response) -> Response

@external(javascript, ".././bun_serve_ffi.ts", "M_res_headers")
pub fn headers(res: Response) -> Array(#(String, String))

@external(javascript, ".././bun_serve_ffi.ts", "M_res_redirected")
pub fn redirected(res: Response) -> Bool

@external(javascript, ".././bun_serve_ffi.ts", "M_res_status")
pub fn status(res: Response) -> Int

@external(javascript, ".././bun_serve_ffi.ts", "M_res_statusText")
pub fn status_text(res: Response) -> String

@external(javascript, ".././bun_serve_ffi.ts", "M_res_ok")
pub fn ok(res: Response) -> Bool

/// "basic" | "cors" | "default" | "error" | "opaque" | "opaqueredirect"
@external(javascript, "../bun_serve_ffi.ts", "M_res_type")
pub fn type_(res: Response) -> String
