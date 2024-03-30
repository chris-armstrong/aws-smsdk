open Base
open Json.Decode
open Json.ResultHelpers
type nonrec ('a, 'b) dual =
  | Primary of 'a 
  | Secondary of 'b 
let fallback value parse1 parse2 =
  match parse1 value with
  | ((Ok (parsed))[@explicit_arity ]) ->
      ((Ok (((Primary (parsed))[@explicit_arity ])))[@explicit_arity ])
  | ((Error (error))[@explicit_arity ]) ->
      (match error with
       | WrongType _ ->
           (match parse2 value with
            | ((Ok (parsed))[@explicit_arity ]) ->
                ((Ok (((Secondary (parsed))[@explicit_arity ])))
                [@explicit_arity ])
            | ((Error (error))[@explicit_arity ]) -> ((Error (error))
                [@explicit_arity ]))
       | _ -> ((Error (error))[@explicit_arity ]))
exception UnknownTrait of string 
let extractTargetSpec target =
  ((target |> parseObject) |> (field "target")) |> parseString
let parseServiceTrait traitResult =
  let value = parseObject traitResult in
  let sdkId_ = (value |> (field "sdkId")) |> parseString in
  let arnNamespace_ = (value |> (field "arnNamespace")) |> parseString in
  let cloudFormationName_ =
    (value |> (field "cloudFormationName")) |> parseString in
  let cloudTrailEventSource_ =
    (value |> (field "cloudTrailEventSource")) |> parseString in
  let endpointPrefix_ =
    (optional (value |> (field "endpointPrefix"))) |>
      (mapOptional parseString) in
  map5 sdkId_ arnNamespace_ cloudFormationName_ cloudTrailEventSource_
    endpointPrefix_
    (fun sdkId ->
       fun arnNamespace ->
         fun cloudFormationName ->
           fun cloudTrailEventSource ->
             fun endpointPrefix ->
               ((Trait.ServiceTrait
                   ({
                      sdkId;
                      arnNamespace;
                      cloudFormationName;
                      cloudTrailEventSource;
                      endpointPrefix
                    }))
               [@explicit_arity ]))
let parseEnumNameValue enum =
  (let obj_ = parseObject enum in
   let name_ =
     (optional (obj_ |> (field "name"))) |> (mapOptional parseString) in
   let value_ = (obj_ |> (field "value")) |> parseString in
   map2 name_ value_
     (fun name ->
        fun value -> ((let open Trait in { name; value })[@ns.braces ])) : 
  (Trait.enumPair, jsonParseError) Result.t)
let parseArnReferenceTrait value =
  (let record = parseObject value in
   let type__ =
     (optional (record |> (field "type"))) |> (mapOptional parseString) in
   let service_ =
     (optional (record |> (field "service"))) |> (mapOptional parseString) in
   let resource_ =
     (optional (record |> (field "resource"))) |> (mapOptional parseString) in
   map3 type__ service_ resource_
     (fun type_ ->
        fun service ->
          fun resource ->
            ((Trait.AwsApiArnReferenceTrait ({ type_; service; resource }))
            [@explicit_arity ])) : (Trait.t, jsonParseError) Result.t)
let parseReference value =
  (let object_ = value |> parseObject in
   let resource = (object_ |> (field "resource")) |> parseString in
   let service =
     ((object_ |> (field "service")) |> optional) |>
       (mapOptional parseString) in
   map2 resource service
     (fun resource ->
        fun service -> ({ resource; service } : Trait.reference)) : (Trait.reference,
                                                                    jsonParseError)
                                                                    Result.t)
let parseTrait name (value : (jsonTreeRef, jsonParseError) Result.t) =
  let open Result in
    let traitValue =
      match name with
      | "aws.api#service" -> parseServiceTrait value
      | "smithy.api#documentation" ->
          (value |> parseString) |>
            (Result.map
               ~f:(fun documentation ->
                     ((Trait.DocumentationTrait (documentation))
                     [@explicit_arity ])))
      | "smithy.api#required" -> ((Ok (RequiredTrait))[@explicit_arity ])
      | "smithy.api#xmlFlattened" -> ((Ok (XmlFlattenedTrait))
          [@explicit_arity ])
      | "smithy.api#xmlName" ->
          (value |> parseString) >>|
            ((fun xmlName -> ((Trait.XmlNameTrait (xmlName))
                [@explicit_arity ])))
      | "smithy.api#error" ->
          (value |> parseString) >>|
            ((fun error ->
                match error with
                | "server" -> ((Trait.ErrorTrait (Server))[@explicit_arity ])
                | _ -> ((ErrorTrait (Client))[@explicit_arity ])))
      | "smithy.api#httpError" ->
          (value |> parseInteger) >>|
            ((fun error -> ((Trait.HttpErrorTrait (error))[@explicit_arity ])))
      | "smithy.api#title" ->
          (value |> parseString) >>|
            ((fun title -> ((Trait.ApiTitleTrait (title))[@explicit_arity ])))
      | "smithy.api#xmlNamespace" ->
          (((value |> parseObject) |> (field "uri")) |> parseString) >>|
            ((fun uri -> ((Trait.ApiXmlNamespaceTrait (uri))
                [@explicit_arity ])))
      | "smithy.api#enum" ->
          (value |> (parseArray parseEnumNameValue)) >>|
            ((fun enumPairs -> ((Trait.EnumTrait (enumPairs))
                [@explicit_arity ])))
      | "aws.auth#sigv4" ->
          (((value |> parseObject) |> (field "name")) |> parseString) >>|
            ((fun name -> ((Trait.AwsAuthSigV4Trait (name))
                [@explicit_arity ])))
      | "aws.protocols#awsQuery" -> ((Ok (Trait.AwsProtocolAwsQueryTrait))
          [@explicit_arity ])
      | "smithy.api#paginated" -> ((Ok (Trait.PaginatedTrait))
          [@explicit_arity ])
      | "smithy.api#pattern" ->
          (value |> parseString) >>|
            ((fun pattern -> ((Trait.PatternTrait (pattern))
                [@explicit_arity ])))
      | "smithy.api#cors" -> ((Ok (CorsTrait))[@explicit_arity ])
      | "aws.protocols#restJson1" -> ((Ok (Trait.AwsProtocolRestJson1Trait))
          [@explicit_arity ])
      | "smithy.api#idempotencyToken" -> ((Ok (Trait.IdempotencyTokenTrait))
          [@explicit_arity ])
      | "smithy.api#httpLabel" -> ((Ok (Trait.HttpLabelTrait))
          [@explicit_arity ])
      | "smithy.api#httpQuery" -> ((Ok (Trait.HttpQueryTrait))
          [@explicit_arity ])
      | "smithy.api#httpHeader" -> ((Ok (Trait.HttpHeaderTrait))
          [@explicit_arity ])
      | "smithy.api#retryable" -> ((Ok (Trait.RetryableTrait))
          [@explicit_arity ])
      | "smithy.api#timestampFormat" ->
          (value |> parseString) >>|
            ((fun timestampFormat ->
                ((Trait.TimestampFormatTrait (timestampFormat))
                [@explicit_arity ])))
      | "smithy.api#range" ->
          ((let obj = value |> parseObject in
            let min =
              (optional (obj |> (field "min"))) |> (mapOptional parseInteger) in
            let max =
              (optional (obj |> (field "max"))) |> (mapOptional parseInteger) in
            map2 min max
              (fun min ->
                 fun max -> ((Trait.RangeTrait (min, max))[@implicit_arity ])))
          [@ns.braces ])
      | "smithy.api#length" ->
          ((let record = value |> parseObject in
            map2
              ((optional (record |> (field "min"))) |>
                 (mapOptional parseInteger))
              ((optional (record |> (field "max"))) |>
                 (mapOptional parseInteger))
              (fun min ->
                 fun max -> ((Trait.LengthTrait (min, max))
                   [@implicit_arity ])))
          [@ns.braces ])
      | "aws.protocols#awsJson1_0" ->
          ((Ok (Trait.AwsProtocolAwsJson1_0Trait))[@explicit_arity ])
      | "aws.protocols#awsJson1_1" ->
          ((Ok (Trait.AwsProtocolAwsJson1_1Trait))[@explicit_arity ])
      | "smithy.api#box" -> ((Ok (Trait.BoxTrait))[@explicit_arity ])
      | "smithy.api#sensitive" -> ((Ok (Trait.SensitiveTrait))
          [@explicit_arity ])
      | "aws.api#arnReference" ->
          (parseArnReferenceTrait value) >>|
            ((fun arnNamespace -> arnNamespace))
      | "smithy.api#references" ->
          (value |> (parseArray parseReference)) >>|
            ((fun references -> ((Trait.ReferencesTrait (references))
                [@explicit_arity ])))
      | "smithy.api#jsonName" ->
          (parseString value) >>|
            ((fun jsonName -> ((Trait.JsonNameTrait (jsonName))
                [@explicit_arity ])))
      | "smithy.api#httpPayload" -> ((Ok (Trait.HttpPayloadTrait))
          [@explicit_arity ])
      | "smithy.api#httpQueryParams" -> ((Ok (Trait.HttpQueryParams))
          [@explicit_arity ])
      | "smithy.api#tags" ->
          (value |> (parseArray parseString)) >>|
            ((fun tags -> ((Trait.TagsTrait (tags))[@explicit_arity ])))
      | "smithy.api#deprecated" -> ((Ok (Trait.DeprecatedTrait))
          [@explicit_arity ])
      | "smithy.api#mediaType" ->
          (parseString value) >>|
            ((fun mediaType -> ((Trait.MediaTypeTrait (mediaType))
                [@explicit_arity ])))
      | "aws.protocols#restXml" -> ((Ok (Trait.AwsProtocolRestXmlTrait))
          [@explicit_arity ])
      | "aws.api#clientEndpointDiscovery" ->
          ((let obj = parseObject value in
            let operation = (obj |> (field "operation")) |> parseString in
            let error = (obj |> (field "error")) |> parseString in
            map2 operation error
              (fun operation ->
                 fun error ->
                   ((Trait.AwsApiClientEndpointDiscoveryTrait
                       ({ operation; error }))
                   [@explicit_arity ])))
          [@ns.braces ])
      | "aws.protocols#ec2QueryName" ->
          (value |> parseString) >>|
            ((fun queryName ->
                ((Trait.AwsProtocolEc2QueryNameTrait (queryName))
                [@explicit_arity ])))
      | "aws.protocols#ec2Query" -> ((Ok (Trait.AwsProtocolEc2QueryTrait))
          [@explicit_arity ])
      | "smithy.api#httpResponseCode" -> ((Ok (Trait.HttpResponseCodeTrait))
          [@explicit_arity ])
      | "smithy.api#streaming" -> ((Ok (Trait.StreamingTrait))
          [@explicit_arity ])
      | "smithy.api#hostLabel" -> ((Ok (Trait.HostLabelTrait))
          [@explicit_arity ])
      | "smithy.api#httpPrefixHeaders" ->
          (value |> parseString) >>|
            ((fun httpPrefixHeader ->
                ((Trait.HttpPrefixHeadersTrait (httpPrefixHeader))
                [@explicit_arity ])))
      | "smithy.api#xmlAttribute" -> ((Ok (Trait.XmlAttributeTrait))
          [@explicit_arity ])
      | "smithy.api#externalDocumentation" ->
          let documentation =
            (value |> parseObject) |> (field "Documentation") in
          let specification =
            (value |> parseObject) |> (field "Specification") in
          (match (documentation, specification) with
           | (((Ok (link))[@explicit_arity ]), _) ->
               (((Ok (link))[@explicit_arity ]) |> parseString) >>|
                 ((fun link ->
                     ((Trait.ExternalDocumentationTrait
                         (((Trait.DocumentationLink (link))
                           [@explicit_arity ])))
                     [@explicit_arity ])))
           | (_, ((Ok (link))[@explicit_arity ])) ->
               (((Ok (link))[@explicit_arity ]) |> parseString) >>|
                 ((fun link ->
                     ((Trait.ExternalDocumentationTrait
                         (((Trait.SpecificationLink (link))
                           [@explicit_arity ])))
                     [@explicit_arity ])))
           | (((Error (x))[@explicit_arity ]), Error _) -> ((Error (x))
               [@explicit_arity ]))
      | "smithy.api#eventPayload" -> ((Ok (Trait.EventPayloadTrait))
          [@explicit_arity ])
      | "smithy.api#http" -> ((Ok (Trait.HttpTrait))[@explicit_arity ])
      | "smithy.api#idempotent" -> ((Ok (Trait.IdempotentTrait))
          [@explicit_arity ])
      | "smithy.api#readonly" -> ((Ok (Trait.ReadonlyTrait))
          [@explicit_arity ])
      | "smithy.waiters#waitable" -> ((Ok (Trait.WaitableTrait))
          [@explicit_arity ])
      | "smithy.api#endpoint" -> ((Ok (Trait.EndpointTrait))
          [@explicit_arity ])
      | "smithy.api#auth" -> ((Ok (Trait.AuthTrait))[@explicit_arity ])
      | "smithy.api#optionalAuth" -> ((Ok (Trait.OptionalAuthTrait))
          [@explicit_arity ])
      | "smithy.api#suppress" -> ((Ok (Trait.SuppressTrait))
          [@explicit_arity ])
      | "aws.auth#unsignedPayload" ->
          ((Ok (Trait.AwsAuthUnsignedPayloadTrait))[@explicit_arity ])
      | "smithy.api#requiresLength" -> ((Ok (Trait.RequiresLengthTrait))
          [@explicit_arity ])
      | "smithy.api#sparse" -> ((Ok (Trait.SparseTrait))[@explicit_arity ])
      | "smithy.api#httpChecksumRequired" ->
          ((Ok (Trait.HttpChecksumRequiredTrait))[@explicit_arity ])
      | "aws.api#clientDiscoveredEndpoint" ->
          ((Ok (Trait.AwsApiClientDiscoveredEndpointTrait))
          [@explicit_arity ])
      | "aws.protocols#awsQueryError" ->
          ((Ok (Trait.AwsProtocolAwsQueryErrorTrait))[@explicit_arity ])
      | "aws.cloudformation#cfnExcludeProperty" ->
          ((Ok (Trait.AwsCloudFormationCfnExcludePropertyTrait))
          [@explicit_arity ])
      | "aws.cloudformation#cfnMutability" ->
          ((Ok (Trait.AwsCloudFormationCfnMutabilityTrait))
          [@explicit_arity ])
      | "aws.iam#requiredActions" -> ((Ok (Trait.AwsIamRequiredActionsTrait))
          [@explicit_arity ])
      | "aws.api#dataPlane" -> ((Ok (Trait.AwsApiDataPlaneTrait))
          [@explicit_arity ])
      | "aws.iam#defineConditionKeys" ->
          ((Ok (Trait.AwsIamDefineConditionKeysTrait))[@explicit_arity ])
      | "smithy.api#examples" -> ((Ok (Trait.ExamplesTrait))
          [@explicit_arity ])
      | "aws.api#controlPlane" -> ((Ok (Trait.AwsApiControlPlaneTrait))
          [@explicit_arity ])
      | "aws.iam#actionPermissionDescription" ->
          ((Ok (Trait.AwsIamActionPermissionDescriptionTrait))
          [@explicit_arity ])
      | "aws.iam#conditionKeys" -> ((Ok (Trait.AwsIamConditionKeysTrait))
          [@explicit_arity ])
      | "aws.protocols#httpChecksum" ->
          ((Ok (Trait.AwsProtocolsHttpChecksumTrait))[@explicit_arity ])
      | "aws.customizations#s3UnwrappedXmlOutput" ->
          ((Ok (Trait.AwsCustomizationsS3UnwrappedXmlOutputTrait))
          [@explicit_arity ])
      | _ -> raise ((UnknownTrait (name))[@explicit_arity ]) in
    traitValue
let parseListShape shape =
  ((let target_ = (shape |> (field "member")) |> extractTargetSpec in
    let traitParser = parseRecord parseTrait in
    let traits_ = optional ((shape |> (field "traits")) |> traitParser) in
    map2 target_ traits_
      (fun target ->
         fun traits -> ((Shape.ListShape ({ target; traits }))
           [@explicit_arity ])))
  [@ns.braces ])
let parseMember name value =
  ((let member = parseObject value in
    let target_ = (member |> (field "target")) |> parseString in
    let traits_ =
      optional (parseRecord parseTrait (member |> (field "traits"))) in
    map2 target_ traits_
      (fun target ->
         fun traits -> ((let open Shape in { name; target; traits })
           [@ns.braces ])))
  [@ns.braces ])
let parseMembers value = ((parseRecord parseMember value)[@ns.braces ])
let parseStructureShape value =
  ((let members = (value |> (field "members")) |> parseMembers in
    let traits =
      optional ((value |> (field "traits")) |> (parseRecord parseTrait)) in
    map2 members traits
      (fun members ->
         fun traits -> ((Shape.StructureShape ({ members; traits }))
           [@explicit_arity ])))
  [@ns.braces ])
let parseOperationShape shape =
  ((let inputTarget =
      optional ((shape |> (field "input")) |> extractTargetSpec) in
    let outputTarget =
      optional ((shape |> (field "output")) |> extractTargetSpec) in
    let errors =
      optional
        ((shape |> (field "errors")) |> (parseArray extractTargetSpec)) in
    let traits =
      optional ((shape |> (field "traits")) |> (parseRecord parseTrait)) in
    let documentation =
      optional
        ((((shape |> (field "traits")) |> parseObject) |>
            (field "smithy.api#documentation"))
           |> parseString) in
    map5 inputTarget outputTarget errors documentation traits
      (fun inputValue ->
         fun outputValue ->
           fun errorsValue ->
             fun documentationValue ->
               fun traits ->
                 ((Shape.OperationShape
                     ({
                        input = inputValue;
                        output = outputValue;
                        errors = errorsValue;
                        documentation = documentationValue;
                        traits
                      }))
                 [@explicit_arity ])))
  [@ns.braces ])
let parseServiceShape shapeDict =
  ((let version_ = (shapeDict |> (field "version")) |> parseString in
    let operations_ =
      (optional (shapeDict |> (field "operations"))) |>
        (mapOptional
           (fun operations -> parseArray extractTargetSpec operations)) in
    let traits_ =
      (optional (shapeDict |> (field "traits"))) |>
        (mapOptional (fun traits -> traits |> (parseRecord parseTrait))) in
    map3 version_ operations_ traits_
      (fun version ->
         fun operations ->
           fun traits ->
             ((Shape.ServiceShape ({ version; operations; traits }))
             [@explicit_arity ])))
  [@ns.braces ])
let parseStringShape shapeDict =
  ((let traits_ =
      ((shapeDict |> (field "traits")) |> optional) |>
        (mapOptional (fun traits -> parseRecord parseTrait traits)) in
    Result.map traits_
      ~f:(fun traits -> ((Shape.StringShape ({ traits }))[@explicit_arity ])))
  [@ns.braces ])
let parseMapKey value =
  ((let mapValue = value |> parseObject in
    let target_ = (mapValue |> (field "target")) |> parseString in
    let traits_ =
      (optional (mapValue |> (field "traits"))) |>
        (mapOptional (fun traits -> parseRecord parseTrait traits)) in
    map2 target_ traits_
      (fun target ->
         fun traits -> ((let open Shape in { target; traits })[@ns.braces ])))
  [@ns.braces ])
let parseMapShape shapeDict =
  ((let key_ = parseMapKey (shapeDict |> (field "key")) in
    let value_ = parseMapKey (shapeDict |> (field "value")) in
    let traits_ =
      (optional (shapeDict |> (field "traits"))) |>
        (mapOptional (fun traits -> traits |> (parseRecord parseTrait))) in
    map3 key_ value_ traits_
      (fun key ->
         fun value ->
           fun traits ->
             ((Shape.MapShape ({ mapKey = key; mapValue = value; traits }))
             [@explicit_arity ])))
  [@ns.braces ])
let parseUnionShape value =
  ((let members = (value |> (field "members")) |> parseMembers in
    let traits =
      optional ((value |> (field "traits")) |> (parseRecord parseTrait)) in
    map2 members traits
      (fun members ->
         fun traits -> ((Shape.UnionShape ({ members; traits }))
           [@explicit_arity ])))
  [@ns.braces ])
let parsePrimitive shapeDict =
  ((let traits_ =
      (optional (shapeDict |> (field "traits"))) |>
        (mapOptional (fun traits -> traits |> (parseRecord parseTrait))) in
    Result.map traits_
      ~f:(fun traits -> ({ traits } : Shape.primitiveShapeDetails)))
  [@ns.braces ])
let parseResourceShape _ = ((Ok (Shape.ResourceShape))[@explicit_arity ])
let parseSetShape shapeDict =
  ((let target =
      (((shapeDict |> (field "member")) |> parseObject) |> (field "target"))
        |> parseString in
    let traits =
      (optional (shapeDict |> (field "traits"))) |>
        (mapOptional (fun traits -> traits |> (parseRecord parseTrait))) in
    map2 target traits
      (fun target ->
         fun traits -> ((Shape.SetShape ({ target; traits }))
           [@explicit_arity ])))
  [@ns.braces ])
let parseTimestampShape shapeDict =
  ((let traits_ =
      (optional (shapeDict |> (field "traits"))) |>
        (mapOptional (fun traits -> traits |> (parseRecord parseTrait))) in
    Result.map traits_
      ~f:(fun traits -> ((Shape.TimestampShape ({ traits }))
            [@explicit_arity ])))
  [@ns.braces ])
let parseShape name shape =
  ((let open Result in
      let shapeDict = parseObject shape in
      let typeDiscriminator = (shapeDict |> (field "type")) |> parseString in
      Result.bind typeDiscriminator
        ~f:(fun typeValue ->
              let descriptor_ =
                match typeValue with
                | "list" -> parseListShape shapeDict
                | "operation" -> parseOperationShape shapeDict
                | "structure" -> parseStructureShape shapeDict
                | "service" -> parseServiceShape shapeDict
                | "blob" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.BlobShape (primitive))
                          [@explicit_arity ])))
                | "boolean" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.BooleanShape (primitive))
                          [@explicit_arity ])))
                | "integer" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.IntegerShape (primitive))
                          [@explicit_arity ])))
                | "string" -> parseStringShape shapeDict
                | "map" -> parseMapShape shapeDict
                | "union" -> parseUnionShape shapeDict
                | "resource" -> parseResourceShape shapeDict
                | "timestamp" -> parseTimestampShape shapeDict
                | "long" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.LongShape (primitive))
                          [@explicit_arity ])))
                | "double" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.DoubleShape (primitive))
                          [@explicit_arity ])))
                | "float" ->
                    (parsePrimitive shapeDict) >>|
                      ((fun primitive -> ((Shape.FloatShape (primitive))
                          [@explicit_arity ])))
                | "set" -> parseSetShape shapeDict
                | _ ->
                    ((Error
                        (((CustomError
                             (({js|unknown shape type |js} ^ typeValue)))
                          [@explicit_arity ])))
                    [@explicit_arity ]) in
              Result.map descriptor_
                ~f:(fun descriptor ->
                      ((let open Shape in { name; descriptor })[@ns.braces ]))))
  [@ns.braces ])
let parseShapes shapesModel = parseRecord parseShape shapesModel
let parseModel baseModel =
  ((baseModel |> parseObject) |> (field "shapes")) |> parseShapes