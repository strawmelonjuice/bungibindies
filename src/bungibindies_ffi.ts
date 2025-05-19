export function main() {
	console.log(`Hello from '${process.argv[0]}'!`);
	console.error("Please use this package as a library, not as a CLI program.");
}
export function Cruns_in_bun() {
	if (process.versions.bun) {
		return true;
	}
	return false;
}
