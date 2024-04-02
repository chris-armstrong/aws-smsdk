(lang dune 3.14)
(name aws-smsdk)

(generate_opam_files true)
(package
 (name aws-smsdk)
 (allow_empty)
 (synopsis "Generate AWS API bindings")
 (description
  "Generate API bindings for AWS")
 (authors "Chris Armstrong")
 (maintainers "Chris Armstrong <oss@chrisarmstrong.dev>")
 (homepage https://github.com/chris-armstrong/aws-reason)
 (bug_reports https://github.com/chris-armstrong/aws-reason/issues)
 (source
  (github chris-armstrong/aws-reason))
 (license MIT)
 (depends
  (dune
   (>= "3.14"))
  (ocaml
   (>= "4.14"))
  (yojson
   (>= "2.0.0"))
  containers
  (fmt
   (>= "0.9.0"))
  xmlm
  base64
  cohttp-lwt-unix
  digestif
  ppx_inline_test
  ppx_deriving
  ppx_expect
  blink
  (odoc :with-doc)))

