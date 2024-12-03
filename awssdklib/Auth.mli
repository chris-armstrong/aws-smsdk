type t = Auth_common.t

exception AuthError of string

type resolver = unit -> t

module Profile = Auth_from_profile
module Environment = Auth_from_environment
module Dummy = Auth_from_dummy
