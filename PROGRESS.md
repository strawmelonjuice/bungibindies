# Implementation

Boxes are checked when the implementation is _usable_, if it's not
complete but checked, should be in the `skipped` section along
with possibly the reason for skipping.

- [ ] HTTP API's

  - [x] HTTP server
    - [x] `Bun.serve()`, `serve.fetch()` and alike
      - [ ] `Server` type methods
    - [ ] WebSocket server
      - [ ] WebSocket event handlers (`message`, `open`, `close`, `drain`)
      - [ ] Pub/Sub functionality (`subscribe`, `publish`, `unsubscribe`)
      - [ ] Compression support (`perMessageDeflate`)
      - [ ] WebSocket client (`new WebSocket()`)
  - [ ] HTTP client
    - [ ] `Bun.fetch()`

- [ ] Bundler

  - [ ] `Bun.build()` (new bundler API)

- [ ] Workers
  - [ ] Worker constructors
  - [ ] Worker posting & receiving messages
  - [ ] Worker termination

- [ ] Binary data

  - [ ] Types
    - [ ] `ArrayBuffer` support
    - [ ] `TypedArray` variants (`Uint8Array`, etc.)
    - [ ] `DataView` support
    - [ ] `Buffer` compatibility
    - [ ] `Blob` support
    - [ ] `BunFile` type (extending `Blob`) with specific methods
    - [ ] `File` type (extending `Blob`)

- [ ] Streams

  - [ ] Stream types
    - [ ] `ReadableStream` support
    - [ ] `WritableStream` support
    - [ ] Direct `ReadableStream` (optimized version)
    - [ ] Async generator streams support
  - [ ] Stream API's
    - [ ] `Bun.ArrayBufferSink` for fast incremental buffer writing
    - [ ] Stream conversion utilities (`Bun.readableStreamTo*` methods)

- [x] File I/O

  - [x] `Bunfile` type
  - [x] Reading (`Bun.file()` ...)
    - [x] `Bun.file()`, `Bun.text()`, `Bun.json()` ...
    - [x] `Bun.stdin`
    - [x] `Bun.stdout`
    - [x] `Bun.stderr`
  - [x] Writing (`Bun.write()`)

- [ ] import.meta
  - [ ] `import.meta.dir`
  - [ ] `import.meta.path`
  - [ ] `import.meta.url`
  - [ ] `import.meta.main`
  - [ ] `import.meta.resolve`

- [ ] SQL & Databases
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
  - [ ] Redis client
    - [ ] Connection methods
    - [ ] Commands & operations
  - [ ] S3 Object Storage
    - [ ] `Bun:s3` client
    - [ ] Operations (get, put, list, etc.)

- [ ] FileSystemRouter
  - [ ] Next.js-style routing with `Bun.FileSystemRouter`
  - [ ] Route matching with URLs and paths

- [ ] Globals

- [ ] $ Shell -- if possible to implement

- [ ] Child processes

  - [ ] `Bun.spawn()`
  - [ ] `Bun.exec()`
  - [ ] `Bun.execSync()`
  - [ ] `Bun.spawnSync()`

- [ ] TCP & Network

  - [ ] `Bun.listen()` (TCP server)
  - [ ] `Bun.connect()` (TCP client)
  - [ ] UDP sockets

- [ ] Transpiler

  - [ ] `Bun.Transpiler` for code transformation

- [ ] Hashing

  - [ ] `Bun.password_hash()` and `Bun.password_verify()`
  - [ ] `Bun.hash()`
  - [ ] `Bun.CryptoHasher`

- [ ] HTMLRewriter
  - [ ] HTML transformation API
  - [ ] Element handlers

- [ ] Cookie
  - [ ] `Bun.CookieMap` for parsing and manipulating cookies

- [ ] FFI
  - [ ] Foreign Function Interface for calling native code
  - [ ] C Compiler integration

- [ ] Testing
  - [ ] Test runner utilities
  - [ ] Assertion helpers
  - [ ] Mock functionality

- [ ] Glob
  - [ ] `Bun.Glob` for file pattern matching

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
  - [ ] `Bun.gzipSync()`
  - [ ] `Bun.gunzipSync()`
  - [ ] `Bun.deflateSync()`
  - [ ] `Bun.inflateSync()`
  - [x] `Bun.inspect()`
  - [x] `Bun.nanoseconds()`
  - [ ] `Bun.readableStreamTo*()` methods for stream conversion
  - [x] `Bun.resolveSync()`
  - [ ] `serialize` & `deserialize` in `bun:jsc`

- [ ] DNS
  - [ ] DNS resolver utilities

- [ ] Semver
  - [ ] Semantic versioning utilities

- [ ] Color
  - [ ] Terminal color utilities

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
  Not sure how to implement this yet.
- [ ] DNS: Not stable enough yet.
- `import.meta`: Gleam modules are not accessible from Bun
  API's, maybe through source maps in the future.
- Workers: Not stable enough yet.
- Color: Not implementing because there are enough other packages that implement terminal colors.
- Globals: Not relevant to the scope of this library. (Mostly contains
  browser-related globals. Some Bun ones, but those ought to be
  implemented elsewhere.)
- SQLite
  - `Query.as()`: I don't think this would fit into the Gleam language.

#### Workarounds

No documented workarounds right now.
