open Types
val make_stream_record :
  ?stream_view_type:stream_view_type ->
  ?size_bytes:int ->
  ?sequence_number:string ->
  ?old_image:(string * attribute_value) list ->
  ?new_image:(string * attribute_value) list ->
  ?keys:(string * attribute_value) list ->
  ?approximate_creation_date_time:float ->
  unit -> stream_record

val make_stream :
  ?stream_label:string -> ?table_name:string -> ?stream_arn:string -> unit
-> stream

val make_key_schema_element :
  key_type:key_type -> attribute_name:string -> unit
-> key_schema_element

val make_sequence_number_range :
  ?ending_sequence_number:string -> ?starting_sequence_number:string -> unit
-> sequence_number_range

val make_shard :
  ?parent_shard_id:string ->
  ?sequence_number_range:sequence_number_range ->
  ?shard_id:string ->
  unit -> shard

val make_stream_description :
  ?last_evaluated_shard_id:string ->
  ?shards:shard list ->
  ?key_schema:key_schema_element list ->
  ?table_name:string ->
  ?creation_request_date_time:float ->
  ?stream_view_type:stream_view_type ->
  ?stream_status:stream_status ->
  ?stream_label:string ->
  ?stream_arn:string ->
  unit -> stream_description

val make_identity : ?type_:string -> ?principal_id:string -> unit
-> identity

val make_record :
  ?user_identity:identity ->
  ?dynamodb:stream_record ->
  ?aws_region:string ->
  ?event_source:string ->
  ?event_version:string ->
  ?event_name:operation_type ->
  ?event_i_d:string ->
  unit -> record

val make_list_streams_output :
  ?last_evaluated_stream_arn:string -> ?streams:stream list -> unit
-> list_streams_output

val make_list_streams_input :
  ?exclusive_start_stream_arn:string ->
  ?limit:int ->
  ?table_name:string ->
  unit -> list_streams_input

val make_get_shard_iterator_output : ?shard_iterator:string -> unit
-> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?sequence_number:string ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:string ->
  stream_arn:string ->
  unit -> get_shard_iterator_input

val make_get_records_output :
  ?next_shard_iterator:string -> ?records:record list -> unit
-> get_records_output

val make_get_records_input : ?limit:int -> shard_iterator:string -> unit
-> get_records_input

val make_describe_stream_output :
  ?stream_description:stream_description -> unit
-> describe_stream_output

val make_describe_stream_input :
  ?exclusive_start_shard_id:string -> ?limit:int -> stream_arn:string -> unit
-> describe_stream_input

