import bungibindies/bun/http/serve/request.{type Request}
import bungibindies/bun/http/serve/response.{type Response}
import bungibindies/internal/type_gymnastics.{type InternalMap}
import gleam/dict.{type Dict}
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option, None, Some}

pub type ServeOptions {
  ServeOptions(
    development: Option(Bool),
    /// The hostname to listen on.
    hostname: Option(String),
    /// The port to listen on.
    port: Option(Int),
    /// Server static Response objects by route.
    static_served: Option(Dict(String, Response)),
    /// Handle dynamic requests.
    handler: fn(Request) -> Promise(Response),
    /// Uniquely identify a server instance with an ID
    id: Option(String),
    /// Whether to reuse the port or not.
    reuse_port: Option(Bool),
  )
}

@internal
pub fn serve_options_to_internal_serve_options(
  serve_options: ServeOptions,
) -> InternalServeOptions {
  let static_served = {
    case serve_options.static_served {
      Some(routes) -> Some(type_gymnastics.map_from_dict(routes))
      None -> None
    }
  }
  InternalServeOptions(
    development: serve_options.development,
    hostname: serve_options.hostname,
    port: serve_options.port,
    static_served:,
    handler: serve_options.handler,
    id: serve_options.id,
    reuse_port: serve_options.reuse_port,
  )
}

@internal
pub type InternalServeOptions {
  InternalServeOptions(
    development: Option(Bool),
    hostname: Option(String),
    port: Option(Int),
    static_served: Option(InternalMap(String, Response)),
    handler: fn(Request) -> Promise(Response),
    id: Option(String),
    reuse_port: Option(Bool),
  )
}

@external(javascript, "../../../bun_serve_ffi.ts", "Cserve")
@internal
pub fn serve(options: InternalServeOptions) -> Result(Server, String)

pub type Server
