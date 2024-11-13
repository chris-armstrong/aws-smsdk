# AWS SMSDK

This is an experimental project to generate OCaml bindings for the AWS SDK using
Smithy definitions.

This is a work in progress. Only some services are defined as SDKs,
and the protocol generators may only be able to work on some services
(and their implementations may incomplete or untested).


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
* SDK Clients are stored in the `aws-smsdk-clients` package
* You import the client you want from `Aws_SmSdk_Clients.<ClientName>` e.g. `Aws_SmSdk_Clients.DynamoDB`
=> `aws-smssdk-dynamodb`.
* SDKs are not generated for every service - check the `/sdks` directory
for supported services.

### Installing the clients

`opam pin https://github.com/chris-armstrong/aws-smsdk`

`opam install aws-smsdk-clients`

## Developing

See the [Developers Guide](DEVELOPERS.md)

## Status
### Protocols

Internally, AWS uses a number of serialisation protocols, which differ between services

| Protocol        | Basic SDK Generation  | All Annotations | Services |
| ---             | ---                   | ---             | ---      |
| AwsJson_1.0     | :tick:                | :cross:         | SQS, DynamoDB |
| AwsJson_1.1     | :tick:                | :cross:         | |
| AwsQuery        | :cross:               | :cross:         | |
| restJson        | :cross:               | :cross:         | about 2/3 of services |
| EC2 Query       | :cross:               | :cross:         | EC2? |

### Services
At the moment, we can generate bindings for the AwsJson_1.0/1.1 protocol,
which covers a significant number of SDKs but has not been thoroughly
tested for completeness or compliance. (If you know of good compliance
suites for AWS service implementations, please reach out!)

* acm
* apprunner
* backup-gateway
* cloudtrail
* codeconnections
* cognito-identity
* config-service
* dax
* directory-service
* dynamodb
* dynamodb-streams
* eventbridge
* fms
* kendra
* keyspaces
* kinesis
* kinesis-analytics
* kinesis-analytics-v2
* kms
* lightsail
* marketplace-agreement
* migration-hub
* opensearchserverless
* pi
* proton
* resource-groups-tagging-api
* route53-recovery-cluster
* servicediscovery
* sfn
* shield
* snowball
* sqs
* ssm
* swf
* transcribe
* waf
* wafv2
* workmail

Note that we do not have any compliance suites to test our implementations for each service - if you have any ideas, please get in touch.

## Licence

Copyright (C) Christopher Armstrong 2024

MIT Licence, see [LICENCE.md](LICENCE.md)
