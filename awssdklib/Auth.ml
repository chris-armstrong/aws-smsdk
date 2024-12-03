module Log = (val Logs.src_log (Logs.Src.create "Smaws_Lib.Auth" ~doc:"AWS Auth") : Logs.LOG)
include Auth_common

module Environment = Auth_from_environment
(** Load authorization credentials from the environment *)

module Profile = Auth_from_profile

let rec resolverChain ~resolvers =
  match resolvers with
  | resolver :: remaining -> begin
      try resolver () with
      | AuthError e ->
          if List.length remaining > 0 then resolverChain ~resolvers:remaining
          else raise (AuthError e)
      | x -> raise x
    end
  | [] -> raise (AuthError "No authorization resolvers in chain")

module Dummy = Auth_from_dummy
