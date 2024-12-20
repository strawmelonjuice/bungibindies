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

// query.get(); // => { message: "Hello world" }
