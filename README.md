# bun

[![Package Version](https://img.shields.io/hexpm/v/bun)](https://hex.pm/packages/bun)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/bun/)

```sh
gleam add bun@1
```

```gleam
import bun

pub fn main() {
  bun.serve(fn () {
  fetch(req: Request) {
    return new Response("Success!");
  },
});
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

I decided not to use the stdlib, and aim to not use anything else than Bun itself, but I do use `gleam/javascript` and `plinth` to use non-bun-specific JS stuff. I aim to remove `plinth` at some point.
