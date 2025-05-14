import * as gleam from "./gleam.mjs";
import type { Server } from "bun";

// Server options
interface ServerOptions {
  development: { 0?: boolean };
  hostname: { 0?: string };
  port: { 0?: number };
  reuse_port: { 0?: boolean };
  static_served: { 0?: Map<string, Response> };
  handler: () => Promise<Response>;
  id: { 0?: string };
}

// Serve starter
export function Cserve(options: ServerOptions): gleam.Result<Server, string> {
  const o = Bun.serve({
    // Static routes
    static: ((input): Record<`/${string}`, Response> => {
      // Convert this map to a Record<string, Promise<Response>>
      const output = {};
      input.forEach((value: Response, key: string) => {
        if (!key.startsWith("/")) {
          return new gleam.Error("Static route must start with a /");
        }
        //@ts-expect-error
        output[key] = value;
      });
      return output;
    })(options.static_served[0] || new Map()),
    // Handler
    fetch: options.handler,
    // Port
    port: options.port[0] || 8080,
    // hostname
    hostname: options.hostname[0],
    // Reuse port
    reusePort: options.reuse_port[0],
    // Development
    development: options.development[0],
    id: options.id[0],
  });
  return new gleam.Ok(o);
}

// `Response` methods

export function M_res_new() {
  return new Response([], {
    status: 200,
    statusText: "OK",
    headers: new Headers(),
  });
}

// biome-ignore lint/suspicious/noExplicitAny: Even calling it `a` in Gleam :)
export function M_res_set_body(res: Response, body: any) {
  return new Response(body, {
    status: res.status,
    statusText: res.statusText,
    headers: res.headers,
  });
}
export function M_res_set_status(res: Response, status: number) {
  return new Response(res.body, {
    status: status,
    statusText: res.statusText,
    headers: res.headers,
  });
}
export function M_res_set_statusText(res: Response, statusText: string) {
  return new Response(res.body, {
    status: res.status,
    statusText: statusText,
    headers: res.headers,
  });
}
export function M_res_set_headers(res: Response, headers: [string, string][]) {
  return new Response(res.body, {
    status: res.status,
    statusText: res.statusText,
    headers: headers,
  });
}
export function M_res_url(res: Response) {
  return res.url;
}
export function M_res_clone(res: Response) {
  return res.clone();
}
export function M_res_headers(res: Response) {
  return res.headers;
}
export function M_res_redirected(res: Response) {
  return res.redirected;
}
export function M_res_status(res: Response) {
  return res.status;
}
export function M_res_statusText(res: Response) {
  return res.statusText;
}
export function M_res_ok(res: Response) {
  return res.ok;
}
export function M_res_type(res: Response) {
  return res.type;
}

// `Request` methods
export function M_req_new(url: string) {
  return new Request(url, {
    method: "GET",
    headers: [],
    body: "",
  });
}
export function M_req_set_url(req: Request, url: string) {
  return new Request(url, {
    method: req.method,
    headers: req.headers,
    body: req.body,
  });
}
// biome-ignore lint/suspicious/noExplicitAny: Even calling it `a` in Gleam :)
export function M_req_set_body(req: Request, body: any) {
  return new Request(req.url, {
    method: req.method,
    headers: req.headers,
    body: body,
  });
}
export function M_req_set_method(req: Request, method: string) {
  return new Request(req.url, {
    method: method,
    headers: req.headers,
    body: req.body,
  });
}
export function M_req_set_headers(req: Request, headers: [string, string][]) {
  return new Request(req.url, {
    method: req.method,
    headers: headers,
    body: req.body,
  });
}
export function M_req_url(req: Request) {
  return req.url;
}
export function M_req_headers(req: Request) {
  return req.headers as unknown as Array<[string, string]>;
}
export function M_req_integrity(req: Request) {
  return req.integrity;
}
export function M_req_method(req: Request) {
  return req.method;
}
export function M_req_mode(req: Request) {
  return req.mode;
}

export function M_req_keepalive(req: Request) {
  return req.keepalive;
}
