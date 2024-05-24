## HTTP

[x] Make Http module a functor that returns a new HTTP module with its own connection pool on the same switch
[x] Return connection to connection pool only once the body is drained / read
[ ] Run multiple requests in parallel for HTTP/2 connections but not HTTP/1.1 connections
[ ] HTTP 301 redirect handling
[ ] Rewrite connection pool to use Eio.Pool
[x] Builder functions for major types
[ ] Incorporate documentation nodes into code
