let create_ssl_context () =
  let ctx = Ssl.create_context Ssl.TLSv1_2 Ssl.Client_context in
  Ssl.honor_cipher_order ctx;
  Ssl.set_context_alpn_protos ctx [ "http/1.1" ];
  Ssl.set_min_protocol_version ctx Ssl.TLSv1_2;
  Ssl.set_max_protocol_version ctx Ssl.TLSv1_3;
  let _ = Ssl.set_default_verify_paths ctx in
  Ssl.set_verify ctx [ Ssl.Verify_peer ] (Some Ssl.client_verify_callback);
  Ssl.set_verify_depth ctx 5;
  Ssl.set_client_verify_callback_verbose false;
  ctx
