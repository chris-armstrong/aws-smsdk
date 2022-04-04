open Base;
open Json.Decode;
open Json.ResultHelpers;

type nonrec dual('a, 'b) =
  | Primary('a)
  | Secondary('b);

let fallback = (value, parse1, parse2) =>
  switch (parse1(value)) {
  | Ok(parsed) => Ok(Primary(parsed))
  | Error(error) =>
    switch (error) {
    | WrongType(_) =>
      switch (parse2(value)) {
      | Ok(parsed) => Ok(Secondary(parsed))
      | Error(error) => Error(error)
      }
    | _ => Error(error)
    }
  };

exception UnknownTrait(string);

let extractTargetSpec = target =>
  target|>parseObject|>(field("target"))|>parseString;

let parseServiceTrait = traitResult =>
  [@ns.braces]
  {
    let value = parseObject(traitResult);
    let sdkId_ = value|>(field("sdkId"))|>parseString;
    let arnNamespace_ = value|>(field("arnNamespace"))|>parseString;
    let cloudFormationName_ =
      value|>(field("cloudFormationName"))|>parseString;
    let cloudTrailEventSource_ =
      value|>(field("cloudTrailEventSource"))|>parseString;
    let endpointPrefix_ =
      optional(value|>(field("endpointPrefix")))
      |>(mapOptional(parseString));
    map5(
      sdkId_,
      arnNamespace_,
      cloudFormationName_,
      cloudTrailEventSource_,
      endpointPrefix_,
      (
        sdkId,
        arnNamespace,
        cloudFormationName,
        cloudTrailEventSource,
        endpointPrefix,
      ) =>
      Trait.ServiceTrait({
        sdkId,
        arnNamespace,
        cloudFormationName,
        cloudTrailEventSource,
        endpointPrefix,
      })
    );
  };

let parseEnumNameValue = (enum): Result.t(Trait.enumPair, jsonParseError) =>
  [@ns.braces]
  {
    let obj_ = parseObject(enum);
    let name_ = optional(obj_|>(field("name")))|>(mapOptional(parseString));
    let value_ = obj_|>(field("value"))|>parseString;
    map2(name_, value_, (name, value) => [@ns.braces] Trait.{name, value});
  };

let parseArnReferenceTrait = (value): Result.t(Trait.t, jsonParseError) =>
  [@ns.braces]
  {
    let record = parseObject(value);
    let type__ =
      optional(record|>(field("type")))|>(mapOptional(parseString));
    let service_ =
      optional(record|>(field("service")))|>(mapOptional(parseString));
    let resource_ =
      optional(record|>(field("resource")))|>(mapOptional(parseString));
    map3(type__, service_, resource_, (type_, service, resource) =>
      Trait.AwsApiArnReferenceTrait({type_, service, resource})
    );
  };

let parseReference = (value): Result.t(Trait.reference, jsonParseError) =>
  [@ns.braces]
  {
    let object_ = value|>parseObject;
    let resource = object_|>(field("resource"))|>parseString;
    let service =
      object_|>(field("service"))|>optional|>(mapOptional(parseString));
    map2(resource, service, (resource, service) =>
      ({resource, service}: Trait.reference)
    );
  };

let parseTrait = (name, value: Result.t(jsonTreeRef, jsonParseError)) =>
  [@ns.braces]
  Result.({
    let traitValue =
      switch (name) {
      | "aws.api#service" => parseServiceTrait(value)
      | "smithy.api#documentation" =>
        value
        |>parseString
        |>(Result.map(~f=(documentation => Trait.DocumentationTrait(documentation))))
      | "smithy.api#required" => Ok(RequiredTrait)
      | "smithy.api#xmlFlattened" => Ok(XmlFlattenedTrait)
      | "smithy.api#xmlName" =>
        value|>parseString>>|(xmlName => Trait.XmlNameTrait(xmlName));
      | "smithy.api#error" =>
        value
        |>parseString
        >>|(
            (error => switch error {
              | "server" => Trait.ErrorTrait(Server);
              | _ => ErrorTrait(Client);
            }
            )
          )
      | "smithy.api#httpError" =>
        value|>parseInteger>>|(error => Trait.HttpErrorTrait(error))
      | "smithy.api#title" =>
        value|>parseString>>|((title => Trait.ApiTitleTrait(title)))
      | "smithy.api#xmlNamespace" =>
        value
        |>parseObject
        |>(field("uri"))
        |>parseString
        >>|((uri => Trait.ApiXmlNamespaceTrait(uri)))
      | "smithy.api#enum" =>
        value
        |>(parseArray(parseEnumNameValue))
        >>|(enumPairs => Trait.EnumTrait(enumPairs))
      | "aws.auth#sigv4" =>
        value
        |>parseObject
        |>(field("name"))
        |>parseString
        >>|((name => Trait.AwsAuthSigV4Trait(name)))
      | "aws.protocols#awsQuery" => Ok(Trait.AwsProtocolAwsQueryTrait)
      | "smithy.api#paginated" => Ok(Trait.PaginatedTrait)
      | "smithy.api#pattern" =>
        value|>parseString>>|((pattern => Trait.PatternTrait(pattern)))
      | "smithy.api#cors" => Ok(CorsTrait)
      | "aws.protocols#restJson1" => Ok(Trait.AwsProtocolRestJson1Trait)
      | "smithy.api#idempotencyToken" => Ok(Trait.IdempotencyTokenTrait)
      | "smithy.api#httpLabel" => Ok(Trait.HttpLabelTrait)
      | "smithy.api#httpQuery" => Ok(Trait.HttpQueryTrait)
      | "smithy.api#httpHeader" => Ok(Trait.HttpHeaderTrait)
      | "smithy.api#retryable" => Ok(Trait.RetryableTrait)
      | "smithy.api#timestampFormat" =>
        value
        |>parseString
        >>|(
            (timestampFormat => Trait.TimestampFormatTrait(timestampFormat))
          )
      | "smithy.api#range" =>
        [@ns.braces]
        {
          let obj = value|>parseObject;
          let min =
            optional(obj|>(field("min")))|>(mapOptional(parseInteger));
          let max =
            optional(obj|>(field("max")))|>(mapOptional(parseInteger));
          map2(min, max, (min, max) =>
            [@implicit_arity] Trait.RangeTrait(min, max)
          );
        }

      | "smithy.api#length" =>
        [@ns.braces]
        {
          let record = value|>parseObject;
          map2(
            optional(record|>(field("min")))|>(mapOptional(parseInteger)),
            optional(record|>(field("max")))|>(mapOptional(parseInteger)),
            (min, max) =>
            [@implicit_arity] Trait.LengthTrait(min, max)
          );
        }

      | "aws.protocols#awsJson1_0" => Ok(Trait.AwsProtocolAwsJson1_0Trait)
      | "aws.protocols#awsJson1_1" => Ok(Trait.AwsProtocolAwsJson1_1Trait)
      | "smithy.api#box" => Ok(Trait.BoxTrait)
      | "smithy.api#sensitive" => Ok(Trait.SensitiveTrait)
      | "aws.api#arnReference" =>
        parseArnReferenceTrait(value)>>|((arnNamespace => arnNamespace))
      | "smithy.api#references" =>
        value
        |>(parseArray(parseReference))
        >>|(references => Trait.ReferencesTrait(references))
      | "smithy.api#jsonName" =>
        parseString(value)>>|((jsonName => Trait.JsonNameTrait(jsonName)))
      | "smithy.api#httpPayload" => Ok(Trait.HttpPayloadTrait)
      | "smithy.api#httpQueryParams" => Ok(Trait.HttpQueryParams)
      | "smithy.api#tags" =>
        value
        |>(parseArray(parseString))
        >>|((tags => Trait.TagsTrait(tags)))
      | "smithy.api#deprecated" => Ok(Trait.DeprecatedTrait)
      | "smithy.api#mediaType" =>
        parseString(value)
        >>|(mediaType => Trait.MediaTypeTrait(mediaType))
      | "aws.protocols#restXml" => Ok(Trait.AwsProtocolRestXmlTrait)
      | "aws.api#clientEndpointDiscovery" =>
        [@ns.braces]
        {
          let obj = parseObject(value);
          let operation = obj|>(field("operation"))|>parseString;
          let error = obj|>(field("error"))|>parseString;
          map2(operation, error, (operation, error) =>
            Trait.AwsApiClientEndpointDiscoveryTrait({operation, error})
          );
        }

      | "aws.protocols#ec2QueryName" =>
        value
        |>parseString
        >>|((queryName => Trait.AwsProtocolEc2QueryNameTrait(queryName)))
      | "aws.protocols#ec2Query" => Ok(Trait.AwsProtocolEc2QueryTrait)
      | "smithy.api#httpResponseCode" => Ok(Trait.HttpResponseCodeTrait)
      | "smithy.api#streaming" => Ok(Trait.StreamingTrait)
      | "smithy.api#hostLabel" => Ok(Trait.HostLabelTrait)
      | "smithy.api#httpPrefixHeaders" =>
        value
        |>parseString
        >>|(
            (httpPrefixHeader =>
              Trait.HttpPrefixHeadersTrait(httpPrefixHeader)
            )
          )
      | "smithy.api#xmlAttribute" => Ok(Trait.XmlAttributeTrait)
      | "smithy.api#externalDocumentation" =>
        [@ns.braces]
        {
          let documentation = value|>parseObject|>(field("Documentation"));
          let specification = value|>parseObject|>(field("Specification"));
          switch (documentation, specification) {
          | (Ok(link), _) =>
            Ok(link)
            |>parseString
            >>|(
                (link =>
                  Trait.ExternalDocumentationTrait(
                    Trait.DocumentationLink(link),
                  )
                )
              )
          | (_, Ok(link)) =>
            Ok(link)
            |>parseString
            >>|(
                (link =>
                  Trait.ExternalDocumentationTrait(
                    Trait.SpecificationLink(link),
                  )
                )
              )
          | (Error(x), Error(_)) => Error(x)
          };
        }

      | "smithy.api#eventPayload" => Ok(Trait.EventPayloadTrait)
      | "smithy.api#http" => Ok(Trait.HttpTrait)
      | "smithy.api#idempotent" => Ok(Trait.IdempotentTrait)
      | "smithy.api#readonly" => Ok(Trait.ReadonlyTrait)
      | "smithy.waiters#waitable" => Ok(Trait.WaitableTrait)
      | "smithy.api#endpoint" => Ok(Trait.EndpointTrait)
      | "smithy.api#auth" => Ok(Trait.AuthTrait)
      | "smithy.api#optionalAuth" => Ok(Trait.OptionalAuthTrait)
      | "smithy.api#suppress" => Ok(Trait.SuppressTrait)
      | "aws.auth#unsignedPayload" => Ok(Trait.AwsAuthUnsignedPayloadTrait)
      | "smithy.api#requiresLength" => Ok(Trait.RequiresLengthTrait)
      | "smithy.api#sparse" => Ok(Trait.SparseTrait)
      | "smithy.api#httpChecksumRequired" =>
        Ok(Trait.HttpChecksumRequiredTrait)
      | "aws.api#clientDiscoveredEndpoint" =>
        Ok(Trait.AwsApiClientDiscoveredEndpointTrait)
      | "aws.protocols#awsQueryError" =>
        Ok(Trait.AwsProtocolAwsQueryErrorTrait)
      | "aws.cloudformation#cfnExcludeProperty" =>
        Ok(Trait.AwsCloudFormationCfnExcludePropertyTrait)
      | "aws.cloudformation#cfnMutability" =>
        Ok(Trait.AwsCloudFormationCfnMutabilityTrait)
      | "aws.iam#requiredActions" => Ok(Trait.AwsIamRequiredActionsTrait)
      | "aws.api#dataPlane" => Ok(Trait.AwsApiDataPlaneTrait)
      | "aws.iam#defineConditionKeys" =>
        Ok(Trait.AwsIamDefineConditionKeysTrait)
      | "smithy.api#examples" => Ok(Trait.ExamplesTrait)
      | "aws.api#controlPlane" => Ok(Trait.AwsApiControlPlaneTrait)
      | "aws.iam#actionPermissionDescription" =>
        Ok(Trait.AwsIamActionPermissionDescriptionTrait)
      | "aws.iam#conditionKeys" => Ok(Trait.AwsIamConditionKeysTrait)
      | "aws.protocols#httpChecksum" =>
        Ok(Trait.AwsProtocolsHttpChecksumTrait)
      | "aws.customizations#s3UnwrappedXmlOutput" =>
        Ok(Trait.AwsCustomizationsS3UnwrappedXmlOutputTrait)
      | _ => raise(UnknownTrait(name))
      };
    traitValue;
  });

let parseListShape = shape =>
  [@ns.braces]
  {
    let target_ = shape|>(field("member"))|>extractTargetSpec;
    let traitParser = parseRecord(parseTrait);
    let traits_ =
      optional(shape|>(field("traits"))|>(traitParser));
    map2(target_, traits_, (target, traits) =>
      Shape.ListShape({target, traits})
    );
  };

let parseMember = (name, value) =>
  [@ns.braces]
  {
    let member = parseObject(value);
    let target_ = member|>(field("target"))|>parseString;
    let traits_ =
      optional(parseRecord(parseTrait, member|>(field("traits"))));
    map2(target_, traits_, (target, traits) =>
      [@ns.braces] Shape.{name, target, traits}
    );
  };
let parseMembers = value => [@ns.braces] parseRecord(parseMember, value);

let parseStructureShape = value =>
  [@ns.braces]
  {
    let members = value|>(field("members"))|>parseMembers;
    let traits =
      optional(value|>(field("traits"))|>(parseRecord(parseTrait)));
    map2(members, traits, (members, traits) =>
      Shape.StructureShape({members, traits})
    );
  };

let parseOperationShape = shape =>
  [@ns.braces]
  {
    let inputTarget = optional(shape|>(field("input"))|>extractTargetSpec);
    let outputTarget = optional(shape|>(field("output"))|>extractTargetSpec);
    let errors =
      optional(shape|>(field("errors"))|>(parseArray(extractTargetSpec)));
    let traits =
      optional(shape|>(field("traits"))|>(parseRecord(parseTrait)));
    let documentation =
      optional(
        shape
        |>(field("traits"))
        |>parseObject
        |>(field("smithy.api#documentation"))
        |>parseString,
      );
    map5(
      inputTarget,
      outputTarget,
      errors,
      documentation,
      traits,
      (inputValue, outputValue, errorsValue, documentationValue, traits) =>
      Shape.OperationShape({
        input: inputValue,
        output: outputValue,
        errors: errorsValue,
        documentation: documentationValue,
        traits,
      })
    );
  };

let parseServiceShape = shapeDict =>
  [@ns.braces]
  {
    let version_ = shapeDict|>(field("version"))|>parseString;
    let operations_ =
      optional(shapeDict|>(field("operations")))
      |>(
          mapOptional(operations => parseArray(extractTargetSpec, operations))
        );
    let traits_ =
      optional(shapeDict|>(field("traits")))
      |>(mapOptional(traits => traits|>(parseRecord(parseTrait))));
    map3(version_, operations_, traits_, (version, operations, traits) =>
      Shape.ServiceShape({version, operations, traits})
    );
  };

let parseStringShape = shapeDict =>
  [@ns.braces]
  {
    let traits_ =
      shapeDict
      |>(field("traits"))
      |>optional
      |>(mapOptional(traits => parseRecord(parseTrait, traits)));
    Result.map(traits_, ~f=traits => Shape.StringShape({traits: traits}));
  };

let parseMapKey = value =>
  [@ns.braces]
  {
    let mapValue = value|>parseObject;
    let target_ = mapValue|>(field("target"))|>parseString;
    let traits_ =
      optional(mapValue|>(field("traits")))
      |>(mapOptional(traits => parseRecord(parseTrait,traits)));
    map2(target_, traits_, (target, traits) =>
      [@ns.braces] Shape.{target, traits}
    );
  };

let parseMapShape = shapeDict =>
  [@ns.braces]
  {
    let key_ = parseMapKey(shapeDict|>(field("key")));
    let value_ = parseMapKey(shapeDict|>(field("value")));
    let traits_ =
      optional(shapeDict|>(field("traits")))
      |>(mapOptional(traits => traits|>(parseRecord(parseTrait))));
    map3(key_, value_, traits_, (key, value, traits) =>
      Shape.MapShape({mapKey: key, mapValue: value, traits})
    );
  };

let parseUnionShape = value =>
  [@ns.braces]
  {
    let members = value|>(field("members"))|>parseMembers;
    let traits =
      optional(value|>(field("traits"))|>(parseRecord(parseTrait)));
    map2(members, traits, (members, traits) =>
      Shape.UnionShape({members, traits})
    );
  };

let parsePrimitive = shapeDict =>
  [@ns.braces]
  {
    let traits_ =
      optional(shapeDict|>(field("traits")))
      |>(mapOptional(traits => traits|>(parseRecord(parseTrait))));
    Result.map(traits_, ~f=(traits) =>
      ({traits: traits}: Shape.primitiveShapeDetails)
    );
  };

/* TODO: figure out if this is important for wrapper, or only for SDK codegen*/
let parseResourceShape = _ => Ok(Shape.ResourceShape);

let parseSetShape = shapeDict =>
  [@ns.braces]
  {
    let target =
      shapeDict
      |>(field("member"))
      |>parseObject
      |>(field("target"))
      |>parseString;
    let traits =
      optional(shapeDict|>(field("traits")))
      |>(mapOptional(traits => traits|>(parseRecord(parseTrait))));
    map2(target, traits, (target, traits) =>
      Shape.SetShape({target, traits})
    );
  };

let parseTimestampShape = shapeDict =>
  [@ns.braces]
  {
    let traits_ =
      optional(shapeDict|>(field("traits")))
      |>(mapOptional(traits => traits|>(parseRecord(parseTrait))));
    Result.map(traits_, ~f=traits => Shape.TimestampShape({traits: traits}));
  };

let parseShape = (name, shape) =>
  [@ns.braces]
  Result.({
    let shapeDict = parseObject(shape);
    let typeDiscriminator = shapeDict|>(field("type"))|>parseString;
    Result.bind(typeDiscriminator, ~f=typeValue =>
      {
        let descriptor_ =
          switch (typeValue) {
          | "list" => parseListShape(shapeDict)
          | "operation" => parseOperationShape(shapeDict)
          | "structure" => parseStructureShape(shapeDict)
          | "service" => parseServiceShape(shapeDict)
          | "blob" =>
            parsePrimitive(shapeDict)
            >>|(primitive => Shape.BlobShape(primitive))
          | "boolean" =>
            parsePrimitive(shapeDict)
            >>|(primitive => Shape.BooleanShape(primitive))
          | "integer" =>
            parsePrimitive(shapeDict)
            >>|((primitive => Shape.IntegerShape(primitive)))
          | "string" => parseStringShape(shapeDict)
          | "map" => parseMapShape(shapeDict)
          | "union" => parseUnionShape(shapeDict)
          | "resource" => parseResourceShape(shapeDict)
          | "timestamp" => parseTimestampShape(shapeDict)
          | "long" =>
            parsePrimitive(shapeDict)
            >>|(primitive => Shape.LongShape(primitive))
          | "double" =>
            parsePrimitive(shapeDict)
            >>|(primitive => Shape.DoubleShape(primitive))
          | "float" =>
            parsePrimitive(shapeDict)
            >>|((primitive => Shape.FloatShape(primitive)))
          | "set" => parseSetShape(shapeDict)
          | _ => Error(CustomError({js|unknown shape type |js} ++ typeValue))
          };
        Result.map(descriptor_, ~f=descriptor => [@ns.braces] Shape.{name, descriptor});
      }
    );
  });

let parseShapes = shapesModel => parseRecord(parseShape, shapesModel);
let parseModel = baseModel =>
  baseModel|>parseObject|>(field("shapes"))|>parseShapes;
