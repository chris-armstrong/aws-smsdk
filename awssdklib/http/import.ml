let _ = Ssl.init ()

module StringHash = Hashtbl.Make (String)

module Option = struct
  include Option

  let value_exn ~exn opt = match opt with Some v -> v | None -> raise exn
end
