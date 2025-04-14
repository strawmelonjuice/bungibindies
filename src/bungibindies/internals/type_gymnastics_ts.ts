export function bufferToArrayOfNumbers(buffer: Buffer): number[] {
  if (buffer.length > 0) {
    const data = new Array(buffer.length);
    for (let i = 0; i < buffer.length; i = i + 1) data[i] = buffer[i];
    return data;
  }
  return [];
}

export function map_new(): Map<unknown, unknown> {
  return new Map();
}

export function map_set(
  map: Map<unknown, unknown>,
  key: unknown,
  value: unknown,
): Map<unknown, unknown> {
  return map.set(key, value);
}
