import gleam/javascript/array.{type Array}

/// A request to the server
pub type Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_new")
pub fn new() -> Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_set_url")
pub fn set_url(req: Request, url: String) -> Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_set_body")
pub fn set_body(req: Request, body: a) -> Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_set_method")
pub fn set_method(req: Request, method: String) -> Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_set_headers")
pub fn set_headers(req: Request, headers: Array(#(String, String))) -> Request

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_url")
pub fn url(req: Request) -> String

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_headers")
pub fn headers(req: Request) -> Array(#(String, String))

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_integrity")
pub fn integrity(req: Request) -> String

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_method")
pub fn method(req: Request) -> String

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_mode")
pub fn mode(req: Request) -> String

@external(javascript, "../../../../bun_serve_ffi.ts", "M_req_keepalive")
pub fn keepalive(req: Request) -> Bool
