import type { EditorOptions } from "bun";
import { bufferToArrayOfNumbers } from "./bungibindies/internals/type_gymnastics_ts";
import * as gleam from "./gleam.mjs";

export function Cversion(): string {
  return Bun.version;
}

export function Crevision(): string {
  return Bun.revision;
}

export function Cenv(key: string) {
  const p = Bun.env[key];
  return p ? new gleam.Ok(p) : new gleam.Error(null);
}

export function Cmain(): string {
  return Bun.main;
}

export function Csleep(ms: number): void {
  Bun.sleep(ms);
}

export function CsleepSync(ms: number): void {
  Bun.sleepSync(ms);
}

export function Cwhich(cmd: string) {
  const p = Bun.which(cmd);
  return p ? new gleam.Ok(p) : new gleam.Error(null);
}

export function CwhichWithOptions(
  cmd: string,
  path: { 0?: string },
  cwd: { 0?: string },
): gleam.Ok<string, unknown> | gleam.Error<unknown, null> {
  const p = Bun.which(cmd, {
    PATH: path[0],
    cwd: cwd[0],
  });
  return p ? new gleam.Ok(p) : new gleam.Error(null);
}

export function CrandomUUIDv7(): string {
  return Bun.randomUUIDv7();
}
export function CrandomUUIDv7_buffer(): number[] {
  return bufferToArrayOfNumbers(Bun.randomUUIDv7("buffer"));
}

export function Cpeek(promise: Promise<unknown>): unknown {
  return Bun.peek(promise);
}

export function CopenInEditor(file: string): void {
  Bun.openInEditor(file);
}

export function CopenInEditorWithOptions(
  file: string,
  options: EditorOptions,
): void {
  Bun.openInEditor(file, options);
}

export function CdeepEquals(a: unknown, b: unknown): boolean {
  return Bun.deepEquals(a, b);
}

export function CdeepEqualsStrict(a: unknown, b: unknown): boolean {
  return Bun.deepEquals(a, b, true);
}

export function CescapeHTML(s: string | number | boolean | object): string {
  return Bun.escapeHTML(s);
}

export function CstringWidth(
  s: string,
  countAnsiEscapeCodes: boolean,
  ambiguousIsNarrow: boolean,
): number {
  return Bun.stringWidth(s, {
    countAnsiEscapeCodes,
    ambiguousIsNarrow,
  });
}

export function CfileURLToPath(url: string): string {
  return Bun.fileURLToPath(url);
}

export function CpathToFileURL(path: string): string {
  return Bun.pathToFileURL(path).toString();
}

export function Cinspect(a: unknown): string {
  return Bun.inspect(a);
}

export function Cnanoseconds(): number {
  return Bun.nanoseconds();
}

export function CresolveSync(module: string, parent: string): string {
  return Bun.resolveSync(module, parent);
}
