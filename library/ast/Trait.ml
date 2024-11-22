open Base

type serviceDetails = {
  sdkId : string;
  arnNamespace : string option;
  cloudFormationName : string option;
  cloudTrailEventSource : string option;
  endpointPrefix : string option;
}
[@@deriving show, equal]

type enumPair = { name : string option; value : string } [@@deriving show, equal]
type errorTraitType = Server | Client [@@deriving show, equal]

type arnReferenceDetails = {
  type_ : string option;
  service : string option;
  resource : string option;
}
[@@deriving show, equal]

type reference = { resource : string; service : string option } [@@deriving show, equal]

type clientEndpointDiscoveryDetails = { operation : string; error : string }
[@@deriving show, equal]

type externalDocumentationType = DocumentationLink of string | SpecificationLink of string
[@@deriving show, equal]

type staticContextParamValue =
  | StaticContextStringValue of string
  | StaticContextBooleanValue of bool
  | StaticContextStringListValue of string list
[@@deriving show, equal]

type staticContextParams = (string * staticContextParamValue) list [@@deriving show, equal]

type t =
  | ApiTitleTrait of string
  | ApiXmlNamespaceTrait of string
  | AuthTrait
  | AwsApiArnReferenceTrait of arnReferenceDetails
  | AwsApiClientDiscoveredEndpointTrait
  | AwsApiClientEndpointDiscoveryTrait of clientEndpointDiscoveryDetails
  | AwsApiControlPlaneTrait
  | AwsApiDataPlaneTrait
  | AwsAuthSigV4Trait of string
  | AwsAuthUnsignedPayloadTrait
  | AwsCloudFormationCfnExcludePropertyTrait
  | AwsCloudFormationCfnMutabilityTrait
  | AwsCustomizationsS3UnwrappedXmlOutputTrait
  | AwsIamActionPermissionDescriptionTrait
  | AwsIamConditionKeysTrait
  | AwsIamDefineConditionKeysTrait
  | AwsIamRequiredActionsTrait
  | AwsProtocolAwsJson1_0Trait
  | AwsProtocolAwsJson1_1Trait
  | AwsProtocolAwsQueryCompatibleTrait
  | AwsProtocolAwsQueryErrorTrait
  | AwsProtocolAwsQueryTrait
  | AwsProtocolEc2QueryNameTrait of string
  | AwsProtocolEc2QueryTrait
  | AwsProtocolRestJson1Trait
  | AwsProtocolRestXmlTrait
  | AwsProtocolsHttpChecksumTrait
  | BoxTrait
  | CorsTrait
  | DefaultTrait
  | DeprecatedTrait
  | DocumentationTrait of string
  | EndpointTrait
  | EnumTrait of enumPair list
  | EnumValueTrait of string
  | ErrorTrait of errorTraitType
  | EventPayloadTrait
  | ExamplesTrait
  | ExternalDocumentationTrait of externalDocumentationType
  | HostLabelTrait
  | HttpChecksumRequiredTrait
  | HttpErrorTrait of int
  | HttpHeaderTrait
  | HttpLabelTrait
  | HttpPayloadTrait
  | HttpPrefixHeadersTrait of string
  | HttpQueryParams
  | HttpQueryTrait
  | HttpResponseCodeTrait
  | HttpTrait
  | IdempotencyTokenTrait
  | IdempotentTrait
  | InputTrait
  | JsonNameTrait of string
  | LengthTrait of int option * int option
  | MediaTypeTrait of string
  | OptionalAuthTrait
  | OutputTrait
  | PaginatedTrait
  | PatternTrait of string
  | RangeTrait of float option * float option
  | ReadonlyTrait
  | ReferencesTrait of reference list
  | RequiredTrait
  | RequiresLengthTrait
  | RetryableTrait
  | RulesEndpointRuleSetTrait
  | RulesEndpointTests
  | RulesContextParam of string
  | RulesStaticContextParams of staticContextParams
  | SensitiveTrait
  | ServiceTrait of serviceDetails
  | SparseTrait
  | StreamingTrait
  | SuppressTrait
  | TagsTrait of string list
  | TimestampFormatTrait of string
  | TestSmokeTests
  | WaitableTrait
  | XmlAttributeTrait
  | XmlFlattenedTrait
  | XmlNameTrait of string
[@@deriving show, equal]

let isEnumTrait trait = match trait with EnumTrait _ -> true | _ -> false
let isRequiredTrait trait = match trait with RequiredTrait -> true | _ -> false
let isErrorTrait trait = match trait with ErrorTrait _ -> true | _ -> false
let isAwsApiServiceTrait trait = match trait with ServiceTrait _ -> true | _ -> false
let isTimestampFormatTrait trait = match trait with TimestampFormatTrait _ -> true | _ -> false

let hasTrait traitsOption traitTest =
  Option.value ~default:false
    (Option.map
       ~f:(fun traits -> List.exists ~f:(fun trait -> traitTest trait) traits)
       traitsOption)

let findTrait traits traitsTest = traits |> List.find ~f:traitsTest

let extractTrait extractor traits =
  List.find_map_exn (traits |> Option.value ~default:[]) ~f:extractor

let extractServiceTrait = extractTrait (function ServiceTrait x -> Some x | _ -> None)
let extractDocumentationTrait = extractTrait (function DocumentationTrait x -> Some x | _ -> None)
