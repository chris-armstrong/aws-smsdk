open Auth_common

val resolve : < fs : [> Eio.Fs.dir_ty ] Eio.Path.t ; .. > -> ?profile_name:string -> unit -> t
