let resolve_address ~host env =
  let addresses = Eio.Net.getaddrinfo_stream env host in
  List.hd_opt addresses
