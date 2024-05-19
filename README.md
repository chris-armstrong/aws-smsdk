# AWS SMSDK

This is a project to generate OCaml bindings for the AWS SDK using
Smithy definitions.


## Status

This is a work in progress. Only some services are defined as SDKs,
and the protocol generators may only be able to work on some services
(and their implementations may incomplete or buggy).

At the moment, we can generate bindings for the AwsJson_1.0 protocol,
which covers a significant number of SDKs but has not been thoroughly
tested for completeness or compliance. (If you know of good compliance
suites for AWS service implementations, please reach out!)

## Installation

The code in this repository is not currently available through opam.

However, you can use it by pinning the opam repository:

`opam pin https://github.com/chris-armstrong/aws-smsdk.git`

You will also need to pin some of its dependencies too:

* [httpaf](https://opam.ocaml.org/packages/httpaf/): https://github.com/anmonteiro/httpaf.git
* h2: https://github.com/anmonteiro/ocaml-h2.git
* eio-ssl: https://github.com/anmonteiro/eio-ssl.git

## Usage

### Before you start 

* The SDKs provided by this package use eio for async communication.
If you're using lwt or async or riot or miou, you may need a bridge
library to plug into.
* Each service SDK is generated with the name `aws-smssdk-<service>`,
where `<service>` is the lowercase shortcode for the AWS service
you are planning to use e.g `Amazon SQS` => `aws-smsdk-sqs` `Amazon DynamoDB`
=> `aws-smssdk-dynamodb`.
* SDKs are not generated for every service - check the `/sdks` directory
for supported services.

### Installing a service SDK

`opam pin https://github.com/chris-armstrong/aws-smsdk`

`opam install aws-smsdk-sqs`

## Developing

See the [Developers Guide](DEVELOPERS.md)

## Licence

MIT Licence, see [LICENCE.md](LICENCE.md)
