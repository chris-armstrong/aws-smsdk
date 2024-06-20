## HTTP

* [x] Make Http module a functor that returns a new HTTP module with its own connection pool on the same switch
* [x] Return connection to connection pool only once the body is drained / read
* [ ] ~Run multiple requests in parallel for HTTP/2 connections but not HTTP/1.1 connections~
* [x] Rewrite connection pool to use Eio.Pool

## Documentation
* [ ] Incorporate Smithy documentation nodes into code for API documentation
* [ ] Produce usage guide for each module
* [ ] Convert HTML based docs to odoc
* [ ] Diagrams

## DX
* [x] Builder functions for major types
* [x] Address type aliasing which overproduces intermediary types
* [ ] GitHub build actions for CI/CD

## Unit Testing

* [x] Implement basic unit testing suite
* [ ] Unit test all protocols
* [ ] Library components unit tests (Auth resolvers, config resolvers, etc)

## AwsSdkLib support Library

### Auth

* [ ] SSO Login resolver
* [ ] IAM assume role resolver (using STS)
* [ ] EC2 Instance Metadata resolver
* [ ] Lambda function resolver

### Configuration

* [x] Read ~/.aws/config file
