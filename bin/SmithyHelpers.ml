open Base
open Parselib.Ast

let printProtocol (traits : Trait.t list option) =
  traits |> Option.value ~default:[]
  |> List.find_map ~f:(function
       | Trait.AwsProtocolAwsJson1_0Trait -> Some "AWS JSON 1.0"
       | Trait.AwsProtocolAwsJson1_1Trait -> Some "AWS JSON 1.1"
       | Trait.AwsProtocolRestJson1Trait -> Some "AWS REST JSON 1"
       | Trait.AwsProtocolRestXmlTrait -> Some "AWS REST XML"
       | Trait.AwsProtocolAwsQueryTrait -> Some "AWS Query"
       | Trait.AwsProtocolEc2QueryTrait -> Some "EC2 Query"
       | _ -> None)
  |> Option.value ~default:"<unknown>"

let extractTrait extractor traits =
  List.find_map_exn (traits |> Option.value ~default:[]) ~f:extractor

let extractServiceTrait = extractTrait (function Trait.ServiceTrait x -> Some x | _ -> None)

let printServiceTrait traits =
  let Trait.{ sdkId; arnNamespace; endpointPrefix; _ } = extractServiceTrait traits in
  Fmt.str "{ Sdk %s Namespace %s endpointPrefix %s }" sdkId
    (Option.value ~default:"<>" arnNamespace)
    (Option.value endpointPrefix ~default:"<>")

let printOperations operations =
  operations
  |> List.filter_map ~f:(function
       | Shape.{ name; descriptor = Shape.OperationShape { input; output; _ } } ->
           Some
             (Printf.sprintf "operation %s = %s => %s" name
                (Option.value input ~default:"()")
                (Option.value output ~default:"void"))
       | _ -> None)
  |> List.iter ~f:(fun str -> Stdio.print_endline str)

let printServiceDetails shapes =
  List.iter shapes ~f:(fun Shape.{ descriptor; _ } ->
      match descriptor with
      | Shape.ServiceShape details ->
          Stdio.printf "Service: version=%s\n, protocol=%s, %s" details.version
            (printProtocol details.traits)
            (printServiceTrait details.traits)
      | _ -> ())
