# bungibindies

Gleam bindings to the Bun runtime API's.

[![Package Version](https://img.shields.io/hexpm/v/bun)](https://hex.pm/packages/bun)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/bun/)

> WARNING:
>
> Please note, only the utils part is finished so far. I published it so that I could try it out though.

```sh
gleam add bungibindies@1
```

```gleam
import bun

pub fn main() {
  bun.serve(fn () {
  fetch(req: Request) {
    Response("Success!")
  },
})
}
```

(This is a rough sketch cuz I'm just making code up rn)

Further documentation can be found at <https://hexdocs.pm/bungibindies>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

### Dependencies

I try to not use anything else than Bun itself,
but I do use `gleam/javascript` and `plinth` to use non-bun-specific JS stuff.
I aim to remove `plinth` at some point.

### Skipped

Some implementations were skipped for now. Here is a little list of what I skipped.
If you want to help, feel free to implement them and make a PR,
or wait until I get to them :)

- Utilities - `Bun.gzipSync`
- Utilities - `Bun.gunzipSync`
- Utilities - `Bun.deflateSync`
- Utilities - `Bun.inflateSync`
- Utilities - `Bun.readableStreamTo*()`
- Utilities - `serialize` & `deserialize` in `bun:jsc`
