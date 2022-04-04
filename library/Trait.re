[@deriving show]
type serviceDetails = {
  sdkId: string,
  arnNamespace: string,
  cloudFormationName: string,
  cloudTrailEventSource: string,
  endpointPrefix: option(string),
};

[@deriving show]
type enumPair = {
  name: option(string),
  value: string,
};

[@deriving show]
type errorTraitType =
  | Server
  | Client;

[@deriving show]
type arnReferenceDetails = {
  type_: option(string),
  service: option(string),
  resource: option(string),
};

[@deriving show]
type reference = {
  resource: string,
  service: option(string),
};

[@deriving show]
type clientEndpointDiscoveryDetails = {
  operation: string,
  error: string,
};

[@deriving show]
type externalDocumentationType =
  | DocumentationLink(string)
  | SpecificationLink(string);

[@deriving show]
type t =
  | DocumentationTrait(string)
  | ErrorTrait(errorTraitType)
  | HttpErrorTrait(int)
  | ServiceTrait(serviceDetails)
  | RequiredTrait
  | XmlFlattenedTrait
  | XmlNameTrait(string)
  | AwsAuthSigV4Trait(string)
  | ApiTitleTrait(string)
  | ApiXmlNamespaceTrait(string)
  | AwsProtocolAwsQueryTrait
  | AwsProtocolRestJson1Trait
  | AwsProtocolRestXmlTrait
  | EnumTrait(list(enumPair))
  | CorsTrait
  | PaginatedTrait
  | PatternTrait(string)
  | IdempotencyTokenTrait
  | HttpLabelTrait
  | HttpQueryTrait
  | HttpHeaderTrait
  | RetryableTrait
  | RangeTrait(option(int), option(int))
  | LengthTrait(option(int), option(int))
  | TimestampFormatTrait(string)
  | AwsProtocolAwsJson1_0Trait
  | AwsProtocolAwsJson1_1Trait
  | BoxTrait
  | SensitiveTrait
  | AwsApiArnReferenceTrait(arnReferenceDetails)
  | ReferencesTrait(list(reference))
  | JsonNameTrait(string)
  | HttpPayloadTrait
  | HttpQueryParams
  | TagsTrait(list(string))
  | DeprecatedTrait
  | MediaTypeTrait(string)
  | AwsApiClientEndpointDiscoveryTrait(clientEndpointDiscoveryDetails)
  | AwsProtocolEc2QueryNameTrait(string)
  | AwsProtocolEc2QueryTrait
  | HttpResponseCodeTrait
  | StreamingTrait
  | HostLabelTrait
  | HttpPrefixHeadersTrait(string)
  | XmlAttributeTrait
  | ExternalDocumentationTrait(externalDocumentationType)
  | EventPayloadTrait
  | HttpTrait
  | IdempotentTrait
  | ReadonlyTrait
  | WaitableTrait
  | EndpointTrait
  | AuthTrait
  | OptionalAuthTrait
  | SuppressTrait
  | AwsAuthUnsignedPayloadTrait
  | RequiresLengthTrait
  | SparseTrait
  | HttpChecksumRequiredTrait
  | AwsApiClientDiscoveredEndpointTrait
  | AwsProtocolAwsQueryErrorTrait
  | AwsCloudFormationCfnExcludePropertyTrait
  | AwsCloudFormationCfnMutabilityTrait
  | AwsIamRequiredActionsTrait
  | AwsApiDataPlaneTrait
  | AwsIamDefineConditionKeysTrait
  | ExamplesTrait
  | AwsApiControlPlaneTrait
  | AwsIamActionPermissionDescriptionTrait
  | AwsIamConditionKeysTrait
  | AwsProtocolsHttpChecksumTrait
  | AwsCustomizationsS3UnwrappedXmlOutputTrait;

let isEnumTrait = trait =>
  switch (trait) {
  | EnumTrait(_) => true
  | _ => false
  };
let isRequiredTrait = trait =>
  switch (trait) {
  | RequiredTrait => true
  | _ => false
  };

let isErrorTrait = trait =>
  switch (trait) {
  | ErrorTrait(_) => true
  | _ => false
  };

let isAwsApiServiceTrait = trait =>
  switch (trait) {
  | ServiceTrait(_) => true
  | _ => false
  };
let isTimestampFormatTrait = trait =>
  switch (trait) {
  | TimestampFormatTrait(_) => true
  | _ => false
  };

let hasTrait = (traitsOption, traitTest) =>
  Option.value(
    ~default=false,
    Option.map(
      (. traits) => List.exists(trait => traitTest(trait), traits),
      traitsOption,
    ),
  );

let findTrait = (traits, traitsTest) => traits|>(List.find(traitsTest));
