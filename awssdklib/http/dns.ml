let resolve_address host port =
  let addresses =
    Eio_unix.run_in_systhread (fun () ->
        Unix.getaddrinfo host (Int.to_string port) [ Unix.AI_FAMILY Unix.PF_INET ])
    |> List.filter_map (fun (addr : Unix.addr_info) ->
           match addr.ai_addr with Unix.ADDR_INET (addr, port) -> Some (addr, port) | _ -> None)
  in
  match addresses with
  | addr :: _ ->
      let inet, port = addr in
      Logs.debug (fun m ->
          m "resolve_address: %s:%d -> %s:%d" host port (Unix.string_of_inet_addr inet) port);
      Some (`Tcp (Eio_unix.Net.Ipaddr.of_unix inet, port))
  | _ -> None
