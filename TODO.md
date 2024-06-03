# TODO

## HTTP

* [x] Make Http module a functor that returns a new HTTP module with its own connection pool on the same switch
* [x] Return connection to connection pool only once the body is drained / read
* [ ] Run multiple requests in parallel for HTTP/2 connections but not HTTP/1.1 connections
* [ ] Rewrite connection pool to use Eio.Pool

## Documentation
* [ ] Incorporate documentation nodes into code
* [ ] Produce usage guide for each module
* [ ] Convert HTML based docs to odoc
* [ ] Diagrams

## DX
* [x] Builder functions for major types
* [x] Address type aliasing which overproduces intermediary types

