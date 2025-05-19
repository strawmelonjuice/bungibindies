import { Database, type SQLQueryBindings, type Statement } from "bun:sqlite";
import * as gleam from "./gleam.mjs";

export function Mexec(db: Database, query: string) {
	const res = db.exec(query);
	return {
		last_insert_row_id: res.lastInsertRowid,
		changes: res.changes,
	};
}

export function Cnew(to: string) {
	return new Database(to);
}

export function Mquery(db: Database, query: string): Statement<unknown> {
	return db.query(query);
}

export function Mprepare(db: Database, query: string): Statement<unknown> {
	return db.prepare(query);
}

export function Mrun(
	statement: Statement<unknown>,
	params: SQLQueryBindings[],
): { last_insert_row_id: number | bigint; changes: number } {
	const res = statement.run(...params);
	// return {
	//   last_insert_row_id: res.lastInsertRowid,
	//   changes: res.changes,
	// };
	return {
		last_insert_row_id: 0,
		changes: 0,
	};
}
export function ParamArray_mnew(): unknown[] {
	return [];
}

// | JavaScript type | SQLite type |
// | -------------- | ----------- |
// | `string` | `TEXT` |
// | `number` | `INTEGER` or `DECIMAL` |
// | `boolean` | `INTEGER` (1 or 0) |
// | `Uint8Array` | `BLOB` |
// | `Buffer` | `BLOB` |
// | `bigint` | `INTEGER` |
// | `null` | `NULL` |

export function ParamArray_mpush(
	arr: string[],
	val: string | number | boolean | Uint8Array | Buffer | bigint | null,
): string[] {
	let p: string;
	switch (typeof val) {
		case "string":
			p = val;
			break;
		case "number":
			p = val.toString();
			break;
		case "boolean":
			p = val ? "1" : "0";
			break;
		case "bigint":
			p = val.toString();
			break;
		case "undefined":
			p = "NULL";
			break;
		default:
			p = "NULL";
	}
	arr.push(p);
	return arr;
}
export function ParamArray_m_from_array(arr: unknown[]): unknown[] {
	return arr;
}
export function Mall(statement: Statement, params: unknown[]) {
	return statement.all(...params);
}
export function Mget(statement: Statement, params: unknown[]) {
	return statement.get(...params);
}
export function Mclose(db: Database) {
	db.close();
}
