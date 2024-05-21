Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let optional_empty_list = Option.value ~default:[]

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Aws_SmSdk_Lib in
          let config =
            Aws.Config.
              {
                resolveRegion = (fun () -> "ap-southeast-2");
                resolveAuth = (fun () -> Aws.Auth.fromProfile env ());
              }
          in
          let context = Aws.Context.make ~sw ~config env () in
          let ( let+ ) res map = Result.map map res in

          match
            let open Aws_SmSdk_Client_DynamoDB in
            let table = "create-table-test" in
            let+ { table_names; _ } =
              Operations.ListTables.request context
                { limit = Some 10; exclusive_start_table_name = None }
            in
            Logs.info (fun m ->
                m "SUCCESS: table list %a" (Fmt.list Fmt.string) (table_names |> optional_empty_list));
            let table_exists =
              List.exists
                (fun table_name -> String.equal table_name table)
                (table_names |> optional_empty_list)
            in
            let+ ctr =
              if not table_exists then
                Operations.CreateTable.request context
                  Types.
                    {
                      table_name = table;
                      resource_policy = None;
                      deletion_protection_enabled = None;
                      table_class = Some STANDARD;
                      sse_specification = None;
                      tags = Some [];
                      billing_mode = Some Types.PAY_PER_REQUEST;
                      stream_specification = None;
                      provisioned_throughput = None;
                      global_secondary_indexes = None;
                      local_secondary_indexes = None;
                      key_schema =
                        [
                          { key_type = HASH; attribute_name = "pk" };
                          { key_type = RANGE; attribute_name = "sk" };
                        ];
                      attribute_definitions =
                        [
                          { attribute_name = "pk"; attribute_type = S };
                          { attribute_name = "sk"; attribute_type = S };
                        ];
                    }
              else Ok { table_description = None }
            in
            Logs.info (fun m ->
                m "table exists Success %s!"
                  (ctr.table_description
                  |> Option.map (fun (x : Types.table_description) -> Types.(x.table_id))
                  |> Option.join
                  |> Option.value ~default:"<unknown id>"))
          with
          | Ok _ -> ()
          | Error (`HttpError e) ->
              Logs.err (fun m -> m "HTTP Error %a" Aws_SmSdk_Lib.Http.pp_http_failure e)
          | Error (`JsonParseError e) ->
              Logs.err (fun m ->
                  m "Parse Error! %s" (AwsSdkLib.Json.DeserializeHelpers.jsonParseErrorToString e))
          | Error _ -> Logs.err (fun m -> m "Another error")))
