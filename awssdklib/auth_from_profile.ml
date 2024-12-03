open Auth_common

let load_ini_file_res file_path =
  try Ok (Ini.load_ini file_path)
  with Eio.Exn.Io _ as ex ->
    Error (AuthError (Fmt.str "Unable to load ~/.aws/credentials: %a" Eio.Exn.pp ex))

let load_credentials_profiles env =
  let home_dir = Sys.getenv "HOME" in
  load_ini_file_res Eio.Path.(Eio.Stdenv.fs env / home_dir / ".aws" / "credentials")

let load_config_profiles env =
  let home_dir = Sys.getenv "HOME" in
  load_ini_file_res Eio.Path.(Eio.Stdenv.fs env / home_dir / ".aws" / "config")
  |> Result.map (fun kvps ->
         List.filter_map
           (fun (section_name, values) ->
             match section_name with
             | "default" -> Some (section_name, values)
             | s when String.starts_with ~prefix:"profile " s ->
                 Some (String.sub s 8 (String.length s - 8) |> String.trim, values)
             | _ -> None)
           kvps)

type profile = {
  aws_access_key_id : string;
  aws_secret_access_key : string;
  aws_session_token : string option;
}

let read_profile profile_name profiles =
  let profile_section = List.assoc_opt profile_name profiles in

  match profile_section with
  | Some profile_values -> (
      match
        ( profile_values |> List.assoc_opt "aws_access_key_id",
          profile_values |> List.assoc_opt "aws_secret_access_key",
          profile_values |> List.assoc_opt "aws_session_token" )
      with
      | Some aws_access_key, Some aws_secret_key, aws_session_token ->
          {
            aws_access_key_id = aws_access_key;
            aws_secret_access_key = aws_secret_key;
            aws_session_token;
            (* role_arn = None; *)
            (* output = None; *)
          }
      | _ ->
          raise
            (AuthError
               (Fmt.str "Profile '%s' missing aws_access_key_id or aws_secret_access_key"
                  profile_name)))
  | None ->
      raise (AuthError (Fmt.str "Unable to find profile '%s' in credentials file" profile_name))

let resolve env ?profile_name () =
  try
    let profile_name =
      match profile_name with
      | Some profile_name -> profile_name
      | None -> (
          match Sys.getenv_opt "AWS_PROFILE" with
          | Some profile_name -> profile_name
          | None -> "default")
    in
    Logs.debug (fun s -> s "fromProfile: using profile %s" profile_name);
    let credentials_file = load_credentials_profiles env in
    let config_file = load_config_profiles env in

    let profiles =
      match (config_file, credentials_file) with
      | Ok config_file, Ok credentials_file -> List.concat [ config_file; credentials_file ]
      | Ok config_file, Error _ -> config_file
      | _, Ok credentials_file -> credentials_file
      | Error e, _ -> raise e
    in

    Logs.debug (fun s ->
        let profile_names = List.map (fun (x, _) -> x) profiles in
        s "fromProfile: Loaded profiles %a" (Fmt.list ~sep:Fmt.comma Fmt.string) profile_names);

    let { aws_access_key_id; aws_secret_access_key; aws_session_token; _ } =
      read_profile profile_name profiles
    in
    {
      access_key_id = aws_access_key_id;
      secret_access_key = aws_secret_access_key;
      session_token = aws_session_token;
    }
  with Not_found ->
    raise (AuthError "Unable to find $HOME in environment for loading AWS profile")
