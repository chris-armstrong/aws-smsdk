type t = { status : int; headers : (string * string) list }

let status response = response.status
let headers response = response.headers
