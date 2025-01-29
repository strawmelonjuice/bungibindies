# Implementation

Boxes are checked when the implementation is _usable_, if it's not
complete but checked, should be in the `skipped` section along
with possibly the reason for skipping.

- [ ] HTTP API's

  - [x] HTTP server
    - [x] `Bun.serve()`, `serve.fetch()` and alike
      - [ ] `Server` type methods
    - [ ] WebSocket server
  - [ ] HTTP client
    - [ ] `Bun.fetch()`

- [ ] Bundler

  - [ ] `Bun.bundle()`

- Workers

- [ ] Binary data

  - [ ] Types

- [ ] Streams

  - [ ] Stream types
  - [ ] Stream API's

- [x] File I/O

  - [x] `Bunfile` type
  - [x] Reading (`Bun.file()` ...)
    - [x] `Bun.file()`, `Bun.text()`, `Bun.json()` ...
    - [x] `Bun.stdin`
    - [x] `Bun.stdout`
    - [x] `Bun.stderr`
  - [x] Writing (`Bun.write()`)

- import.meta

- [ ] SQLite

  - [x] `new()`
  - [x] `query()`
  - [x] `prepare()`
  - [x] `run()`
  - [x] `exec()`
  - [x] `get()`
  - [x] `all()`
  - [ ] `iterate()`
  - [ ] `values()`
  - [ ] `finalise()`
  - [x] `close()`

- Globals

- [ ] $ Shell -- if possible to implement

- [ ] Child processes

  - [ ] `Bun.spawn()`
  - [ ] `Bun.exec()`
  - [ ] `Bun.execSync()`
  - [ ] `Bun.spawnSync()`

- [ ] TCP

  - [ ] `Bun.listen()`
  - [ ] `Bun.connect()`

- [ ] Transpiler

  - [ ] `New` returning a `Bun.Transpiler` in the form of
        a set of functions and interfaces.

- [ ] Hashing

  - [ ] `Bun.password_hash()` and `Bun.password_verify()`
  - [ ] `Bun.hash()`

- Console

- [ ] FFI
- [ ] HTMLRewriter
- [ ] Testing
- [x] Utilities

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
  - `Bun.gzipSync`
  - `Bun.gunzipSync`
  - `Bun.deflateSync`
  - `Bun.inflateSync`
  - [x] `Bun.inspect()`
  - [x] `Bun.nanoseconds()`
  - `Bun.readableStreamTo*()`
  - [x] `Bun.resolveSync()`
  - `serialize` & `deserialize` in `bun:jsc`

- DNS

#### Skipped

Some implementations were skipped for now. Here is a little list of what I skipped.
If you want to help, feel free to implement them and make a PR,
or wait until I get to them :)

- Utilities -> `Bun.gzipSync`: Not sure how to implement this yet.
- Utilities -> `Bun.gunzipSync`: Not sure how to implement this yet.
- Utilities -> `Bun.deflateSync`: Not sure how to implement this yet.
- Utilities -> `Bun.inflateSync`: Not sure how to implement this yet.
- Utilities -> `Bun.readableStreamTo*()`: Not sure how to implement this.
- Utilities -> `serialize` & `deserialize` in `bun:jsc`:
  Not sure how to implement this.
- Console: Not sure how to implement this yet.
- DNS: Not stable enough yet.
- `import.meta`: Gleam modules are not accessible from Bun
  API's, maybe through source maps in the future.
- Workers: Not stable enough yet.
- Globals: Not relevant to the scope of this library. (Mostly contains
  browser-related globals. Some Bun ones, but those ought to be
  implemented elsewhere.)
- SQLite
  - `Query.as()`: I don't think this would fit into the Gleam language.

#### Workarounds

No documented workarounds right now.
