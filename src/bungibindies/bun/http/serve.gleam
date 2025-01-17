import bungibindies/bun/http/serve/request.{type Request}
import bungibindies/bun/http/serve/response.{type Response}
import gleam/javascript/map.{type Map}
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}

pub type ServeOptions {
  ServeOptions(
    development: Option(Bool),
    /// The hostname to listen on.
    hostname: Option(String),
    /// The port to listen on.
    port: Option(Int),
    /// Server static Response objects by route.
    static_served: Option(Map(String, Response)),
    /// Handle dynamic requests.
    handler: fn(Request) -> Promise(Response),
    /// Uniquely identify a server instance with an ID
    id: Option(String),
    /// Whether to reuse the port or not.
    reuse_port: Option(Bool),
  )
}

@internal
pub fn serve(options: ServeOptions) -> Server {
  let houston = fn(r: Int) {
    case r {
      1 -> panic as "One or more static routes do not start with a slash!"
      _ -> panic as "Unknown server error!"
    }
  }
  i_serve(options, houston)
}

@external(javascript, "../../../bun_serve_ffi.ts", "Cserve")
fn i_serve(options: ServeOptions, houston: fn(Int) -> Nil) -> Server

pub type Server
