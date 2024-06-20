type t = { access_key_id : string; secret_access_key : string; session_token : string option }

exception AuthError of string

type resolver = unit -> t

val fromEnvironment : unit -> t
val fromProfile : < fs : [> Eio.Fs.dir_ty ] Eio.Path.t ; .. > -> ?profile_name:string -> unit -> t
val fromDummy : unit -> t
