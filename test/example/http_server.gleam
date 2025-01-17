import bungibindies/bun
import bungibindies/bun/http/serve.{ServeOptions}
import bungibindies/bun/http/serve/request
import bungibindies/bun/http/serve/response
import gleam/io
import gleam/javascript/array
import gleam/javascript/promise
import gleam/option.{None, Some}
import gleam/string

pub fn main() {
  let _s =
    bun.serve(
      ServeOptions(
        development: Some(False),
        hostname: None,
        port: Some(3000),
        reuse_port: None,
        static_served: None,
        id: None,
        handler: fn(req) {
          let url = req |> request.url()
          io.println("Request to " <> url <> " received!")
          case url |> string.ends_with("/bye") {
            True -> {
              io.println("Bungibindies: but I don't want to say bye...")
              promise.resolve(
                response.new()
                |> response.set_body("Now look at the server console!")
                |> response.set_headers(
                  [#("Content-Type", "text/html; charset=utf-8")]
                  |> array.from_list(),
                ),
              )
            }
            False -> {
              promise.resolve(
                response.new()
                |> response.set_body(
                  "<html>Hi there! Serving this from Bungibindies! <a href='/bye'>Click here if you think you've seen it all.</a></html>",
                )
                |> response.set_headers(
                  [#("Content-Type", "text/html; charset=utf-8")]
                  |> array.from_list(),
                ),
              )
            }
          }
        },
      ),
    )
  io.println("Server started! Now visit http://localhost:3000/")
}
