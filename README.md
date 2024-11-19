# smaws

This is an experimental project to generate OCaml bindings for the AWS SDK using
Smithy definitions.

This is a work in progress. Only some services are defined as SDKs,
and the protocol generators may only be able to work on some services
(and their implementations may incomplete or untested).

## Usage
### Installation


You can install directly from opam using:

`opam install smaws-clients`

You can also pin this repository with: `opam pin https://github.com/chris-armstrong/smaws.git` to use the most recent unreleased version.

### Before you start 

* The SDKs provided by this package use eio for async communication. If you're using lwt or async or riot or miou, you may need a bridge library to plug into.
* SDK Clients are stored in the `smaws-clients` package
* You import the client you want from `Smaws_Clients.<ClientName>` e.g. `Smaws_Clients.DynamoDB`
=> `aws-smssdk-dynamodb`.
* SDKs are not generated for every service - check the `/sdks` directory for supported services.
* Only environment and profile authentication with stored credentials is supported (see the [documentation](https://chris-armstrong.github.io/smaws/smaws-clients#authorization))
### Documentation
Please see the [documentation](https://chris-armstrong.github.io/smaws/smaws-clients) for detailed installation and usage instructions.

### Examples

You can find examples in the [examples directory](https://github.com/chris-armstrong/smaws/tree/main/awssdklib_examples).


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
