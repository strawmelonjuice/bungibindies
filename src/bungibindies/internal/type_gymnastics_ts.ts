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

export function map_update(
	map: Map<unknown, unknown>,
	key: unknown,
	update: (arg0: unknown) => unknown,
): Map<unknown, unknown> {
	return map.set(key, update(map.get(key)));
}

function convertMapToObject(
	metricArguments: Map<string, unknown>,
): Record<string, unknown> {
	const newObject: Record<string, unknown> = {};
	for (const [key, value] of metricArguments) {
		newObject[key] = value;
	}
	return newObject;
}
