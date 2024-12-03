open Auth_common

(** Load authorization credentials from environment variables ([AWS_ACCESS_KEY_ID],
    [AWS_SECRET_ACCESS_KEY] and (optionally) [AWS_SESSION_TOKEN] *)
let resolve () =
  try
    let access_key_id = Sys.getenv "AWS_ACCESS_KEY_ID" in
    let secret_access_key = Sys.getenv "AWS_SECRET_ACCESS_KEY" in
    let session_token = Sys.getenv_opt "AWS_SESSION_TOKEN" in
    { access_key_id; secret_access_key; session_token }
  with Not_found ->
    raise
      (AuthError "Could not resolve AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY from environment")
