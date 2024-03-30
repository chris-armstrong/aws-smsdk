open Base
type serviceDetails =
  {
  sdkId: string ;
  arnNamespace: string ;
  cloudFormationName: string ;
  cloudTrailEventSource: string ;
  endpointPrefix: string option }[@@deriving (show, equal)]
type enumPair = {
  name: string option ;
  value: string }[@@deriving (show, equal)]
type errorTraitType =
  | Server 
  | Client [@@deriving (show, equal)]
type arnReferenceDetails =
  {
  type_: string option ;
  service: string option ;
  resource: string option }[@@deriving (show, equal)]
type reference = {
  resource: string ;
  service: string option }[@@deriving (show, equal)]
type clientEndpointDiscoveryDetails = {
  operation: string ;
  error: string }[@@deriving (show, equal)]
type externalDocumentationType =
  | DocumentationLink of string 
  | SpecificationLink of string [@@deriving (show, equal)]
type t =
  | DocumentationTrait of string 
  | ErrorTrait of errorTraitType 
  | HttpErrorTrait of int 
  | ServiceTrait of serviceDetails 
  | RequiredTrait 
  | XmlFlattenedTrait 
  | XmlNameTrait of string 
  | AwsAuthSigV4Trait of string 
  | ApiTitleTrait of string 
  | ApiXmlNamespaceTrait of string 
  | AwsProtocolAwsQueryTrait 
  | AwsProtocolRestJson1Trait 
  | AwsProtocolRestXmlTrait 
  | EnumTrait of enumPair list 
  | CorsTrait 
  | PaginatedTrait 
  | PatternTrait of string 
  | IdempotencyTokenTrait 
  | HttpLabelTrait 
  | HttpQueryTrait 
  | HttpHeaderTrait 
  | RetryableTrait 
  | RangeTrait of int option * int option 
  | LengthTrait of int option * int option 
  | TimestampFormatTrait of string 
  | AwsProtocolAwsJson1_0Trait 
  | AwsProtocolAwsJson1_1Trait 
  | BoxTrait 
  | SensitiveTrait 
  | AwsApiArnReferenceTrait of arnReferenceDetails 
  | ReferencesTrait of reference list 
  | JsonNameTrait of string 
  | HttpPayloadTrait 
  | HttpQueryParams 
  | TagsTrait of string list 
  | DeprecatedTrait 
  | MediaTypeTrait of string 
  | AwsApiClientEndpointDiscoveryTrait of clientEndpointDiscoveryDetails 
  | AwsProtocolEc2QueryNameTrait of string 
  | AwsProtocolEc2QueryTrait 
  | HttpResponseCodeTrait 
  | StreamingTrait 
  | HostLabelTrait 
  | HttpPrefixHeadersTrait of string 
  | XmlAttributeTrait 
  | ExternalDocumentationTrait of externalDocumentationType 
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
  | AwsCustomizationsS3UnwrappedXmlOutputTrait [@@deriving (show, equal)]
let isEnumTrait trait = match trait with | EnumTrait _ -> true | _ -> false
let isRequiredTrait trait =
  match trait with | RequiredTrait -> true | _ -> false
let isErrorTrait trait = match trait with | ErrorTrait _ -> true | _ -> false
let isAwsApiServiceTrait trait =
  match trait with | ServiceTrait _ -> true | _ -> false
let isTimestampFormatTrait trait =
  match trait with | TimestampFormatTrait _ -> true | _ -> false
let hasTrait traitsOption traitTest =
  Option.value ~default:false
    (Option.map
       ~f:(fun traits -> List.exists ~f:(fun trait -> traitTest trait) traits)
       traitsOption)
let findTrait traits traitsTest = traits |> (List.find ~f:traitsTest)