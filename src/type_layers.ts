export function bufferToArrayOfNumbers(buffer: Buffer): number[] {
	if (buffer.length > 0) {
		const data = new Array(buffer.length);
		for (let i = 0; i < buffer.length; i = i + 1) data[i] = buffer[i];
		return data;
	}
	return [];
}
