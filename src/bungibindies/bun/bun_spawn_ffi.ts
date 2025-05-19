import type { Subprocess, SyncSubprocess } from "bun";
import { convertMapToObject, error, ok } from "../internal/type_gymnastics_ts";

// ==================================================================================
// Helpers
// ==================================================================================

interface BindingSpawnOptions {
	cmd: string[];
	cwd?: string;
	env: Map<string, string>;
	stdout: string;
	stderr: string;
}

export function interpret_options(options: BindingSpawnOptions) {
	const cmd = options.cmd;
	const cwd = options.cwd;
	const env = convertMapToObject(options.env) as Record<string, string>;
	return {
		cmd: cmd,
		cwd: cwd,
		env: env,
		stdout: options.stdout,
		stderr: options.stderr,
	};
}

// ==================================================================================
// Functions
// ==================================================================================

export function spawn_sync(
	options_given: BindingSpawnOptions,
): import("bun").SyncSubprocess<"pipe", "pipe"> {
	const { cmd, cwd, env, stdout, stderr } = interpret_options(options_given);
	return Bun.spawnSync({
		//@ts-expect-error: Overload not matching, but overload is matching in my book.
		cmd,
		cwd: cwd,
		env: env,
		stdout: stdout,
		stderr: stderr,
	});
}

export function spawn(
	options_given: BindingSpawnOptions,
): import("bun").Subprocess<"ignore", "pipe", "inherit"> {
	const { cmd, cwd, env, stdout, stderr } = interpret_options(options_given);
	return Bun.spawn({
		//@ts-expect-error: Overload not matching, but overload is matching in my book.
		cmd,
		cwd: cwd,
		env: env,
		stdout: stdout,
		stderr: stderr,
	});
}

// ==================================================================================
// Methods
// ==================================================================================

export function process_stdout(subprocess: Subprocess | SyncSubprocess) {
	const a = subprocess.stdout;
	if (a !== undefined) {
		return ok(a.toString());
	}
	return error(undefined);
}

export function process_stderr(subprocess: Subprocess | SyncSubprocess) {
	const a = subprocess.stderr;
	if (a !== undefined) {
		return ok(a.toString());
	}
	return error(undefined);
}

export function asyncsubprocess_exit_code(subprocess: Subprocess) {
	const a = subprocess.exitCode;
	if (a !== null) {
		return ok(a);
	}
	return error(undefined);
}

export function asyncsubprocess_pid(subprocess: Subprocess) {
	return subprocess.pid;
}

export function syncsubprocess_success(subprocess: SyncSubprocess) {
	return subprocess.success;
}

export function asyncsubprocess_exited(subprocess: Subprocess) {
	return subprocess.exited;
}
export function asyncsubprocess_unref(subprocess: Subprocess) {
	return subprocess.unref();
}

export function asyncsubprocess_reref(subprocess: Subprocess) {
	return subprocess.ref();
}
export function asyncsubprocess_kill(
	subprocess: Subprocess,
	killcode: number | undefined,
) {
	return subprocess.kill(killcode);
}
