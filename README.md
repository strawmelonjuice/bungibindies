# bungibindies

(incomplete) Gleam bindings to the Bun runtime API's.

[![Package Version](https://img.shields.io/hexpm/v/bungibindies)](https://hex.pm/packages/bungibindies)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/bungibindies/)

> WARNING - INCOMPLETE:
>
> Please note, not everything is implemented as of yet.
> See the [progress](./PROGRESS) section for more information.

```sh
gleam add bungibindies@1
```

This is a little example I borrowed from the tests:

```gleam
pub fn file_write_test() {
  let data = "Hello world! This file is for testing writing :)"
  let file = bun.file("./test/testfiles/writing.txt")
  use _ <- promise.await({ file |> bun.write(data) })
  // If `file_read_test()` fails, this will fail too
  use read_data <- promise.await({ file |> bunfile.text() })
  read_data
  |> string.trim()
  |> should.equal(data)
  |> promise.resolve()
}}
```

I will be adding more examples to an example folder as I go along.

Further documentation can be found at <https://hexdocs.pm/bungibindies>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

### Dependencies

I try to not use anything else than Bun itself,
but I do use `gleam/javascript` to use non-bun-specific JavaScript stuff.
