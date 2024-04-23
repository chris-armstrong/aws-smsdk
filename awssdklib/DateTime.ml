let amzDate now =
  let Unix.{ tm_year; tm_mon; tm_mday; _ } = Unix.gmtime now in
  Printf.sprintf "%04d%02d%02d" (tm_year + 1900) (tm_mon + 1) tm_mday

let amzDateTime now =
  let Unix.{ tm_year; tm_mon; tm_mday; tm_hour; tm_min; tm_sec; _ } = Unix.gmtime now in
  Printf.sprintf "%04d%02d%02dT%02d%02d%02dZ" (tm_year + 1900) (tm_mon + 1) tm_mday tm_hour tm_min
    tm_sec
