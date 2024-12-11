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
import bungibindies/bun
import bungibindies/bun/serve

pub fn main() {
  bun.serve(fn () {
  serve.fetch(req: Request) {
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

### Implementation

Boxes are checked when the implementation is _usable_, if it's not
complete but checked, should be in the `skipped` section along
with possibly the reason for skipping.

- [ ] HTTP API's
  - [ ] HTTP server
    - [ ] `Bun.serve()`, `serve.fetch()` and alike
    - [ ] WebSocket server
  - [ ] HTTP client
    - [ ] `Bun.fetch()
- [!] Workers
- [ ] Binary data
  - [ ] Types
- [ ] Streams
  - [ ] Stream types
- [ ] File I/O
  - [ ] Reading (`Bun.file()`)
    - [ ] `Bun.stdin`
    - [ ] `Bun.stdout`
    - [ ] `Bun.stderr`
  - [ ] Writing (`Bun.write()`)
- [!] import.meta
- [ ] SQLite
  - [ ] `New` returning a `Bun.Database` in the form of a set of functions and interfaces.
- [ ] Globals
- [ ] $ Shell -- if possible to implement
- [ ] Child processes
  - [ ] `Bun.spawn()`
  - [ ] `Bun.exec()`
  - [ ] `Bun.execSync()`
  - [ ] `Bun.spawnSync()`
- [ ] Transpiler
  - [ ] `New` returning a `Bun.Transpiler` in the form of a set of functions and interfaces.
- [ ] Hashing
  - [ ] `Bun.password_hash()` and `Bun.password_verify()`
  - [ ] `Bun.hash()`
- [!] Console
- [ ] FFI
- [ ] HTMLRewriter
- [ ] Testing
- [x] Utils
  - [x] `Bun.version`
  - [x] `Bun.revision`
  - [x] `Bun.env`
  - [x] `Bun.main`
  - [x] `Bun.sleep()`
  - [x] `Bun.sleepSync()`
  - [x] `Bun.which()`
  - [x] `Bun.randomUUIDv7()`
  - [x] `Bun.peek()`
  - [x] `Bun.openInEditor()`
  - [x] `Bun.deepEquals()`
  - [x] `Bun.escapeHTML()`
  - [x] `Bun.stringWidth()`
  - [x] `Bun.fileURLToPath()`
  - [x] `Bun.pathToFileURL()`
  - [!] `Bun.gzipSync`
  - [!] `Bun.gunzipSync`
  - [!] `Bun.deflateSync`
  - [!] `Bun.inflateSync`
  - [x] `Bun.inspect()`
  - [x] `Bun.nanoseconds()`
  - [!] `Bun.readableStreamTo*()`
  - [x] `Bun.resolveSync()`
  - [!] `serialize` & `deserialize` in `bun:jsc`
- [!] DNS

#### Skipped

Some implementations were skipped for now. Here is a little list of what I skipped.
If you want to help, feel free to implement them and make a PR,
or wait until I get to them :)

- Utilities -> `Bun.gzipSync`
- Utilities -> `Bun.gunzipSync`
- Utilities -> `Bun.deflateSync`
- Utilities -> `Bun.inflateSync`
- Utilities -> `Bun.readableStreamTo*()`
- Utilities -> `serialize` & `deserialize` in `bun:jsc`
- Console: Not sure how to implement this yet.
- DNS: Not stable enough yet.
- `import.meta`: Gleam modules are not accessible from Bun API's, maybe through source
  maps in the future.
- Workers: Not stable enough yet.
