# AWS SMSDK

This is an experimental project to generate OCaml bindings for the AWS SDK using
Smithy definitions.

## Status

This is a work in progress. Only some services are defined as SDKs,
and the protocol generators may only be able to work on some services
(and their implementations may incomplete or buggy).

We currently can generate bindings for services using the `AwsJson1.0/1.1` protocols. We have added support for these services:

* SQS
* DynamoDB

Note that we do not have any compliance suites to test our implementations for each service - if you have any ideas, please get in touch.

## Installation

The code in this repository is not currently available through opam.

However, you can use it by pinning the opam repository:

`opam pin https://github.com/chris-armstrong/aws-smsdk.git`

You will also need to pin some of its dependencies too:

* [eio-ssl](https://github.com/anmonteiro/eio-ssl.git)

(you should be asked to pin `eio-ssl` when you pin `aws-smsdk`)

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

Copyright (C) Christopher Armstrong 2024

MIT Licence, see [LICENCE.md](LICENCE.md)
