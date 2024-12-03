type t = { access_key_id : string; secret_access_key : string; session_token : string option }
(** Authorization credentials

    Authorization credentials are loaded using an {i auth resolver} from the {!module Auth} module. *)

exception AuthError of string
(** An exception authorization with a {!resolver} *)

type resolver = unit -> t
(* An authorization resolver, created with a [from*] function *)
