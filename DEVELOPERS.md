# Developers Guide

This is a guide for those working on this repository - see 
the README and reference documentation for how to use consume
its libraries and SDKs in your own code.

## Base Libraries

All the SDK bindings use the [eio](https://github.com/ocaml-multicore/eio) library for async, leveraging [httpaf](https://github.com/anmonteiro/httpaf)
and [h2](https://github.com/anmonteiro/ocaml-h2) by [@anmonteiro](https://github.com/anmonteiro/) for HTTP communication via the `awssdklib`.

Jane Street [Base](https://opensource.janestreet.com/base/) is used in some of the parsers and code generators, but
the `awssdklib` shared library used by SDKs has minimal dependencies on
external libraries.

## Repository layout

```
awssdksjsv3/         # git checkout of AWS SDK JS v3, containing Smithy definitions
awssdklib/           # shared SDK library
awssdklib/http       # shared SDK library HTTP implementation
bin/                 # SDK generator binaries
examples/            # usage examples
library/             # SDK generator libraries
sdks/                # service SDKs builders
```

## How it works

1. Smithy Definitions are leveraged from the AWS JS SDK. For each AWS
   service, they specify things like which protocol it uses, service endpoints,
   action names, etc.
2. Given the Smithy definition for a service, `/bin/AwsGenerator.exe` can
   generate:
      - type definitions (`types`)
      - serialisers (`serialisers`)
      - deserialisers (`deserialisers`)
      - operations (`operations`)
      - structure type construction helpers (`builders`)
      - module type definition (`module`)
3. The generated files are wrapped up as a OCaml Library, built with dune

### Generation Pipeline

![Generation pipeline for SDKs](pipeline.png)

### Smithy Definitions

```
service
  - operation 1
      - request type
      - response type
  - operation 2
      - request type
      - response type
  - type 1
  - type 2
  - type 3
```
Smithy Definitions are a JSON file with various types in them. The
*root* type is the `service` type, which specifies the protocol for the
service and its available operations.

Each operation specifies a name, a request type, response type and
possible exception types it may generate.

Also in the Smithy definition is the various simple (boolean, strings, integers, etc.)and complex
types (structures, maps, lists, unions) that are referenced by the operations,
including the request and response types (which are always structure types).

Much of the protocol specification occurs in **traits**, which are tags that
are attached to a type, service or operation definition. The available traits
depends on the underlying protocol used by the service.

## Service Protocols

AWS defines a handful service protocols which may be used to implement
client-server communications with one of their services over HTTP:

* AWS JSON 1.0
* AWS JSON 1.1
* AWS restXml
* AWS query
* AWS restJson 1
* AWS EC2 query

At this point in time, only support for AWS JSON 1.0 is implemented (which covers
about 32 services). Given the similarity to AWS JSON 1.1, this is easily extended
to 138 services (approximately 1/3 of those available).

Most services use AWS restJson (approximately 224), with a handful implemented with
the other protocols.

Some protocols are only rarely used, such as AWS restXml, but are needed by critical
services like S3  & CloudFront, and have complex traits used to provide behaviour for some of their APIs. Others like AWS Query are needed by important services like CloudFormation, IAM, Cloudwatch or SNS, but have XML responses which necessitates the inclusion of an XML parser.




