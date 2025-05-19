//// PARTIAL IMPLEMENTATION OF `Bun.spawn()` AND `Bun.spawnSync()`

// ==================================================================================
// Imports
// ==================================================================================
import bungibindies/internal/type_gymnastics.{
  type InternalMap, type SomethingOrUndefined,
}
import gleam/dict.{type Dict}
import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option, None, Some}

// ==================================================================================
// Types
// ==================================================================================

pub type AsyncSubprocessObject

pub type SyncSubprocessObject

pub type SubProcess {
  AsyncSubprocess(AsyncSubprocessObject)
  SyncSubprocess(SyncSubprocessObject)
}

pub type Out {
  Pipe
  Inherit
  Ignore
}

pub type OptionsToSubprocess {
  OptionsToSubprocess(
    /// The command and arguments to run.
    cmd: List(String),
    /// The working directory to run the command in. Defaults to the current working directory.
    cwd: Option(String),
    /// Environment variables to set for the command.
    env: Option(Dict(String, String)),
    /// Where to send the error output of the command.
    ///  If not specified, defaults to `Pipe` for async and `Inherit` for sync.
    ///
    /// If `Pipe`, the output will be available in the `stderr` property of the result.
    /// If `Inherit`, the output will be sent to the same place as the parent process.
    /// If `Ignore`, the output will be send nowhere and will instead be ignored.
    stderr: Option(Out),
    /// Where to send the output of the command.
    ///  If not specified, defaults to `Pipe` for async and `Inherit` for sync.
    ///
    /// If `Pipe`, the output will be available in the `stdout` property of the result.
    /// If `Inherit`, the output will be sent to the same place as the parent process.
    /// If `Ignore`, the output will be send nowhere and will instead be ignored.
    stdout: Option(Out),
  )
}

// ==================================================================================
// Internal types
// ==================================================================================

type InternalOptionsToSubprocess {
  InternalOptionsToSubprocess(
    cmd: Array(String),
    cwd: SomethingOrUndefined,
    env: InternalMap(String, String),
    stderr: String,
    stdout: String,
  )
}

// ==================================================================================
// Helpers
// ==================================================================================

fn options_processor(
  from options: OptionsToSubprocess,
  async async: Bool,
) -> InternalOptionsToSubprocess {
  let cmd =
    options.cmd
    |> array.from_list()
  let cwd =
    options.cwd
    |> type_gymnastics.option_to_something
  let env = {
    case options.env {
      Some(env) -> type_gymnastics.map_from_dict(env)
      None -> type_gymnastics.map_new()
    }
  }
  let stderr = {
    case options.stderr, async {
      // default to inherit if sync
      None, False -> "inherit"
      // default to pipe if async
      None, True -> "pipe"
      // If the user specified a value, use it
      Some(Pipe), _ -> "pipe"
      Some(Inherit), _ -> "inherit"
      Some(Ignore), _ -> "ignore"
    }
  }
  let stdout = {
    case options.stdout {
      // default to pipe 
      None -> "pipe"
      // If the user specified a value, use it
      Some(Pipe) -> "pipe"
      Some(Inherit) -> "inherit"
      Some(Ignore) -> "ignore"
    }
  }

  InternalOptionsToSubprocess(cmd:, cwd:, env:, stderr:, stdout:)
}

// ==================================================================================
// FFI handlers for functions
// ==================================================================================

/// sync spawn
@external(javascript, "./bun_spawn_ffi", "spawn_sync")
fn spync(one: InternalOptionsToSubprocess) -> SyncSubprocessObject

/// async spawn
@external(javascript, "./bun_spawn_ffi", "spawn")
fn aspync(one: InternalOptionsToSubprocess) -> AsyncSubprocessObject

@external(javascript, "./bun_spawn_ffi", "process_stdout")
fn process_stdout_sync(from: SyncSubprocessObject) -> Result(String, Nil)

@external(javascript, "./bun_spawn_ffi", "process_stdout")
fn process_stdout_async(from: AsyncSubprocessObject) -> Result(String, Nil)

@external(javascript, "./bun_spawn_ffi", "process_stderr")
fn process_stderr_sync(from: SyncSubprocessObject) -> Result(String, Nil)

@external(javascript, "./bun_spawn_ffi", "process_stderr")
fn process_stderr_async(from: AsyncSubprocessObject) -> Result(String, Nil)

@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_kill")
fn process_kill_async(
  from: AsyncSubprocessObject,
  with: SomethingOrUndefined,
) -> Nil

// ==================================================================================
// Functions
// ==================================================================================

/// This function is used to spawn a new process synchronously.
/// It returns a `SyncSubprocess` object that can be used to interact with the spawned process.
pub fn sync(with options: OptionsToSubprocess) -> SubProcess {
  SyncSubprocess(spync(options_processor(from: options, async: False)))
}

/// This function is used to spawn a new process asynchronously.
/// It returns an `AsyncSubprocess` object that can be used AsyncSubprocessDatah the spawned process.
pub fn async(with options: OptionsToSubprocess) -> SubProcess {
  AsyncSubprocess(aspync(options_processor(from: options, async: True)))
}

// ==================================================================================
// Methods
// ==================================================================================

/// Attempts to fetch stdout from the subprocess.
pub fn stdout(from subprocess: SubProcess) -> Result(String, Nil) {
  case subprocess {
    SyncSubprocess(a) -> process_stdout_sync(a)
    AsyncSubprocess(b) -> process_stdout_async(b)
  }
}

/// Attempts to fetch stderr from the subprocess.
pub fn stderr(from subprocess: SubProcess) -> Result(String, Nil) {
  case subprocess {
    SyncSubprocess(a) -> process_stderr_sync(a)
    AsyncSubprocess(b) -> process_stderr_async(b)
  }
}

/// Synchronously get the exit code of the subprocess
/// If the process hasn't exited yet, this will return `Error(Nil)`
@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_exit_code")
pub fn exit_code(from subprocess: AsyncSubprocessObject) -> Result(Int, Nil)

/// Asynchronously get the exit code of the subprocess
/// The promise will resolve when the process exits.
@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_exited")
pub fn exited(from subprocess: AsyncSubprocessObject) -> Promise(Int)

/// Get the PID of the subprocess.
@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_pid")
pub fn pid(from subprocess: AsyncSubprocessObject) -> Int

/// Get the success status from the subprocess.
@external(javascript, "./bun_spawn_ffi", "syncsubprocess_success")
pub fn success(from subprocess: SyncSubprocessObject) -> Bool

/// Before shutting down, Bun will wait for all subprocesses to exit by default
/// This method will tell Bun to not wait for this process to exit before shutting down.
@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_unref")
pub fn unref(from subprocess: AsyncSubprocessObject) -> Nil

/// This method will tell Bun to wait for this process to exit after you already called `unref()`.
/// Before shutting down, Bun will wait for all subprocesses to exit by default
@external(javascript, "./bun_spawn_ffi", "asyncsubprocess_reref")
pub fn reref(from subprocess: AsyncSubprocessObject) -> Nil

/// Kills a subprocess
pub fn kill(
  from subprocess: AsyncSubprocessObject,
  code killcode: Option(Int),
) -> Nil {
  let code = killcode |> type_gymnastics.option_to_something()
  process_kill_async(subprocess, code)
}
