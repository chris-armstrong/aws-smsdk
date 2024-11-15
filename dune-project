(lang dune 3.15)

(name smaws)

(generate_opam_files true)

(package
 (name smaws-gen)
 (allow_empty)
 (synopsis "Generate AWS API bindings")
 (description "Generate API bindings for AWS")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/smaws)
 (bug_reports https://github.com/chris-armstrong/smaws/issues)
 (source
  (github chris-armstrong/smaws))
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
  (base64 (>= "3.4.0"))
  (digestif (>= "1.1.4"))
  (ppx_deriving (>= "5.0"))
  ocamlgraph
  (uri (>= "4.2.0"))
  (logs (>= "0.7.0"))
  (ppx_compare :with-test)
  (alcotest :with-test)
  (eio_main :with-dev-setup)
  (odoc :with-doc)))

(package
 (name smaws-lib)
 (allow_empty)
 (synopsis "Support library for AWS SDKs generated from Smithy definitions")
 (description
  "Support library for AWS SDKs generated from Smithy definitions")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/smaws)
 (bug_reports https://github.com/chris-armstrong/smaws/issues)
 (source
  (github chris-armstrong/smaws))
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
  (xmlm (>= "1.4.0"))
  (base64 (>= "3.4.0"))
  (digestif (>= "1.1.4"))
  (eio-ssl (>= "0.3.0"))
  (uri (>= "4.2.0"))
  (logs (>= "0.7.0"))
  (httpun (>= "0.2.0"))
  (httpun-eio (>= "0.2.0"))
  (ppx_deriving (>= "5.0"))
  (alcotest :with-test)
  (eio_main :with-dev-setup)
  (odoc :with-doc)))

(package
 (name smaws-clients)
 (allow_empty)
 (synopsis "Amazon Web Services SDK clients using EIO")
 (description "This is a generated set of AWS SDK clients. It uses EIO for asynchronous requests.")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/smaws)
 (bug_reports https://github.com/chris-armstrong/smaws/issues)
 (source
  (github chris-armstrong/smaws))
 (license MIT)
 (depends
  (dune
   (>= "3.14"))
  (ocaml
   (>= "5.0"))
  smaws-lib
  (alcotest :with-test)
  (odoc :with-doc)))



