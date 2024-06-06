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
          let ( let+ ) res map = Result.bind res map in

          match
            let open Aws_SmSdk_Client_DynamoDB in
            let table = "create-table-test" in
            let+ { table_names; _ } = ListTables.request context (make_list_tables_input ()) in
            Logs.info (fun m ->
                m "SUCCESS: table list %a" (Fmt.list Fmt.string) (table_names |> optional_empty_list));
            let table_exists =
              List.exists
                (fun table_name -> String.equal table_name table)
                (table_names |> optional_empty_list)
            in
            let+ ctr =
              if not table_exists then
                CreateTable.request context
                  (make_create_table_input ~table_name:table ~table_class:STANDARD
                     ~billing_mode:PAY_PER_REQUEST
                     ~key_schema:
                       [
                         { key_type = HASH; attribute_name = "pk" };
                         { key_type = RANGE; attribute_name = "sk" };
                       ]
                     ~attribute_definitions:
                       [
                         { attribute_name = "pk"; attribute_type = S };
                         { attribute_name = "sk"; attribute_type = S };
                       ]
                     ())
              else Ok { table_description = None }
            in
            Logs.info (fun m ->
                m "table exists Success %s!"
                  (ctr.table_description
                  |> Option.map (fun (x : table_description) -> x.table_id)
                  |> Option.join
                  |> Option.value ~default:"<unknown id>"));
            let+ ctr =
              PutItem.request context
                (make_put_item_input ~table_name:table ~return_values:ALL_OLD
                   ~item:[ ("pk", S "item1"); ("sk", S "item1") ]
                   ())
            in
            Ok ()
          with
          | Ok _ -> ()
          | Error (`HttpError e) ->
              Logs.err (fun m -> m "HTTP Error %a" Aws_SmSdk_Lib.Http.pp_http_failure e)
          | Error (`JsonParseError e) ->
              Logs.err (fun m ->
                  m "Parse Error! %s" (AwsSdkLib.Json.DeserializeHelpers.jsonParseErrorToString e))
          | Error _ -> Logs.err (fun m -> m "Another error")))
