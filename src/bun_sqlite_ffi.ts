import { Database, type Statement } from "bun:sqlite";

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
  params: unknown[],
): { last_insert_row_id: number | bigint; changes: number } {
  const res = statement.run(...params);
  return {
    last_insert_row_id: res.lastInsertRowid,
    changes: res.changes,
  };
}
export function ParamArray_mnew(): unknown[] {
  return [];
}
export function ParamArray_mpush(arr: unknown[], val: unknown): unknown[] {
  arr.push(val);
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
