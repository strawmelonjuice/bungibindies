import type { BunFile } from "bun";
// import { bufferToArrayOfNumbers } from "./type_layers";

export function Cfile(path: string) {
  return Bun.file(path);
}

export function Cwrite(
  destination: BunFile,
  data:
    | string
    | Blob
    | ArrayBufferLike
    | NodeJS.TypedArray<ArrayBufferLike>
    | Bun.BlobPart[],
) {
  return Bun.write(destination, data);
}
export function Mtext(data: BunFile): Promise<string> {
  return data.text();
}

export async function Mjson(data: BunFile): Promise<Map<string, string>> {
  return new Map(Object.entries(await data.json()));
}
