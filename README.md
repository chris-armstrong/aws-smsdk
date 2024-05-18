# AWS SMSDK

This is a project to generate OCaml bindings for the AWS SDK using
Smithy definitions.

Bindings use the [eio]() library for async, leveraging [httpaf]
and [h2] by @anmonteiro for HTTP communication.

## Status

This is a work in progress. 

At the moment, we can generate bindings for the AwsJson_1.0 protocol,
which covers a significant number of SKs

## Installation

The code in this repository is not currently available through opam.

However, you can use it by pinning the opam repository:

`opam pin https://github.com/chris-armstrong/aws-smsdk`

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


