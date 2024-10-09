(lang dune 3.15)

(name aws-smsdk)

(generate_opam_files true)

(package
 (name aws-smsdk-gen)
 (allow_empty)
 (synopsis "Generate AWS API bindings")
 (description "Generate API bindings for AWS")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/aws-smsdk)
 (bug_reports https://github.com/chris-armstrong/aws-smsdk/issues)
 (source
  (github chris-armstrong/aws-smsdk))
 (license MIT)
 (depends
  (dune
   (>= "3.14"))
  (ocaml
   (>= "5.0"))
  (yojson
   (>= "2.0.0"))
  containers
  (fmt
   (>= "0.9.0"))
  base
  base64
  digestif
  ppx_deriving
  ocamlgraph
  uri
  logs
  (alcotest :with-test)
  (eio_main :with-dev)
  (odoc :with-doc)))

(package
 (name aws-smsdk-lib)
 (allow_empty)
 (synopsis "Support library for AWS SDKs generated from Smithy definitions")
 (description
  "Support library for AWS SDKs generated from Smithy definitions")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/aws-smsdk)
 (bug_reports https://github.com/chris-armstrong/aws-smsdk/issues)
 (source
  (github chris-armstrong/aws-smsdk))
 (license MIT)
 (depends
  (dune
   (>= "3.14"))
  (ocaml
   (>= "5.0"))
  (yojson
   (>= "2.0.0"))
  (fmt
   (>= "0.9.0"))
  xmlm
  base64
  digestif
  eio-ssl
  uri
  logs
  httpun
  httpun-eio
  eio_main
  (eio_main :with-dev)
  (odoc :with-doc)))

(package
 (name aws-smsdk-clients)
 (allow_empty)
 (synopsis "Amazon Web Services SDK clients using EIO")
 (description "This is a generated set of AWS SDK clients. It uses EIO for asynchronous requests.")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/aws-smsdk)
 (bug_reports https://github.com/chris-armstrong/aws-smsdk/issues)
 (source
  (github chris-armstrong/aws-smsdk))
 (license MIT)
 (depends
  (dune
   (>= "3.14"))
  (ocaml
   (>= "5.0"))
  aws-smsdk-lib
  (odoc :with-doc)))



