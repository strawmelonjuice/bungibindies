import type { BunFile } from "bun";

export function Cfile(path: string) {
  return Bun.file(path);
}

export function Cwrite(
  destination: BunFile,
  data: string | Blob | ArrayBufferLike | Bun.BlobPart[],
) {
  return Bun.write(destination, data);
}

export function Mtext(data: BunFile): Promise<string> {
  return data.text();
}

export async function Mjson(data: BunFile): Promise<Object> {
  return data.json();
}

export function Cstdout(): BunFile {
  return Bun.stdout;
}

export function Cstderr(): BunFile {
  return Bun.stderr;
}

export function Cstdin(): BunFile {
  return Bun.stdin;
}
