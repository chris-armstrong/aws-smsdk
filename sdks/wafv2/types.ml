open Smaws_Lib
let service =
  Service.{
    namespace = "wafv2";
    endpointPrefix = "wafv2";
    version = "2019-07-29";
    protocol = AwsJson_1_1
  };

[@@ocaml.doc {| 
    Inspect one of the headers in the web request, identified by name, for example, [User-Agent] or [Referer]. The name isn't case sensitive.
    
     You can filter and inspect all headers with the [FieldToMatch] setting [Headers].
     
      This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
      
       Example JSON: ["SingleHeader": { "Name": "haystack" }]
        |}]
type single_header = {
  name: string;
  (** 
    The name of the query header to inspect.
     *)

}

[@@ocaml.doc {| 
    Inspect one query argument in the web request, identified by name, for example {i UserName} or {i SalesRegion}. The name isn't case sensitive.
    
     This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
     
      Example JSON: ["SingleQueryArgument": { "Name": "myArgument" }]
       |}]
type single_query_argument = {
  name: string;
  (** 
    The name of the query argument to inspect.
     *)

}

[@@ocaml.doc {| 
    Inspect all query arguments of the web request.
    
     This is used in the [FieldToMatch] specification for some web request component types.
     
      JSON specification: ["AllQueryArguments": {}]
       |}]
type all_query_arguments = unit

[@@ocaml.doc {| 
    Inspect the path component of the URI of the web request. This is the part of the web request that identifies a resource. For example, [/images/daily-ad.jpg].
    
     This is used in the [FieldToMatch] specification for some web request component types.
     
      JSON specification: ["UriPath": {}]
       |}]
type uri_path = unit

[@@ocaml.doc {| 
    Inspect the query string of the web request. This is the part of a URL that appears after a [?] character, if any.
    
     This is used in the [FieldToMatch] specification for some web request component types.
     
      JSON specification: ["QueryString": {}]
       |}]
type query_string = unit

type oversize_handling = | NO_MATCH
  | MATCH
  | CONTINUE

(** 
    Inspect the body of the web request. The body immediately follows the request headers.
    
     This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
      *)
type body = {
  oversize_handling: oversize_handling option;
  (** 
    What WAF should do if the body is larger than WAF can inspect.
    
     WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection.
     
      {ul
           {- For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
              
              }
            {- For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees.
               
               }
           
      }
       The options for oversize handling are the following:
       
        {ul
             {- [CONTINUE] - Inspect the available body contents normally, according to the rule inspection criteria.
                
                }
              {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
                 
                 }
              {- [NO_MATCH] - Treat the web request as not matching the rule statement.
                 
                 }
             
      }
       You can combine the [MATCH] or [NO_MATCH] settings for oversize handling with your rule and web ACL action settings, so that you block any request whose body is over the limit.
       
        Default: [CONTINUE]
         *)

}

[@@ocaml.doc {| 
    Inspect the HTTP method of the web request. The method indicates the type of operation that the request is asking the origin to perform.
    
     This is used in the [FieldToMatch] specification for some web request component types.
     
      JSON specification: ["Method": {}]
       |}]
type method_ = unit

[@@ocaml.doc {| 
    Inspect all of the elements that WAF has parsed and extracted from the web request component that you've identified in your [FieldToMatch] specifications.
    
     This is used in the [FieldToMatch] specification for some web request component types.
     
      JSON specification: ["All": {}]
       |}]
type all = unit

(** 
    The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against the rule inspection criteria. This is used with the [FieldToMatch] option [JsonBody].
     *)
type json_match_pattern = {
  included_paths: string list option;
  [@ocaml.doc {| 
    Match only the specified include paths. See also [MatchScope] in [JsonBody].
    
     Provide the include paths using JSON Pointer syntax. For example, ["IncludedPaths":
            \["/dogs/0/name", "/dogs/1/name"\]]. For information about this syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
     
      You must specify either this setting or the [All] setting, but not both.
      
       Don't use this option to include all paths. Instead, use the [All] setting.
       
        |}]

  all: all option;
  (** 
    Match all of the elements. See also [MatchScope] in [JsonBody].
    
     You must specify either this setting or the [IncludedPaths] setting, but not both.
      *)

}

type json_match_scope = | VALUE
  | KEY
  | ALL

type body_parsing_fallback_behavior = | EVALUATE_AS_STRING
  | NO_MATCH
  | MATCH

[@@ocaml.doc {| 
    Inspect the body of the web request as JSON. The body immediately follows the request headers.
    
     This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
     
      Use the specifications in this object to indicate which parts of the JSON body to inspect using the rule's inspection criteria. WAF inspects only the parts of the JSON that result from the matches that you indicate.
      
       Example JSON: ["JsonBody": { "MatchPattern": { "All": {} }, "MatchScope": "ALL"
            }]
        |}]
type json_body = {
  oversize_handling: oversize_handling option;
  (** 
    What WAF should do if the body is larger than WAF can inspect.
    
     WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection.
     
      {ul
           {- For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
              
              }
            {- For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees.
               
               }
           
      }
       The options for oversize handling are the following:
       
        {ul
             {- [CONTINUE] - Inspect the available body contents normally, according to the rule inspection criteria.
                
                }
              {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
                 
                 }
              {- [NO_MATCH] - Treat the web request as not matching the rule statement.
                 
                 }
             
      }
       You can combine the [MATCH] or [NO_MATCH] settings for oversize handling with your rule and web ACL action settings, so that you block any request whose body is over the limit.
       
        Default: [CONTINUE]
         *)

  invalid_fallback_behavior: body_parsing_fallback_behavior option;
  [@ocaml.doc {| 
    What WAF should do if it fails to completely parse the JSON body. The options are the following:
    
     {ul
          {- [EVALUATE_AS_STRING] - Inspect the body as plain text. WAF applies the text transformations and inspection criteria that you defined for the JSON inspection to the body text string.
             
             }
           {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
              
              }
           {- [NO_MATCH] - Treat the web request as not matching the rule statement.
              
              }
          
      }
       If you don't provide this setting, WAF parses and evaluates the content only up to the first parsing failure that it encounters.
       
        WAF does its best to parse the entire JSON body, but might be forced to stop for reasons such as invalid characters, duplicate keys, truncation, and any content whose root node isn't an object or an array.
        
         WAF parses the JSON in the following examples as two valid key, value pairs:
         
          {ul
               {- Missing comma: [{"key1":"value1""key2":"value2"}]
                  
                  }
                {- Missing colon: [{"key1":"value1","key2""value2"}]
                   
                   }
                {- Extra colons: [{"key1"::"value1","key2""value2"}]
                   
                   }
               
      }
       |}]

  match_scope: json_match_scope;
  (** 
    The parts of the JSON to match against using the [MatchPattern]. If you specify [ALL], WAF matches against keys and values.
    
     [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values.
      *)

  match_pattern: json_match_pattern;
  (** 
    The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against the rule inspection criteria.
     *)

}

[@@ocaml.doc {| 
    The filter to use to identify the subset of headers to inspect in a web request.
    
     You must specify exactly one setting: either [All], [IncludedHeaders], or [ExcludedHeaders].
     
      Example JSON: ["MatchPattern": { "ExcludedHeaders": \[ "KeyToExclude1", "KeyToExclude2" \] }]
       |}]
type header_match_pattern = {
  excluded_headers: string list option;
  (** 
    Inspect only the headers whose keys don't match any of the strings specified here.
     *)

  included_headers: string list option;
  (** 
    Inspect only the headers that have a key that matches one of the strings specified here.
     *)

  all: all option;
  (** 
    Inspect all headers.
     *)

}

type map_match_scope = | VALUE
  | KEY
  | ALL

[@@ocaml.doc {| 
    Inspect all headers in the web request. You can specify the parts of the headers to inspect and you can narrow the set of headers to inspect by including or excluding specific keys.
    
     This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
     
      If you want to inspect just the value of a single header, use the [SingleHeader] [FieldToMatch] setting instead.
      
       Example JSON: ["Headers": { "MatchPattern": { "All": {} }, "MatchScope": "KEY",
            "OversizeHandling": "MATCH" }]
        |}]
type headers = {
  oversize_handling: oversize_handling;
  (** 
    What WAF should do if the headers of the request are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200 headers and at most 8 KB of header contents to WAF.
    
     The options for oversize handling are the following:
     
      {ul
           {- [CONTINUE] - Inspect the available headers normally, according to the rule inspection criteria.
              
              }
            {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
               
               }
            {- [NO_MATCH] - Treat the web request as not matching the rule statement.
               
               }
           
      }
       *)

  match_scope: map_match_scope;
  (** 
    The parts of the headers to match with the rule inspection criteria. If you specify [ALL], WAF inspects both keys and values.
    
     [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values.
      *)

  match_pattern: header_match_pattern;
  [@ocaml.doc {| 
    The filter to use to identify the subset of headers to inspect in a web request.
    
     You must specify exactly one setting: either [All], [IncludedHeaders], or [ExcludedHeaders].
     
      Example JSON: ["MatchPattern": { "ExcludedHeaders": \[ "KeyToExclude1", "KeyToExclude2" \] }]
       |}]

}

[@@ocaml.doc {| 
    The filter to use to identify the subset of cookies to inspect in a web request.
    
     You must specify exactly one setting: either [All], [IncludedCookies], or [ExcludedCookies].
     
      Example JSON: ["MatchPattern": { "IncludedCookies": \[ "session-id-time", "session-id" \] }]
       |}]
type cookie_match_pattern = {
  excluded_cookies: string list option;
  (** 
    Inspect only the cookies whose keys don't match any of the strings specified here.
     *)

  included_cookies: string list option;
  (** 
    Inspect only the cookies that have a key that matches one of the strings specified here.
     *)

  all: all option;
  (** 
    Inspect all cookies.
     *)

}

[@@ocaml.doc {| 
    Inspect the cookies in the web request. You can specify the parts of the cookies to inspect and you can narrow the set of cookies to inspect by including or excluding specific keys.
    
     This is used to indicate the web request component to inspect, in the [FieldToMatch] specification.
     
      Example JSON: ["Cookies": { "MatchPattern": { "All": {} }, "MatchScope": "KEY",
            "OversizeHandling": "MATCH" }]
       |}]
type cookies = {
  oversize_handling: oversize_handling;
  (** 
    What WAF should do if the cookies of the request are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request cookies when they exceed 8 KB (8192 bytes) or 200 total cookies. The underlying host service forwards a maximum of 200 cookies and at most 8 KB of cookie contents to WAF.
    
     The options for oversize handling are the following:
     
      {ul
           {- [CONTINUE] - Inspect the available cookies normally, according to the rule inspection criteria.
              
              }
            {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
               
               }
            {- [NO_MATCH] - Treat the web request as not matching the rule statement.
               
               }
           
      }
       *)

  match_scope: map_match_scope;
  (** 
    The parts of the cookies to inspect with the rule inspection criteria. If you specify [ALL], WAF inspects both keys and values.
    
     [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values.
      *)

  match_pattern: cookie_match_pattern;
  [@ocaml.doc {| 
    The filter to use to identify the subset of cookies to inspect in a web request.
    
     You must specify exactly one setting: either [All], [IncludedCookies], or [ExcludedCookies].
     
      Example JSON: ["MatchPattern": { "IncludedCookies": \[ "session-id-time", "session-id" \] }]
       |}]

}

(** 
    Inspect a string containing the list of the request's header names, ordered as they appear in the web request that WAF receives for inspection. WAF generates the string and then uses that as the field to match component in its inspection. WAF separates the header names in the string using colons and no added spaces, for example [host:user-agent:accept:authorization:referer].
     *)
type header_order = {
  oversize_handling: oversize_handling;
  (** 
    What WAF should do if the headers of the request are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200 headers and at most 8 KB of header contents to WAF.
    
     The options for oversize handling are the following:
     
      {ul
           {- [CONTINUE] - Inspect the available headers normally, according to the rule inspection criteria.
              
              }
            {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
               
               }
            {- [NO_MATCH] - Treat the web request as not matching the rule statement.
               
               }
           
      }
       *)

}

type fallback_behavior = | NO_MATCH
  | MATCH

(** 
    Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.
    
     You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY].
     
      You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}.
      
       Provide the JA3 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.
        *)
type ja3_fingerprint = {
  fallback_behavior: fallback_behavior;
  (** 
    The match status to assign to the web request if the request doesn't have a JA3 fingerprint.
    
     You can specify the following fallback behaviors:
     
      {ul
           {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
              
              }
            {- [NO_MATCH] - Treat the web request as not matching the rule statement.
               
               }
           
      }
       *)

}

[@@ocaml.doc {| 
    Specifies a web request component to be used in a rule match statement or in a logging configuration.
    
     {ul
          {- In a rule statement, this is the part of the web request that you want WAF to inspect. Include the single [FieldToMatch] type that you want to inspect, with additional specifications as needed, according to the type. You specify a single request component in [FieldToMatch] for each rule statement that requires it. To inspect more than one component of the web request, create a separate rule statement for each component.
             
              Example JSON for a [QueryString] field to match:
              
               [ "FieldToMatch": { "QueryString": {} }]
               
                Example JSON for a [Method] field to match specification:
                
                 [ "FieldToMatch": { "Method": { "Name": "DELETE" } }]
                 
                 }
           {- In a logging configuration, this is used in the [RedactedFields] property to specify a field to redact from the logging records. For this use case, note the following:
              
               {ul
                    {- Even though all [FieldToMatch] settings are available, the only valid settings for field redaction are [UriPath], [QueryString], [SingleHeader], and [Method].
                       
                       }
                     {- In this documentation, the descriptions of the individual fields talk about specifying the web request component to inspect, but for field redaction, you are specifying the component type to redact from the logs.
                        
                        }
                     {- If you have request sampling enabled, the redacted fields configuration for logging has no impact on sampling. The only way to exclude fields from request sampling is by disabling sampling in the web ACL visibility configuration.
                        
                        }
                    
            }
            }
          
      }
       |}]
type field_to_match = {
  ja3_fingerprint: ja3_fingerprint option;
  (** 
    Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.
    
     You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY].
     
      You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}.
      
       Provide the JA3 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.
        *)

  header_order: header_order option;
  (** 
    Inspect a string containing the list of the request's header names, ordered as they appear in the web request that WAF receives for inspection. WAF generates the string and then uses that as the field to match component in its inspection. WAF separates the header names in the string using colons and no added spaces, for example [host:user-agent:accept:authorization:referer].
     *)

  cookies: cookies option;
  (** 
    Inspect the request cookies. You must configure scope and pattern matching filters in the [Cookies] object, to define the set of cookies and the parts of the cookies that WAF inspects.
    
     Only the first 8 KB (8192 bytes) of a request's cookies and only the first 200 cookies are forwarded to WAF for inspection by the underlying host service. You must configure how to handle any oversize cookie content in the [Cookies] object. WAF applies the pattern matching filters to the cookies that it receives from the underlying host service.
      *)

  headers: headers option;
  (** 
    Inspect the request headers. You must configure scope and pattern matching filters in the [Headers] object, to define the set of headers to and the parts of the headers that WAF inspects.
    
     Only the first 8 KB (8192 bytes) of a request's headers and only the first 200 headers are forwarded to WAF for inspection by the underlying host service. You must configure how to handle any oversize header content in the [Headers] object. WAF applies the pattern matching filters to the headers that it receives from the underlying host service.
      *)

  json_body: json_body option;
  (** 
    Inspect the request body as JSON. The request body immediately follows the request headers. This is the part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form.
    
     WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection.
     
      {ul
           {- For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
              
              }
            {- For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees.
               
               }
           
      }
       For information about how to handle oversized request bodies, see the [JsonBody] object configuration.
        *)

  method_: method_ option;
  (** 
    Inspect the HTTP method. The method indicates the type of operation that the request is asking the origin to perform.
     *)

  body: body option;
  (** 
    Inspect the request body as plain text. The request body immediately follows the request headers. This is the part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form.
    
     WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection.
     
      {ul
           {- For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
              
              }
            {- For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees.
               
               }
           
      }
       For information about how to handle oversized request bodies, see the [Body] object configuration.
        *)

  query_string: query_string option;
  (** 
    Inspect the query string. This is the part of a URL that appears after a [?] character, if any.
     *)

  uri_path: uri_path option;
  (** 
    Inspect the request URI path. This is the part of the web request that identifies a resource, for example, [/images/daily-ad.jpg].
     *)

  all_query_arguments: all_query_arguments option;
  (** 
    Inspect all query arguments.
     *)

  single_query_argument: single_query_argument option;
  [@ocaml.doc {| 
    Inspect a single query argument. Provide the name of the query argument to inspect, such as {i UserName} or {i SalesRegion}. The name can be up to 30 characters long and isn't case sensitive.
    
     Example JSON: ["SingleQueryArgument": { "Name": "myArgument" }]
      |}]

  single_header: single_header option;
  [@ocaml.doc {| 
    Inspect a single header. Provide the name of the header to inspect, for example, [User-Agent] or [Referer]. This setting isn't case sensitive.
    
     Example JSON: ["SingleHeader": { "Name": "haystack" }]
     
      Alternately, you can filter and inspect all headers with the [Headers] [FieldToMatch] setting.
       |}]

}

type text_transformation_type = | UTF8_TO_UNICODE
  | URL_DECODE_UNI
  | BASE64_DECODE_EXT
  | REPLACE_NULLS
  | REMOVE_NULLS
  | NORMALIZE_PATH_WIN
  | NORMALIZE_PATH
  | JS_DECODE
  | CSS_DECODE
  | SQL_HEX_DECODE
  | ESCAPE_SEQ_DECODE
  | REPLACE_COMMENTS
  | MD5
  | HEX_DECODE
  | BASE64_DECODE
  | URL_DECODE
  | CMD_LINE
  | LOWERCASE
  | HTML_ENTITY_DECODE
  | COMPRESS_WHITE_SPACE
  | NONE

(** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection.
     *)
type text_transformation = {
  type_: text_transformation_type;
  (** 
    For detailed descriptions of each of the transformation types, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-transformation.html}Text transformations} in the {i WAF Developer Guide}.
     *)

  priority: int;
  (** 
    Sets the relative processing order for multiple transformations. WAF processes all transformations, from lowest priority to highest, before inspecting the transformed content. The priorities don't need to be consecutive, but they must all be different.
     *)

}

(** 
    A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into other legitimate web browsers.
     *)
type xss_match_statement = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

}

(** 
    High-level information about a [WebACL], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [WebACL], and the ARN, that you provide to operations like [AssociateWebACL].
     *)
type web_acl_summary = {
  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  description: string option;
  (** 
    A description of the web ACL that helps with identification.
     *)

  id: string option;
  (** 
    The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string option;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

(** 
    A custom header for custom request and response handling. This is used in [CustomResponse] and [CustomRequestHandling].
     *)
type custom_http_header = {
  value: string;
  (** 
    The value of the custom header.
     *)

  name: string;
  (** 
    The name of the custom header.
    
     For custom request header insertion, when WAF inserts the header into the request, it prefixes this name [x-amzn-waf-], to avoid confusion with the headers that are already in the request. For example, for the header name [sample], WAF inserts the header [x-amzn-waf-sample].
      *)

}

(** 
    A custom response to send to the client. You can define a custom response for rule actions and default web ACL actions that are set to [BlockAction].
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)
type custom_response = {
  response_headers: custom_http_header list option;
  (** 
    The HTTP headers to use in the response. You can specify any header name except for [content-type]. Duplicate header names are not allowed.
    
     For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
      *)

  custom_response_body_key: string option;
  (** 
    References the response body that you want WAF to return to the web request client. You can define a custom response for a rule action or a default web ACL action that is set to block. To do this, you first define the response body key and value in the [CustomResponseBodies] setting for the [WebACL] or [RuleGroup] where you want to use it. Then, in the rule action or web ACL default action [BlockAction] setting, you reference the response body using this key.
     *)

  response_code: int;
  (** 
    The HTTP status code to return to the client.
    
     For a list of status codes that you can use in your custom responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/customizing-the-response-status-codes.html}Supported status codes for custom response} in the {i WAF Developer Guide}.
      *)

}

(** 
    Specifies that WAF should block the request and optionally defines additional custom handling for the response to the web request.
    
     This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction].
      *)
type block_action = {
  custom_response: custom_response option;
  (** 
    Defines a custom response for the web request.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)

}

(** 
    Custom request handling behavior that inserts custom headers into a web request. You can add custom request handling for WAF to use when the rule action doesn't block the request. For example, [CaptchaAction] for requests with valid t okens, and [AllowAction].
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)
type custom_request_handling = {
  insert_headers: custom_http_header list;
  (** 
    The HTTP headers to insert into the request. Duplicate header names are not allowed.
    
     For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
      *)

}

(** 
    Specifies that WAF should allow the request and optionally defines additional custom handling for the request.
    
     This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction].
      *)
type allow_action = {
  custom_request_handling: custom_request_handling option;
  (** 
    Defines custom handling for the web request.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)

}

(** 
    In a [WebACL], this is the action that you want WAF to perform when a web request doesn't match any of the rules in the [WebACL]. The default action must be a terminating action.
     *)
type default_action = {
  allow: allow_action option;
  (** 
    Specifies that WAF should allow requests by default.
     *)

  block: block_action option;
  (** 
    Specifies that WAF should block requests by default.
     *)

}

type positional_constraint = | CONTAINS_WORD
  | CONTAINS
  | ENDS_WITH
  | STARTS_WITH
  | EXACTLY

(** 
    A rule statement that defines a string match search for WAF to apply to web requests. The byte match statement provides the bytes to search for, the location in requests that you want WAF to search, and other settings. The bytes to search for are typically a string that corresponds with ASCII characters. In the WAF console and the developer guide, this is called a string match statement.
     *)
type byte_match_statement = {
  positional_constraint: positional_constraint;
  (** 
    The area within the portion of the web request that you want WAF to search for [SearchString]. Valid values include the following:
    
     {b CONTAINS}
     
      The specified part of the web request must include the value of [SearchString], but the location doesn't matter.
      
       {b CONTAINS_WORD}
       
        The specified part of the web request must include the value of [SearchString], and [SearchString] must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition, [SearchString] must be a word, which means that both of the following are true:
        
         {ul
              {- [SearchString] is at the beginning of the specified part of the web request or is preceded by a character other than an alphanumeric character or underscore (_). Examples include the value of a header and [;BadBot].
                 
                 }
               {- [SearchString] is at the end of the specified part of the web request or is followed by a character other than an alphanumeric character or underscore (_), for example, [BadBot;] and [-BadBot;].
                  
                  }
              
      }
       {b EXACTLY}
       
        The value of the specified part of the web request must exactly match the value of [SearchString].
        
         {b STARTS_WITH}
         
          The value of [SearchString] must appear at the beginning of the specified part of the web request.
          
           {b ENDS_WITH}
           
            The value of [SearchString] must appear at the end of the specified part of the web request.
             *)

  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

  search_string: bytes;
  (** 
    A string value that you want WAF to search for. WAF searches only in the part of web requests that you designate for inspection in [FieldToMatch]. The maximum length of the value is 200 bytes.
    
     Valid values depend on the component that you specify for inspection in [FieldToMatch]:
     
      {ul
           {- [Method]: The HTTP method that you want WAF to search for. This indicates the type of operation specified in the request.
              
              }
            {- [UriPath]: The value that you want WAF to search for in the URI path, for example, [/images/daily-ad.jpg].
               
               }
            {- [JA3Fingerprint]: Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY].
               
                You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}.
                
                }
            {- [HeaderOrder]: The list of header names to match for. WAF creates a string that contains the ordered list of header names, from the headers in the web request, and then matches against that string.
               
               }
           
      }
       If [SearchString] includes alphabetic characters A-Z and a-z, note that the value is case sensitive.
       
        {b If you're using the WAF API}
        
         Specify a base64-encoded version of the value. The maximum length of the value before you base64-encode it is 200 bytes.
         
          For example, suppose the value of [Type] is [HEADER] and the value of [Data] is [User-Agent]. If you want to search the [User-Agent] header for the value [BadBot], you base64-encode [BadBot] using MIME base64-encoding and include the resulting value, [QmFkQm90], in the value of [SearchString].
          
           {b If you're using the CLI or one of the Amazon Web Services SDKs}
           
            The value that you want WAF to search for. The SDK automatically base64 encodes the value.
             *)

}

type sensitivity_level = | HIGH
  | LOW

(** 
    A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web requests to do things like modify your database or extract data from it.
     *)
type sqli_match_statement = {
  sensitivity_level: sensitivity_level option;
  (** 
    The sensitivity that you want WAF to use to inspect for SQL injection attacks.
    
     [HIGH] detects more attacks, but might generate more false positives, especially if your web requests frequently contain unusual strings. For information about identifying and mitigating false positives, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-testing.html}Testing and tuning} in the {i WAF Developer Guide}.
     
      [LOW] is generally a better choice for resources that already have other protections against SQL injection attacks or that have a low tolerance for false positives.
      
       Default: [LOW]
        *)

  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

}

type comparison_operator = | GT
  | GE
  | LT
  | LE
  | NE
  | EQ

(** 
    A rule statement that compares a number of bytes against the size of a request component, using a comparison operator, such as greater than (>) or less than (<). For example, you can use a size constraint statement to look for query strings that are longer than 100 bytes.
    
     If you configure WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit for the web ACL and protected resource type. If you know that the request body for your web requests should never exceed the inspection limit, you can use a size constraint statement to block requests that have a larger request body size. For more information about the inspection limits, see [Body] and [JsonBody] settings for the [FieldToMatch] data type.
     
      If you choose URI for the value of Part of the request to filter on, the slash (/) in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.
       *)
type size_constraint_statement = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  size: int;
  (** 
    The size, in byte, to compare to the request part, after any transformations.
     *)

  comparison_operator: comparison_operator;
  (** 
    The operator to use to compare the request part to the size setting.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

}

type country_code = | XK
  | ZW
  | ZM
  | YE
  | EH
  | WF
  | VI
  | VG
  | VN
  | VE
  | VU
  | UZ
  | UY
  | UM
  | US
  | GB
  | AE
  | UA
  | UG
  | TV
  | TC
  | TM
  | TR
  | TN
  | TT
  | TO
  | TK
  | TG
  | TL
  | TH
  | TZ
  | TJ
  | TW
  | SY
  | CH
  | SE
  | SZ
  | SJ
  | SR
  | SD
  | LK
  | ES
  | SS
  | GS
  | ZA
  | SO
  | SB
  | SI
  | SK
  | SX
  | SG
  | SL
  | SC
  | RS
  | SN
  | SA
  | ST
  | SM
  | WS
  | VC
  | PM
  | MF
  | LC
  | KN
  | SH
  | BL
  | RW
  | RU
  | RO
  | RE
  | QA
  | PR
  | PT
  | PL
  | PN
  | PH
  | PE
  | PY
  | PG
  | PA
  | PS
  | PW
  | PK
  | OM
  | NO
  | MP
  | NF
  | NU
  | NG
  | NE
  | NI
  | NZ
  | NC
  | NL
  | NP
  | NR
  | NA
  | MM
  | MZ
  | MA
  | MS
  | ME
  | MN
  | MC
  | MD
  | FM
  | MX
  | YT
  | MU
  | MR
  | MQ
  | MH
  | MT
  | ML
  | MV
  | MY
  | MW
  | MG
  | MK
  | MO
  | LU
  | LT
  | LI
  | LY
  | LR
  | LS
  | LB
  | LV
  | LA
  | KG
  | KW
  | KR
  | KP
  | KI
  | KE
  | KZ
  | JO
  | JE
  | JP
  | JM
  | IT
  | IL
  | IM
  | IE
  | IQ
  | IR
  | ID
  | IN
  | IS
  | HU
  | HK
  | HN
  | VA
  | HM
  | HT
  | GY
  | GW
  | GN
  | GG
  | GT
  | GU
  | GP
  | GD
  | GL
  | GR
  | GI
  | GH
  | DE
  | GE
  | GM
  | GA
  | TF
  | PF
  | GF
  | FR
  | FI
  | FJ
  | FO
  | FK
  | ET
  | EE
  | ER
  | GQ
  | SV
  | EG
  | EC
  | DO
  | DM
  | DJ
  | DK
  | CZ
  | CY
  | CW
  | CU
  | HR
  | CI
  | CR
  | CK
  | CD
  | CG
  | KM
  | CO
  | CC
  | CX
  | CN
  | CL
  | TD
  | CF
  | KY
  | CV
  | CA
  | CM
  | KH
  | BI
  | BF
  | BG
  | BN
  | IO
  | BR
  | BV
  | BW
  | BA
  | BQ
  | BO
  | BT
  | BM
  | BJ
  | BZ
  | BE
  | BY
  | BB
  | BD
  | BH
  | BS
  | AZ
  | AT
  | AU
  | AW
  | AM
  | AR
  | AG
  | AQ
  | AI
  | AO
  | AD
  | AS
  | DZ
  | AL
  | AX
  | AF

(** 
    The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      This configuration is used for [GeoMatchStatement] and [RateBasedStatement]. For [IPSetReferenceStatement], use [IPSetForwardedIPConfig] instead.
      
       WAF only evaluates the first IP address found in the specified HTTP header.
        *)
type forwarded_ip_config = {
  fallback_behavior: fallback_behavior;
  (** 
    The match status to assign to the web request if the request doesn't have a valid IP address in the specified position.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      You can specify the following fallback behaviors:
      
       {ul
            {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
               
               }
             {- [NO_MATCH] - Treat the web request as not matching the rule statement.
                
                }
            
      }
       *)

  header_name: string;
  (** 
    The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF) header, set this to [X-Forwarded-For].
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      *)

}

(** 
    A rule statement that labels web requests by country and region and that matches against web requests based on country code. A geo match rule labels every request that it inspects regardless of whether it finds a match.
    
     {ul
          {- To manage requests only by country, you can use this statement by itself and specify the countries that you want to match against in the [CountryCodes] array.
             
             }
           {- Otherwise, configure your geo match rule with Count action so that it only labels requests. Then, add one or more label match rules to run after the geo match rule and configure them to match against the geographic labels and handle the requests as needed.
              
              }
          
      }
       WAF labels requests using the alpha-2 country and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF determines the codes using either the IP address in the web request origin or, if you specify it, the address in the geo match [ForwardedIPConfig].
       
        If you use the web request origin, the label formats are 
        {[
        awswaf:clientip:geo:region:-
        ]}
         and 
        {[
        awswaf:clientip:geo:country:
        ]}
        .
        
         If you use a forwarded IP address, the label formats are 
         {[
         awswaf:forwardedip:geo:region:-
         ]}
          and 
         {[
         awswaf:forwardedip:geo:country:
         ]}
         .
         
          For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html}Geographic match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}.
           *)
type geo_match_statement = {
  forwarded_ip_config: forwarded_ip_config option;
  (** 
    The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      *)

  country_codes: country_code list option;
  [@ocaml.doc {| 
    An array of two-character country codes that you want to match against, for example, [\[ "US", "CN" \]], from the alpha-2 country ISO codes of the ISO 3166 international standard.
    
     When you use a geo match statement just for the region and country labels that it adds to requests, you still have to supply a country code for the rule to evaluate. In this case, you configure the rule to only count matching requests, but it will still generate logging and count metrics for any matches. You can reduce the logging and metrics that the rule produces by specifying a country that's unlikely to be a source of traffic to your site.
      |}]

}

(** 
    Specifies a single rule in a rule group whose action you want to override to [Count].
    
     Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].
     
      *)
type excluded_rule = {
  name: string;
  (** 
    The name of the rule whose action you want to override to [Count].
     *)

}

(** 
    Specifies that WAF should count the request. Optionally defines additional custom handling for the request.
    
     This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction].
      *)
type count_action = {
  custom_request_handling: custom_request_handling option;
  (** 
    Defines custom handling for the web request.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)

}

(** 
    Specifies that WAF should run a [CAPTCHA] check against the request:
    
     {ul
          {- If the request includes a valid, unexpired [CAPTCHA] token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction].
             
             }
           {- If the request doesn't include a valid, unexpired token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.
              
               WAF generates a response that it sends back to the client, which includes the following:
               
                {ul
                     {- The header [x-amzn-waf-action] with a value of [captcha].
                        
                        }
                      {- The HTTP status code [405 Method Not Allowed].
                         
                         }
                      {- If the request contains an [Accept] header with a value of [text/html], the response includes a [CAPTCHA] JavaScript page interstitial.
                         
                         }
                     
            }
            }
          
      }
       You can configure the expiration time in the [CaptchaConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting.
       
        This action option is available for rules. It isn't available for web ACL default actions.
         *)
type captcha_action = {
  custom_request_handling: custom_request_handling option;
  (** 
    Defines custom handling for the web request, used when the [CAPTCHA] inspection determines that the request's token is valid and unexpired.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)

}

(** 
    Specifies that WAF should run a [Challenge] check against the request to verify that the request is coming from a legitimate client session:
    
     {ul
          {- If the request includes a valid, unexpired challenge token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction].
             
             }
           {- If the request doesn't include a valid, unexpired challenge token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.
              
               WAF then generates a challenge response that it sends back to the client, which includes the following:
               
                {ul
                     {- The header [x-amzn-waf-action] with a value of [challenge].
                        
                        }
                      {- The HTTP status code [202 Request Accepted].
                         
                         }
                      {- If the request contains an [Accept] header with a value of [text/html], the response includes a JavaScript page interstitial with a challenge script.
                         
                         }
                     
            }
             Challenges run silent browser interrogations in the background, and don't generally affect the end user experience.
             
              A challenge enforces token acquisition using an interstitial JavaScript challenge that inspects the client session for legitimate behavior. The challenge blocks bots or at least increases the cost of operating sophisticated bots.
              
               After the client session successfully responds to the challenge, it receives a new token from WAF, which the challenge script uses to resubmit the original request.
               
               }
          
      }
       You can configure the expiration time in the [ChallengeConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting.
       
        This action option is available for rules. It isn't available for web ACL default actions.
         *)
type challenge_action = {
  custom_request_handling: custom_request_handling option;
  (** 
    Defines custom handling for the web request, used when the challenge inspection determines that the request's token is valid and unexpired.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
      *)

}

(** 
    The action that WAF should take on a web request when it matches a rule's statement. Settings at the web ACL level can override the rule action setting.
     *)
type rule_action = {
  challenge: challenge_action option;
  (** 
    Instructs WAF to run a [Challenge] check against the web request.
     *)

  captcha: captcha_action option;
  (** 
    Instructs WAF to run a [CAPTCHA] check against the web request.
     *)

  count: count_action option;
  (** 
    Instructs WAF to count the web request and then continue evaluating the request using the remaining rules in the web ACL.
     *)

  allow: allow_action option;
  (** 
    Instructs WAF to allow the web request.
     *)

  block: block_action option;
  (** 
    Instructs WAF to block the web request.
     *)

}

(** 
    Action setting to use in the place of a rule action that is configured inside the rule group. You specify one override for each rule whose action you want to change.
    
     You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.
      *)
type rule_action_override = {
  action_to_use: rule_action;
  (** 
    The override action to use, in place of the configured action of the rule in the rule group.
     *)

  name: string;
  (** 
    The name of the rule to override.
     *)

}

(** 
    A rule statement used to run the rules that are defined in a [RuleGroup]. To use this, create a rule group with your rules, then provide the ARN of the rule group in this statement.
    
     You cannot nest a [RuleGroupReferenceStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a rule group reference statement inside another rule group. You can only reference a rule group as a top-level statement within a rule that you define in a web ACL.
      *)
type rule_group_reference_statement = {
  rule_action_overrides: rule_action_override list option;
  (** 
    Action settings to use in the place of the rule actions that are configured inside the rule group. You specify one override for each rule whose action you want to change.
    
     You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.
      *)

  excluded_rules: excluded_rule list option;
  (** 
    Rules in the referenced rule group whose actions are set to [Count].
    
     Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].
     
      *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

}

type forwarded_ip_position = | ANY
  | LAST
  | FIRST

(** 
    The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      This configuration is used only for [IPSetReferenceStatement]. For [GeoMatchStatement] and [RateBasedStatement], use [ForwardedIPConfig] instead.
       *)
type ip_set_forwarded_ip_config = {
  position: forwarded_ip_position;
  (** 
    The position in the header to search for the IP address. The header can contain IP addresses of the original client and also of proxies. For example, the header value could be [10.1.1.1, 127.0.0.0, 10.10.10.10] where the first IP address identifies the original client and the rest identify proxies that the request went through.
    
     The options for this setting are the following:
     
      {ul
           {- FIRST - Inspect the first IP address in the list of IP addresses in the header. This is usually the client's original IP.
              
              }
            {- LAST - Inspect the last IP address in the list of IP addresses in the header.
               
               }
            {- ANY - Inspect all IP addresses in the header for a match. If the header contains more than 10 IP addresses, WAF inspects the last 10.
               
               }
           
      }
       *)

  fallback_behavior: fallback_behavior;
  (** 
    The match status to assign to the web request if the request doesn't have a valid IP address in the specified position.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      You can specify the following fallback behaviors:
      
       {ul
            {- [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.
               
               }
             {- [NO_MATCH] - Treat the web request as not matching the rule statement.
                
                }
            
      }
       *)

  header_name: string;
  (** 
    The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF) header, set this to [X-Forwarded-For].
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      *)

}

(** 
    A rule statement used to detect web requests coming from particular IP addresses or address ranges. To use this, create an [IPSet] that specifies the addresses you want to detect, then use the ARN of that set in this statement. To create an IP set, see [CreateIPSet].
    
     Each IP set rule statement references an IP set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.
      *)
type ip_set_reference_statement = {
  ip_set_forwarded_ip_config: ip_set_forwarded_ip_config option;
  (** 
    The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the [IPSet] that this statement references.
     *)

}

(** 
    A rule statement used to search web request components for matches with regular expressions. To use this, create a [RegexPatternSet] that specifies the expressions that you want to detect, then use the ARN of that set in this statement. A web request matches the pattern set rule statement if the request component matches any of the patterns in the set. To create a regex pattern set, see [CreateRegexPatternSet].
    
     Each regex pattern set rule statement references a regex pattern set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.
      *)
type regex_pattern_set_reference_statement = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the [RegexPatternSet] that this statement references.
     *)

}

type rate_based_statement_aggregate_key_type = | CONSTANT
  | CUSTOM_KEYS
  | FORWARDED_IP
  | IP

(** 
    Specifies a header as an aggregate key for a rate-based rule. Each distinct value in the header contributes to the aggregation instance. If you use a single header as your custom key, then each value fully defines an aggregation instance.
     *)
type rate_limit_header = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  name: string;
  (** 
    The name of the header to use.
     *)

}

(** 
    Specifies a cookie as an aggregate key for a rate-based rule. Each distinct value in the cookie contributes to the aggregation instance. If you use a single cookie as your custom key, then each value fully defines an aggregation instance.
     *)
type rate_limit_cookie = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  name: string;
  (** 
    The name of the cookie to use.
     *)

}

(** 
    Specifies a query argument in the request as an aggregate key for a rate-based rule. Each distinct value for the named query argument contributes to the aggregation instance. If you use a single query argument as your custom key, then each value fully defines an aggregation instance.
     *)
type rate_limit_query_argument = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  name: string;
  (** 
    The name of the query argument to use.
     *)

}

(** 
    Specifies the request's query string as an aggregate key for a rate-based rule. Each distinct string contributes to the aggregation instance. If you use just the query string as your custom key, then each string fully defines an aggregation instance.
     *)
type rate_limit_query_string = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

}

[@@ocaml.doc {| 
    Specifies the request's HTTP method as an aggregate key for a rate-based rule. Each distinct HTTP method contributes to the aggregation instance. If you use just the HTTP method as your custom key, then each method fully defines an aggregation instance.
    
     JSON specification: ["RateLimitHTTPMethod": {}]
      |}]
type rate_limit_http_method = unit

[@@ocaml.doc {| 
    Specifies the first IP address in an HTTP header as an aggregate key for a rate-based rule. Each distinct forwarded IP address contributes to the aggregation instance.
    
     This setting is used only in the [RateBasedStatementCustomKey] specification of a rate-based rule statement. When you specify an IP or forwarded IP in the custom key settings, you must also specify at least one other key to use. You can aggregate on only the forwarded IP address by specifying [FORWARDED_IP] in your rate-based statement's [AggregateKeyType].
     
      This data type supports using the forwarded IP address in the web request aggregation for a rate-based rule, in [RateBasedStatementCustomKey]. The JSON specification for using the forwarded IP address doesn't explicitly use this data type.
      
       JSON specification: ["ForwardedIP": {}]
       
        When you use this specification, you must also configure the forwarded IP address in the rate-based statement's [ForwardedIPConfig].
         |}]
type rate_limit_forwarded_i_p = unit

[@@ocaml.doc {| 
    Specifies the IP address in the web request as an aggregate key for a rate-based rule. Each distinct IP address contributes to the aggregation instance.
    
     This setting is used only in the [RateBasedStatementCustomKey] specification of a rate-based rule statement. To use this in the custom key settings, you must specify at least one other key to use, along with the IP address. To aggregate on only the IP address, in your rate-based statement's [AggregateKeyType], specify [IP].
     
      JSON specification: ["RateLimitIP": {}]
       |}]
type rate_limit_i_p = unit

(** 
    Specifies a label namespace to use as an aggregate key for a rate-based rule. Each distinct fully qualified label name that has the specified label namespace contributes to the aggregation instance. If you use just one label namespace as your custom key, then each label name fully defines an aggregation instance.
    
     This uses only labels that have been added to the request by rules that are evaluated before this rate-based rule in the web ACL.
     
      For information about label namespaces and names, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html}Label syntax and naming requirements} in the {i WAF Developer Guide}.
       *)
type rate_limit_label_namespace = {
  namespace: string;
  (** 
    The namespace to use for aggregation.
     *)

}

(** 
    Specifies the request's URI path as an aggregate key for a rate-based rule. Each distinct URI path contributes to the aggregation instance. If you use just the URI path as your custom key, then each URI path fully defines an aggregation instance.
     *)
type rate_limit_uri_path = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

}

(** 
    Specifies a single custom aggregate key for a rate-base rule.
    
     Web requests that are missing any of the components specified in the aggregation keys are omitted from the rate-based rule evaluation and handling.
     
      *)
type rate_based_statement_custom_key = {
  uri_path: rate_limit_uri_path option;
  (** 
    Use the request's URI path as an aggregate key. Each distinct URI path contributes to the aggregation instance. If you use just the URI path as your custom key, then each URI path fully defines an aggregation instance.
     *)

  label_namespace: rate_limit_label_namespace option;
  (** 
    Use the specified label namespace as an aggregate key. Each distinct fully qualified label name that has the specified label namespace contributes to the aggregation instance. If you use just one label namespace as your custom key, then each label name fully defines an aggregation instance.
    
     This uses only labels that have been added to the request by rules that are evaluated before this rate-based rule in the web ACL.
     
      For information about label namespaces and names, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html}Label syntax and naming requirements} in the {i WAF Developer Guide}.
       *)

  i_p: rate_limit_i_p option;
  (** 
    Use the request's originating IP address as an aggregate key. Each distinct IP address contributes to the aggregation instance.
    
     When you specify an IP or forwarded IP in the custom key settings, you must also specify at least one other key to use. You can aggregate on only the IP address by specifying [IP] in your rate-based statement's [AggregateKeyType].
      *)

  forwarded_i_p: rate_limit_forwarded_i_p option;
  (** 
    Use the first IP address in an HTTP header as an aggregate key. Each distinct forwarded IP address contributes to the aggregation instance.
    
     When you specify an IP or forwarded IP in the custom key settings, you must also specify at least one other key to use. You can aggregate on only the forwarded IP address by specifying [FORWARDED_IP] in your rate-based statement's [AggregateKeyType].
     
      With this option, you must specify the header to use in the rate-based rule's [ForwardedIPConfig] property.
       *)

  http_method: rate_limit_http_method option;
  (** 
    Use the request's HTTP method as an aggregate key. Each distinct HTTP method contributes to the aggregation instance. If you use just the HTTP method as your custom key, then each method fully defines an aggregation instance.
     *)

  query_string: rate_limit_query_string option;
  (** 
    Use the request's query string as an aggregate key. Each distinct string contributes to the aggregation instance. If you use just the query string as your custom key, then each string fully defines an aggregation instance.
     *)

  query_argument: rate_limit_query_argument option;
  (** 
    Use the specified query argument as an aggregate key. Each distinct value for the named query argument contributes to the aggregation instance. If you use a single query argument as your custom key, then each value fully defines an aggregation instance.
     *)

  cookie: rate_limit_cookie option;
  (** 
    Use the value of a cookie in the request as an aggregate key. Each distinct value in the cookie contributes to the aggregation instance. If you use a single cookie as your custom key, then each value fully defines an aggregation instance.
     *)

  header: rate_limit_header option;
  (** 
    Use the value of a header in the request as an aggregate key. Each distinct value in the header contributes to the aggregation instance. If you use a single header as your custom key, then each value fully defines an aggregation instance.
     *)

}

type payload_type = | FORM_ENCODED
  | JSON

(** 
    The name of the field in the request payload that contains your customer's username.
    
     This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types.
      *)
type username_field = {
  identifier: string;
  [@ocaml.doc {| 
    The name of the username field.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "username": "THE_USERNAME" } }], the username field specification is [/form/username].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [username1], the username field specification is [username1]
                
                }
           
      }
       |}]

}

(** 
    The name of the field in the request payload that contains your customer's password.
    
     This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types.
      *)
type password_field = {
  identifier: string;
  [@ocaml.doc {| 
    The name of the password field.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "password": "THE_PASSWORD" } }], the password field specification is [/form/password].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [password1], the password field specification is [password1].
                
                }
           
      }
       |}]

}

type inspection_level = | TARGETED
  | COMMON

(** 
    Details for your use of the Bot Control managed rule group, [AWSManagedRulesBotControlRuleSet]. This configuration is used in [ManagedRuleGroupConfig].
     *)
type aws_managed_rules_bot_control_rule_set = {
  enable_machine_learning: bool option;
  (** 
    Applies only to the targeted inspection level.
    
     Determines whether to use machine learning (ML) to analyze your web traffic for bot-related activity. Machine learning is required for the Bot Control rules [TGT_ML_CoordinatedActivityLow] and [TGT_ML_CoordinatedActivityMedium], which inspect for anomalous behavior that might indicate distributed, coordinated bot activity.
     
      For more information about this choice, see the listing for these rules in the table at {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html#aws-managed-rule-groups-bot-rules}Bot Control rules listing} in the {i WAF Developer Guide}.
      
       Default: [TRUE]
        *)

  inspection_level: inspection_level;
  (** 
    The inspection level to use for the Bot Control rule group. The common level is the least expensive. The targeted level includes all common level rules and adds rules with more advanced inspection criteria. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html}WAF Bot Control rule group} in the {i WAF Developer Guide}.
     *)

}

(** 
    The criteria for inspecting login requests, used by the ATP rule group to validate credentials usage.
    
     This is part of the [AWSManagedRulesATPRuleSet] configuration in [ManagedRuleGroupConfig].
     
      In these settings, you specify how your application accepts login attempts by providing the request payload type and the names of the fields within the request body where the username and password are provided.
       *)
type request_inspection = {
  password_field: password_field;
  [@ocaml.doc {| 
    The name of the field in the request payload that contains your customer's password.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "password": "THE_PASSWORD" } }], the password field specification is [/form/password].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [password1], the password field specification is [password1].
                
                }
           
      }
       |}]

  username_field: username_field;
  [@ocaml.doc {| 
    The name of the field in the request payload that contains your customer's username.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "username": "THE_USERNAME" } }], the username field specification is [/form/username].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [username1], the username field specification is [username1]
                
                }
           
      }
       |}]

  payload_type: payload_type;
  (** 
    The payload type for your login endpoint, either JSON or form encoded.
     *)

}

(** 
    Configures inspection of the response status code. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet].
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      *)
type response_inspection_status_code = {
  failure_codes: int list;
  [@ocaml.doc {| 
    Status codes in the response that indicate a failed login or account creation attempt. To be counted as a failure, the response status code must match one of these. Each code must be unique among the success and failure status codes.
    
     JSON example: ["FailureCodes": \[ 400, 404 \]]
      |}]

  success_codes: int list;
  [@ocaml.doc {| 
    Status codes in the response that indicate a successful login or account creation attempt. To be counted as a success, the response status code must match one of these. Each code must be unique among the success and failure status codes.
    
     JSON example: ["SuccessCodes": \[ 200, 201 \]]
      |}]

}

(** 
    Configures inspection of the response header. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet].
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      *)
type response_inspection_header = {
  failure_values: string list;
  [@ocaml.doc {| 
    Values in the response header with the specified name that indicate a failed login or account creation attempt. To be counted as a failure, the value must be an exact match, including case. Each value must be unique among the success and failure values.
    
     JSON examples: ["FailureValues": \[ "LoginFailed", "Failed login" \]] and ["FailureValues": \[ "AccountCreationFailed" \]]
      |}]

  success_values: string list;
  [@ocaml.doc {| 
    Values in the response header with the specified name that indicate a successful login or account creation attempt. To be counted as a success, the value must be an exact match, including case. Each value must be unique among the success and failure values.
    
     JSON examples: ["SuccessValues": \[ "LoginPassed", "Successful login" \]] and ["SuccessValues": \[ "AccountCreated", "Successful account creation" \]]
      |}]

  name: string;
  [@ocaml.doc {| 
    The name of the header to match against. The name must be an exact match, including case.
    
     JSON example: ["Name": \[ "RequestResult" \]]
      |}]

}

(** 
    Configures inspection of the response body. WAF can inspect the first 65,536 bytes (64 KB) of the response body. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet].
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      *)
type response_inspection_body_contains = {
  failure_strings: string list;
  [@ocaml.doc {| 
    Strings in the body of the response that indicate a failed login or account creation attempt. To be counted as a failure, the string can be anywhere in the body and must be an exact match, including case. Each string must be unique among the success and failure strings.
    
     JSON example: ["FailureStrings": \[ "Request failed" \]]
      |}]

  success_strings: string list;
  [@ocaml.doc {| 
    Strings in the body of the response that indicate a successful login or account creation attempt. To be counted as a success, the string can be anywhere in the body and must be an exact match, including case. Each string must be unique among the success and failure strings.
    
     JSON examples: ["SuccessStrings": \[ "Login successful" \]] and ["SuccessStrings": \[ "Account creation successful", "Welcome to our site!" \]]
      |}]

}

(** 
    Configures inspection of the response JSON. WAF can inspect the first 65,536 bytes (64 KB) of the response JSON. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet].
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      *)
type response_inspection_json = {
  failure_values: string list;
  [@ocaml.doc {| 
    Values for the specified identifier in the response JSON that indicate a failed login or account creation attempt. To be counted as a failure, the value must be an exact match, including case. Each value must be unique among the success and failure values.
    
     JSON example: ["FailureValues": \[ "False", "Failed" \]]
      |}]

  success_values: string list;
  [@ocaml.doc {| 
    Values for the specified identifier in the response JSON that indicate a successful login or account creation attempt. To be counted as a success, the value must be an exact match, including case. Each value must be unique among the success and failure values.
    
     JSON example: ["SuccessValues": \[ "True", "Succeeded" \]]
      |}]

  identifier: string;
  [@ocaml.doc {| 
    The identifier for the value to match against in the JSON. The identifier must be an exact match, including case.
    
     JSON examples: ["Identifier": \[ "/login/success" \]] and ["Identifier": \[ "/sign-up/success" \]]
      |}]

}

(** 
    The criteria for inspecting responses to login requests and account creation requests, used by the ATP and ACFP rule groups to track login and account creation success and failure rates.
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      The rule groups evaluates the responses that your protected resources send back to client login and account creation attempts, keeping count of successful and failed attempts from each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses with too much suspicious activity in a short amount of time.
      
       This is part of the [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet] configurations in [ManagedRuleGroupConfig].
       
        Enable response inspection by configuring exactly one component of the response to inspect, for example, [Header] or [StatusCode]. You can't configure more than one component for inspection. If you don't configure any of the response inspection options, response inspection is disabled.
         *)
type response_inspection = {
  json: response_inspection_json option;
  (** 
    Configures inspection of the response JSON for success and failure indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response JSON.
     *)

  body_contains: response_inspection_body_contains option;
  (** 
    Configures inspection of the response body for success and failure indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response body.
     *)

  header: response_inspection_header option;
  (** 
    Configures inspection of the response header for success and failure indicators.
     *)

  status_code: response_inspection_status_code option;
  (** 
    Configures inspection of the response status code for success and failure indicators.
     *)

}

(** 
    Details for your use of the account takeover prevention managed rule group, [AWSManagedRulesATPRuleSet]. This configuration is used in [ManagedRuleGroupConfig].
     *)
type aws_managed_rules_atp_rule_set = {
  enable_regex_in_path: bool option;
  (** 
    Allow the use of regular expressions in the login page path.
     *)

  response_inspection: response_inspection option;
  (** 
    The criteria for inspecting responses to login requests, used by the ATP rule group to track login failure rates.
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      The ATP rule group evaluates the responses that your protected resources send back to client login attempts, keeping count of successful and failed attempts for each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses that have had too many failed login attempts in a short amount of time.
       *)

  request_inspection: request_inspection option;
  (** 
    The criteria for inspecting login requests, used by the ATP rule group to validate credentials usage.
     *)

  login_path: string;
  (** 
    The path of the login endpoint for your application. For example, for the URL [https://example.com/web/login], you would provide the path [/web/login]. Login paths that start with the path that you provide are considered a match. For example [/web/login] matches the login paths [/web/login], [/web/login/], [/web/loginPage], and [/web/login/thisPage], but doesn't match the login path [/home/web/login] or [/website/login].
    
     The rule group inspects only HTTP [POST] requests to your specified login endpoint.
      *)

}

(** 
    The name of the field in the request payload that contains your customer's email.
    
     This data type is used in the [RequestInspectionACFP] data type.
      *)
type email_field = {
  identifier: string;
  [@ocaml.doc {| 
    The name of the email field.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "email": "THE_EMAIL" } }], the email field specification is [/form/email].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [email1], the email field specification is [email1].
                
                }
           
      }
       |}]

}

(** 
    The name of a field in the request payload that contains part or all of your customer's primary phone number.
    
     This data type is used in the [RequestInspectionACFP] data type.
      *)
type phone_number_field = {
  identifier: string;
  [@ocaml.doc {| 
    The name of a single primary phone number field.
    
     How you specify the phone number fields depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "primaryphoneline1": "THE_PHONE1", "primaryphoneline2": "THE_PHONE2", "primaryphoneline3": "THE_PHONE3" } }], the phone number field identifiers are [/form/primaryphoneline1], [/form/primaryphoneline2], and [/form/primaryphoneline3].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with input elements named [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3], the phone number field identifiers are [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3].
                
                }
           
      }
       |}]

}

(** 
    The name of a field in the request payload that contains part or all of your customer's primary physical address.
    
     This data type is used in the [RequestInspectionACFP] data type.
      *)
type address_field = {
  identifier: string;
  [@ocaml.doc {| 
    The name of a single primary address field.
    
     How you specify the address fields depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "primaryaddressline1": "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2", "primaryaddressline3": "THE_ADDRESS3" } }], the address field idenfiers are [/form/primaryaddressline1], [/form/primaryaddressline2], and [/form/primaryaddressline3].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with input elements named [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3], the address fields identifiers are [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3].
                
                }
           
      }
       |}]

}

(** 
    The criteria for inspecting account creation requests, used by the ACFP rule group to validate and track account creation attempts.
    
     This is part of the [AWSManagedRulesACFPRuleSet] configuration in [ManagedRuleGroupConfig].
     
      In these settings, you specify how your application accepts account creation attempts by providing the request payload type and the names of the fields within the request body where the username, password, email, and primary address and phone number fields are provided.
       *)
type request_inspection_acf_p = {
  address_fields: address_field list option;
  [@ocaml.doc {| 
    The names of the fields in the request payload that contain your customer's primary physical address.
    
     Order the address fields in the array exactly as they are ordered in the request payload.
     
      How you specify the address fields depends on the request inspection payload type.
      
       {ul
            {- For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
               
                For example, for the JSON payload [{ "form": { "primaryaddressline1": "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2", "primaryaddressline3": "THE_ADDRESS3" } }], the address field idenfiers are [/form/primaryaddressline1], [/form/primaryaddressline2], and [/form/primaryaddressline3].
                
                }
             {- For form encoded payload types, use the HTML form names.
                
                 For example, for an HTML form with input elements named [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3], the address fields identifiers are [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3].
                 
                 }
            
      }
       |}]

  phone_number_fields: phone_number_field list option;
  [@ocaml.doc {| 
    The names of the fields in the request payload that contain your customer's primary phone number.
    
     Order the phone number fields in the array exactly as they are ordered in the request payload.
     
      How you specify the phone number fields depends on the request inspection payload type.
      
       {ul
            {- For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
               
                For example, for the JSON payload [{ "form": { "primaryphoneline1": "THE_PHONE1", "primaryphoneline2": "THE_PHONE2", "primaryphoneline3": "THE_PHONE3" } }], the phone number field identifiers are [/form/primaryphoneline1], [/form/primaryphoneline2], and [/form/primaryphoneline3].
                
                }
             {- For form encoded payload types, use the HTML form names.
                
                 For example, for an HTML form with input elements named [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3], the phone number field identifiers are [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3].
                 
                 }
            
      }
       |}]

  email_field: email_field option;
  [@ocaml.doc {| 
    The name of the field in the request payload that contains your customer's email.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "email": "THE_EMAIL" } }], the email field specification is [/form/email].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [email1], the email field specification is [email1].
                
                }
           
      }
       |}]

  password_field: password_field option;
  [@ocaml.doc {| 
    The name of the field in the request payload that contains your customer's password.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "password": "THE_PASSWORD" } }], the password field specification is [/form/password].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [password1], the password field specification is [password1].
                
                }
           
      }
       |}]

  username_field: username_field option;
  [@ocaml.doc {| 
    The name of the field in the request payload that contains your customer's username.
    
     How you specify this depends on the request inspection payload type.
     
      {ul
           {- For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}.
              
               For example, for the JSON payload [{ "form": { "username": "THE_USERNAME" } }], the username field specification is [/form/username].
               
               }
            {- For form encoded payload types, use the HTML form names.
               
                For example, for an HTML form with the input element named [username1], the username field specification is [username1]
                
                }
           
      }
       |}]

  payload_type: payload_type;
  (** 
    The payload type for your account creation endpoint, either JSON or form encoded.
     *)

}

(** 
    Details for your use of the account creation fraud prevention managed rule group, [AWSManagedRulesACFPRuleSet]. This configuration is used in [ManagedRuleGroupConfig].
     *)
type aws_managed_rules_acfp_rule_set = {
  enable_regex_in_path: bool option;
  (** 
    Allow the use of regular expressions in the registration page path and the account creation path.
     *)

  response_inspection: response_inspection option;
  (** 
    The criteria for inspecting responses to account creation requests, used by the ACFP rule group to track account creation success rates.
    
     Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.
     
      The ACFP rule group evaluates the responses that your protected resources send back to client account creation attempts, keeping count of successful and failed attempts from each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses that have had too many successful account creation attempts in a short amount of time.
       *)

  request_inspection: request_inspection_acf_p;
  (** 
    The criteria for inspecting account creation requests, used by the ACFP rule group to validate and track account creation attempts.
     *)

  registration_page_path: string;
  (** 
    The path of the account registration endpoint for your application. This is the page on your website that presents the registration form to new users.
    
     This page must accept [GET] text/html requests.
     
      For example, for the URL [https://example.com/web/registration], you would provide the path [/web/registration]. Registration page paths that start with the path that you provide are considered a match. For example [/web/registration] matches the registration paths [/web/registration], [/web/registration/], [/web/registrationPage], and [/web/registration/thisPage], but doesn't match the path [/home/web/registration] or [/website/registration].
       *)

  creation_path: string;
  (** 
    The path of the account creation endpoint for your application. This is the page on your website that accepts the completed registration form for a new user. This page must accept [POST] requests.
    
     For example, for the URL [https://example.com/web/newaccount], you would provide the path [/web/newaccount]. Account creation page paths that start with the path that you provide are considered a match. For example [/web/newaccount] matches the account creation paths [/web/newaccount], [/web/newaccount/], [/web/newaccountPage], and [/web/newaccount/thisPage], but doesn't match the path [/home/web/newaccount] or [/website/newaccount].
      *)

}

(** 
    Additional information that's used by a managed rule group. Many managed rule groups don't require this.
    
     The rule groups used for intelligent threat mitigation require additional configuration:
     
      {ul
           {- Use the [AWSManagedRulesACFPRuleSet] configuration object to configure the account creation fraud prevention managed rule group. The configuration includes the registration and sign-up pages of your application and the locations in the account creation request payload of data, such as the user email and phone number fields.
              
              }
            {- Use the [AWSManagedRulesATPRuleSet] configuration object to configure the account takeover prevention managed rule group. The configuration includes the sign-in page of your application and the locations in the login request payload of data such as the username and password.
               
               }
            {- Use the [AWSManagedRulesBotControlRuleSet] configuration object to configure the protection level that you want the Bot Control rule group to use.
               
               }
           
      }
       For example specifications, see the examples section of [CreateWebACL].
        *)
type managed_rule_group_config = {
  aws_managed_rules_acfp_rule_set: aws_managed_rules_acfp_rule_set option;
  (** 
    Additional configuration for using the account creation fraud prevention (ACFP) managed rule group, [AWSManagedRulesACFPRuleSet]. Use this to provide account creation request information to the rule group. For web ACLs that protect CloudFront distributions, use this to also provide the information about how your distribution responds to account creation requests.
    
     For information about using the ACFP managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-acfp.html}WAF Fraud Control account creation fraud prevention (ACFP) rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-acfp.html}WAF Fraud Control account creation fraud prevention (ACFP)} in the {i WAF Developer Guide}.
      *)

  aws_managed_rules_atp_rule_set: aws_managed_rules_atp_rule_set option;
  (** 
    Additional configuration for using the account takeover prevention (ATP) managed rule group, [AWSManagedRulesATPRuleSet]. Use this to provide login request information to the rule group. For web ACLs that protect CloudFront distributions, use this to also provide the information about how your distribution responds to login requests.
    
     This configuration replaces the individual configuration fields in [ManagedRuleGroupConfig] and provides additional feature configuration.
     
      For information about using the ATP managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-atp.html}WAF Fraud Control account takeover prevention (ATP) rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-atp.html}WAF Fraud Control account takeover prevention (ATP)} in the {i WAF Developer Guide}.
       *)

  aws_managed_rules_bot_control_rule_set: aws_managed_rules_bot_control_rule_set option;
  (** 
    Additional configuration for using the Bot Control managed rule group. Use this to specify the inspection level that you want to use. For information about using the Bot Control managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html}WAF Bot Control rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-bot-control.html}WAF Bot Control} in the {i WAF Developer Guide}.
     *)

  password_field: password_field option;
  (** 
    Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet].
    
     *)

  username_field: username_field option;
  (** 
    Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet].
    
     *)

  payload_type: payload_type option;
  (** 
    Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet].
    
     *)

  login_path: string option;
  (** 
    Instead of this setting, provide your configuration under [AWSManagedRulesATPRuleSet].
    
     *)

}

type label_match_scope = | NAMESPACE
  | LABEL

(** 
    A rule statement to match against labels that have been added to the web request by rules that have already run in the web ACL.
    
     The label match statement provides the label or namespace string to search for. The label string can represent a part or all of the fully qualified label name that had been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. If you do not provide the fully qualified name in your label match string, WAF performs the search for labels that were added in the same context as the label match statement.
      *)
type label_match_statement = {
  key: string;
  (** 
    The string to match against. The setting you provide for this depends on the match statement's [Scope] setting:
    
     {ul
          {- If the [Scope] indicates [LABEL], then this specification must include the name and can include any number of preceding namespace specifications and prefix up to providing the fully qualified label name.
             
             }
           {- If the [Scope] indicates [NAMESPACE], then this specification can include any number of contiguous namespace strings, and can include the entire label namespace prefix from the rule group or web ACL where the label originates.
              
              }
          
      }
       Labels are case sensitive and components of a label must be separated by colon, for example [NS1:NS2:name].
        *)

  scope: label_match_scope;
  (** 
    Specify whether you want to match using the label name or just the namespace.
     *)

}

(** 
    A rule statement used to search web request components for a match against a single regular expression.
     *)
type regex_match_statement = {
  text_transformations: text_transformation list;
  (** 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents.
     *)

  field_to_match: field_to_match;
  (** 
    The part of the web request that you want WAF to inspect.
     *)

  regex_string: string;
  (** 
    The string representing the regular expression.
     *)

}

type and_statement = {
  statements: statement list;
  (** 
    The statements to combine with AND logic. You can use any statements that can be nested.
     *)

} and managed_rule_group_statement = {
  rule_action_overrides: rule_action_override list option;
  (** 
    Action settings to use in the place of the rule actions that are configured inside the rule group. You specify one override for each rule whose action you want to change.
    
     You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.
      *)

  managed_rule_group_configs: managed_rule_group_config list option;
  (** 
    Additional information that's used by a managed rule group. Many managed rule groups don't require this.
    
     The rule groups used for intelligent threat mitigation require additional configuration:
     
      {ul
           {- Use the [AWSManagedRulesACFPRuleSet] configuration object to configure the account creation fraud prevention managed rule group. The configuration includes the registration and sign-up pages of your application and the locations in the account creation request payload of data, such as the user email and phone number fields.
              
              }
            {- Use the [AWSManagedRulesATPRuleSet] configuration object to configure the account takeover prevention managed rule group. The configuration includes the sign-in page of your application and the locations in the login request payload of data such as the username and password.
               
               }
            {- Use the [AWSManagedRulesBotControlRuleSet] configuration object to configure the protection level that you want the Bot Control rule group to use.
               
               }
           
      }
       *)

  scope_down_statement: statement option;
  (** 
    An optional nested statement that narrows the scope of the web requests that are evaluated by the managed rule group. Requests are only evaluated by the rule group if they match the scope-down statement. You can use any nestable [Statement] in the scope-down statement, and you can nest statements at any level, the same as you can for a rule statement.
     *)

  excluded_rules: excluded_rule list option;
  (** 
    Rules in the referenced rule group whose actions are set to [Count].
    
     Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].
     
      *)

  version: string option;
  (** 
    The version of the managed rule group to use. If you specify this, the version setting is fixed until you change it. If you don't specify this, WAF uses the vendor's default version, and then keeps the version at the vendor's default when the vendor updates the managed rule group settings.
     *)

  name: string;
  (** 
    The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.
     *)

  vendor_name: string;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

} and not_statement = {
  statement: statement;
  (** 
    The statement to negate. You can use any statement that can be nested.
     *)

} and or_statement = {
  statements: statement list;
  (** 
    The statements to combine with OR logic. You can use any statements that can be nested.
     *)

} and rate_based_statement = {
  custom_keys: rate_based_statement_custom_key list option;
  (** 
    Specifies the aggregate keys to use in a rate-base rule.
     *)

  forwarded_ip_config: forwarded_ip_config option;
  (** 
    The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name.
    
     If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.
     
      This is required if you specify a forwarded IP in the rule's aggregate key settings.
       *)

  scope_down_statement: statement option;
  (** 
    An optional nested statement that narrows the scope of the web requests that are evaluated and managed by the rate-based statement. When you use a scope-down statement, the rate-based rule only tracks and rate limits requests that match the scope-down statement. You can use any nestable [Statement] in the scope-down statement, and you can nest statements at any level, the same as you can for a rule statement.
     *)

  aggregate_key_type: rate_based_statement_aggregate_key_type;
  (** 
    Setting that indicates how to aggregate the request counts.
    
     Web requests that are missing any of the components specified in the aggregation keys are omitted from the rate-based rule evaluation and handling.
     
      {ul
           {- [CONSTANT] - Count and limit the requests that match the rate-based rule's scope-down statement. With this option, the counted requests aren't further aggregated. The scope-down statement is the only specification used. When the count of all requests that satisfy the scope-down statement goes over the limit, WAF applies the rule action to all requests that satisfy the scope-down statement.
              
               With this option, you must configure the [ScopeDownStatement] property.
               
               }
            {- [CUSTOM_KEYS] - Aggregate the request counts using one or more web request components as the aggregate keys.
               
                With this option, you must specify the aggregate keys in the [CustomKeys] property.
                
                 To aggregate on only the IP address or only the forwarded IP address, don't use custom keys. Instead, set the aggregate key type to [IP] or [FORWARDED_IP].
                 
                 }
            {- [FORWARDED_IP] - Aggregate the request counts on the first IP address in an HTTP header.
               
                With this option, you must specify the header to use in the [ForwardedIPConfig] property.
                
                 To aggregate on a combination of the forwarded IP address with other aggregate keys, use [CUSTOM_KEYS].
                 
                 }
            {- [IP] - Aggregate the request counts on the IP address from the web request origin.
               
                To aggregate on a combination of the IP address with other aggregate keys, use [CUSTOM_KEYS].
                
                }
           
      }
       *)

  evaluation_window_sec: int option;
  (** 
    The amount of time, in seconds, that WAF should include in its request counts, looking back from the current time. For example, for a setting of 120, when WAF checks the rate, it counts the requests for the 2 minutes immediately preceding the current time. Valid settings are 60, 120, 300, and 600.
    
     This setting doesn't determine how often WAF checks the rate, but how far back it looks each time it checks. WAF checks the rate about every 10 seconds.
     
      Default: [300] (5 minutes)
       *)

  limit: int;
  [@ocaml.doc {| 
    The limit on requests per 5-minute period for a single aggregation instance for the rate-based rule. If the rate-based statement includes a [ScopeDownStatement], this limit is applied only to the requests that match the statement.
    
     Examples:
     
      {ul
           {- If you aggregate on just the IP address, this is the limit on requests from any single IP address.
              
              }
            {- If you aggregate on the HTTP method and the query argument name "city", then this is the limit on requests for any single method, city pair.
               
               }
           
      }
       |}]

} and statement = {
  regex_match_statement: regex_match_statement option;
  (** 
    A rule statement used to search web request components for a match against a single regular expression.
     *)

  label_match_statement: label_match_statement option;
  (** 
    A rule statement to match against labels that have been added to the web request by rules that have already run in the web ACL.
    
     The label match statement provides the label or namespace string to search for. The label string can represent a part or all of the fully qualified label name that had been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. If you do not provide the fully qualified name in your label match string, WAF performs the search for labels that were added in the same context as the label match statement.
      *)

  managed_rule_group_statement: managed_rule_group_statement option;
  (** 
    A rule statement used to run the rules that are defined in a managed rule group. To use this, provide the vendor name and the name of the rule group in this statement. You can retrieve the required names by calling [ListAvailableManagedRuleGroups].
    
     You cannot nest a [ManagedRuleGroupStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a managed rule group inside another rule group. You can only reference a managed rule group as a top-level statement within a rule that you define in a web ACL.
     
      You are charged additional fees when you use the WAF Bot Control managed rule group [AWSManagedRulesBotControlRuleSet], the WAF Fraud Control account takeover prevention (ATP) managed rule group [AWSManagedRulesATPRuleSet], or the WAF Fraud Control account creation fraud prevention (ACFP) managed rule group [AWSManagedRulesACFPRuleSet]. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
      
       *)

  not_statement: not_statement option;
  (** 
    A logical rule statement used to negate the results of another rule statement. You provide one [Statement] within the [NotStatement].
     *)

  or_statement: or_statement option;
  (** 
    A logical rule statement used to combine other rule statements with OR logic. You provide more than one [Statement] within the [OrStatement].
     *)

  and_statement: and_statement option;
  (** 
    A logical rule statement used to combine other rule statements with AND logic. You provide more than one [Statement] within the [AndStatement].
     *)

  rate_based_statement: rate_based_statement option;
  (** 
    A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast a rate. The rule categorizes requests according to your aggregation criteria, collects them into aggregation instances, and counts and rate limits the requests for each instance.
    
     If you change any of these settings in a rule that's currently in use, the change resets the rule's rate limiting counts. This can pause the rule's rate limiting activities for up to a minute.
     
      You can specify individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie.
      
       Each unique set of values for the aggregation keys that you specify is a separate aggregation instance, with the value from each key contributing to the aggregation instance definition.
       
        For example, assume the rule evaluates web requests with the following IP address and HTTP method values:
        
         {ul
              {- IP address 10.1.1.1, HTTP method POST
                 
                 }
               {- IP address 10.1.1.1, HTTP method GET
                  
                  }
               {- IP address 127.0.0.0, HTTP method POST
                  
                  }
               {- IP address 10.1.1.1, HTTP method GET
                  
                  }
              
      }
       The rule would create different aggregation instances according to your aggregation criteria, for example:
       
        {ul
             {- If the aggregation criteria is just the IP address, then each individual address is an aggregation instance, and WAF counts requests separately for each. The aggregation instances and request counts for our example would be the following:
                
                 {ul
                      {- IP address 10.1.1.1: count 3
                         
                         }
                       {- IP address 127.0.0.0: count 1
                          
                          }
                      
               }
               }
              {- If the aggregation criteria is HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances and request counts for our example would be the following:
                 
                  {ul
                       {- HTTP method POST: count 2
                          
                          }
                        {- HTTP method GET: count 2
                           
                           }
                       
               }
               }
              {- If the aggregation criteria is IP address and HTTP method, then each IP address and each HTTP method would contribute to the combined aggregation instance. The aggregation instances and request counts for our example would be the following:
                 
                  {ul
                       {- IP address 10.1.1.1, HTTP method POST: count 1
                          
                          }
                        {- IP address 10.1.1.1, HTTP method GET: count 2
                           
                           }
                        {- IP address 127.0.0.0, HTTP method POST: count 1
                           
                           }
                       
               }
               }
             
      }
       For any n-tuple of aggregation keys, each unique combination of values for the keys defines a separate aggregation instance, which WAF counts and rate-limits individually.
       
        You can optionally nest another statement inside the rate-based statement, to narrow the scope of the rule so that it only counts and rate limits requests that match the nested statement. You can use this nested scope-down statement in conjunction with your aggregation key specifications or you can just count and rate limit all requests that match the scope-down statement, without additional aggregation. When you choose to just manage all requests that match a scope-down statement, the aggregation instance is singular for the rule.
        
         You cannot nest a [RateBasedStatement] inside another statement, for example inside a [NotStatement] or [OrStatement]. You can define a [RateBasedStatement] inside a web ACL and inside a rule group.
         
          For additional information about the options, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html}Rate limiting web requests using rate-based rules} in the {i WAF Developer Guide}.
          
           If you only aggregate on the individual IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently rate limiting for a rule through the API call [GetRateBasedStatementManagedKeys]. This option is not available for other aggregation configurations.
           
            WAF tracks and manages web requests separately for each instance of a rate-based rule that you use. For example, if you provide the same rate-based rule settings in two web ACLs, each of the two rule statements represents a separate instance of the rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule inside a rule group, and then use that rule group in multiple places, each use creates a separate instance of the rate-based rule that gets its own tracking and management by WAF.
             *)

  regex_pattern_set_reference_statement: regex_pattern_set_reference_statement option;
  (** 
    A rule statement used to search web request components for matches with regular expressions. To use this, create a [RegexPatternSet] that specifies the expressions that you want to detect, then use the ARN of that set in this statement. A web request matches the pattern set rule statement if the request component matches any of the patterns in the set. To create a regex pattern set, see [CreateRegexPatternSet].
    
     Each regex pattern set rule statement references a regex pattern set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.
      *)

  ip_set_reference_statement: ip_set_reference_statement option;
  (** 
    A rule statement used to detect web requests coming from particular IP addresses or address ranges. To use this, create an [IPSet] that specifies the addresses you want to detect, then use the ARN of that set in this statement. To create an IP set, see [CreateIPSet].
    
     Each IP set rule statement references an IP set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.
      *)

  rule_group_reference_statement: rule_group_reference_statement option;
  (** 
    A rule statement used to run the rules that are defined in a [RuleGroup]. To use this, create a rule group with your rules, then provide the ARN of the rule group in this statement.
    
     You cannot nest a [RuleGroupReferenceStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a rule group reference statement inside another rule group. You can only reference a rule group as a top-level statement within a rule that you define in a web ACL.
      *)

  geo_match_statement: geo_match_statement option;
  (** 
    A rule statement that labels web requests by country and region and that matches against web requests based on country code. A geo match rule labels every request that it inspects regardless of whether it finds a match.
    
     {ul
          {- To manage requests only by country, you can use this statement by itself and specify the countries that you want to match against in the [CountryCodes] array.
             
             }
           {- Otherwise, configure your geo match rule with Count action so that it only labels requests. Then, add one or more label match rules to run after the geo match rule and configure them to match against the geographic labels and handle the requests as needed.
              
              }
          
      }
       WAF labels requests using the alpha-2 country and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF determines the codes using either the IP address in the web request origin or, if you specify it, the address in the geo match [ForwardedIPConfig].
       
        If you use the web request origin, the label formats are 
        {[
        awswaf:clientip:geo:region:-
        ]}
         and 
        {[
        awswaf:clientip:geo:country:
        ]}
        .
        
         If you use a forwarded IP address, the label formats are 
         {[
         awswaf:forwardedip:geo:region:-
         ]}
          and 
         {[
         awswaf:forwardedip:geo:country:
         ]}
         .
         
          For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html}Geographic match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}.
           *)

  size_constraint_statement: size_constraint_statement option;
  (** 
    A rule statement that compares a number of bytes against the size of a request component, using a comparison operator, such as greater than (>) or less than (<). For example, you can use a size constraint statement to look for query strings that are longer than 100 bytes.
    
     If you configure WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit for the web ACL and protected resource type. If you know that the request body for your web requests should never exceed the inspection limit, you can use a size constraint statement to block requests that have a larger request body size. For more information about the inspection limits, see [Body] and [JsonBody] settings for the [FieldToMatch] data type.
     
      If you choose URI for the value of Part of the request to filter on, the slash (/) in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.
       *)

  xss_match_statement: xss_match_statement option;
  (** 
    A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into other legitimate web browsers.
     *)

  sqli_match_statement: sqli_match_statement option;
  (** 
    A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web requests to do things like modify your database or extract data from it.
     *)

  byte_match_statement: byte_match_statement option;
  (** 
    A rule statement that defines a string match search for WAF to apply to web requests. The byte match statement provides the bytes to search for, the location in requests that you want WAF to search, and other settings. The bytes to search for are typically a string that corresponds with ASCII characters. In the WAF console and the developer guide, this is called a string match statement.
     *)

}

[@@ocaml.doc {| 
    Specifies that WAF should do nothing. This is used for the [OverrideAction] setting on a [Rule] when the rule uses a rule group reference statement.
    
     This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction].
     
      JSON specification: ["None": {}]
       |}]
type none_action = unit

(** 
    The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only.
    
     You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement].
     
      This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings.
      
       *)
type override_action = {
  none: none_action option;
  (** 
    Don't override the rule group evaluation result. This is the most common setting.
     *)

  count: count_action option;
  (** 
    Override the rule group evaluation result to count only.
    
     This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings.
     
      *)

}

(** 
    A single label container. This is used as an element of a label array in multiple contexts, for example, in [RuleLabels] inside a [Rule] and in [Labels] inside a [SampledHTTPRequest].
     *)
type label = {
  name: string;
  (** 
    The label string.
     *)

}

(** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)
type visibility_config = {
  metric_name: string;
  (** 
    A name of the Amazon CloudWatch metric dimension. The name can contain only the characters: A-Z, a-z, 0-9, - (hyphen), and _ (underscore). The name can be from one to 128 characters long. It can't contain whitespace or metric names that are reserved for WAF, for example [All] and [Default_Action].
     *)

  cloud_watch_metrics_enabled: bool;
  (** 
    Indicates whether the associated resource sends metrics to Amazon CloudWatch. For the list of available metrics, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#waf-metrics}WAF Metrics} in the {i WAF Developer Guide}.
    
     For web ACLs, the metrics are for web requests that have the web ACL default action applied. WAF applies the default action to web requests that pass the inspection of all rules in the web ACL without being either allowed or blocked. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-default-action.html}The web ACL default action} in the {i WAF Developer Guide}.
      *)

  sampled_requests_enabled: bool;
  (** 
    Indicates whether WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the WAF console.
    
     Request sampling doesn't provide a field redaction option, and any field redaction that you specify in your logging configuration doesn't affect sampling. The only way to exclude fields from request sampling is by disabling sampling in the web ACL visibility configuration.
     
      *)

}

(** 
    Used for CAPTCHA and challenge token settings. Determines how long a [CAPTCHA] or challenge timestamp remains valid after WAF updates it for a successful [CAPTCHA] or challenge response.
     *)
type immunity_time_property = {
  immunity_time: int;
  (** 
    The amount of time, in seconds, that a [CAPTCHA] or challenge timestamp is considered valid by WAF. The default setting is 300.
    
     For the Challenge action, the minimum setting is 300.
      *)

}

(** 
    Specifies how WAF should handle [CAPTCHA] evaluations. This is available at the web ACL level and in each rule.
     *)
type captcha_config = {
  immunity_time_property: immunity_time_property option;
  (** 
    Determines how long a [CAPTCHA] timestamp in the token remains valid after the client successfully solves a [CAPTCHA] puzzle.
     *)

}

(** 
    Specifies how WAF should handle [Challenge] evaluations. This is available at the web ACL level and in each rule.
     *)
type challenge_config = {
  immunity_time_property: immunity_time_property option;
  (** 
    Determines how long a challenge timestamp in the token remains valid after the client successfully responds to a challenge.
     *)

}

(** 
    A single rule, which you can use in a [WebACL] or [RuleGroup] to identify web requests that you want to manage in some way. Each rule includes one top-level [Statement] that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)
type rule = {
  challenge_config: challenge_config option;
  (** 
    Specifies how WAF should handle [Challenge] evaluations. If you don't specify this, WAF uses the challenge configuration that's defined for the web ACL.
     *)

  captcha_config: captcha_config option;
  (** 
    Specifies how WAF should handle [CAPTCHA] evaluations. If you don't specify this, WAF uses the [CAPTCHA] configuration that's defined for the web ACL.
     *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
    
     If you change the name of a [Rule] after you create it and you want the rule's metric name to reflect the change, update the metric name as well. WAF doesn't automatically update the metric name.
      *)

  rule_labels: label list option;
  (** 
    Labels to apply to web requests that match the rule match statement. WAF applies fully qualified labels to matching web requests. A fully qualified label is the concatenation of a label namespace and a rule label. The rule's rule group or web ACL defines the label namespace.
    
     Rules that run after this rule in the web ACL can match against these labels using a [LabelMatchStatement].
     
      For each label, provide a case-sensitive string containing optional namespaces and a label name, according to the following guidelines:
      
       {ul
            {- Separate each component of the label with a colon.
               
               }
             {- Each namespace or name can have up to 128 characters.
                
                }
             {- You can specify up to 5 namespaces in a label.
                
                }
             {- Don't use the following reserved words in your label specification: [aws], [waf], [managed], [rulegroup], [webacl], [regexpatternset], or [ipset].
                
                }
            
      }
       For example, [myLabelName] or [nameSpace1:nameSpace2:myLabelName].
        *)

  override_action: override_action option;
  (** 
    The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only.
    
     You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement].
     
      This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings.
      
       *)

  action: rule_action option;
  (** 
    The action that WAF should take on a web request when it matches the rule statement. Settings at the web ACL level can override the rule action setting.
    
     This is used only for rules whose statements do not reference a rule group. Rule statements that reference a rule group include [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement].
     
      You must specify either this [Action] setting or the rule [OverrideAction] setting, but not both:
      
       {ul
            {- If the rule statement does not reference a rule group, use this rule action setting and not the rule override action setting.
               
               }
             {- If the rule statement references a rule group, use the override action setting and not this action setting.
                
                }
            
      }
       *)

  statement: statement;
  (** 
    The WAF processing statement for the rule, for example [ByteMatchStatement] or [SizeConstraintStatement].
     *)

  priority: int;
  (** 
    If you define more than one [Rule] in a [WebACL], WAF evaluates each request against the [Rules] in order based on the value of [Priority]. WAF processes rules with lower priority first. The priorities don't need to be consecutive, but they must all be different.
     *)

  name: string;
  (** 
    The name of the rule.
    
     If you change the name of a [Rule] after you create it and you want the rule's metric name to reflect the change, update the metric name in the rule's [VisibilityConfig] settings. WAF doesn't automatically update the metric name when you update the rule name.
      *)

}

(** 
    The processing guidance for an Firewall Manager rule. This is like a regular rule [Statement], but it can only contain a single rule group reference.
     *)
type firewall_manager_statement = {
  rule_group_reference_statement: rule_group_reference_statement option;
  (** 
    A statement used by Firewall Manager to run the rules that are defined in a rule group. This is managed by Firewall Manager for an Firewall Manager WAF policy.
     *)

  managed_rule_group_statement: managed_rule_group_statement option;
  (** 
    A statement used by Firewall Manager to run the rules that are defined in a managed rule group. This is managed by Firewall Manager for an Firewall Manager WAF policy.
     *)

}

(** 
    A rule group that's defined for an Firewall Manager WAF policy.
     *)
type firewall_manager_rule_group = {
  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  override_action: override_action;
  (** 
    The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only.
    
     You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement].
     
      This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings.
      
       *)

  firewall_manager_statement: firewall_manager_statement;
  (** 
    The processing guidance for an Firewall Manager rule. This is like a regular rule [Statement], but it can only contain a rule group reference.
     *)

  priority: int;
  (** 
    If you define more than one rule group in the first or last Firewall Manager rule groups, WAF evaluates each request against the rule groups in order, starting from the lowest priority setting. The priorities don't need to be consecutive, but they must all be different.
     *)

  name: string;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type response_content_type = | APPLICATION_JSON
  | TEXT_HTML
  | TEXT_PLAIN

(** 
    The response body to use in a custom response to a web request. This is referenced by key from [CustomResponse] [CustomResponseBodyKey].
     *)
type custom_response_body = {
  content: string;
  (** 
    The payload of the custom response.
    
     You can use JSON escape strings in JSON content. To do this, you must specify JSON content in the [ContentType] setting.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  content_type: response_content_type;
  (** 
    The type of content in the payload that you are defining in the [Content] string.
     *)

}

type size_inspection_limit = | KB_64
  | KB_48
  | KB_32
  | KB_16

[@@ocaml.doc {| 
    Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size is 16 KB (16,384 bytes). You can change the setting for any of the available resource types.
    
     You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
     
      Example JSON: [ {
    "API_GATEWAY": "KB_48",
    "APP_RUNNER_SERVICE": "KB_32"
    }]
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
       
        This is used in the [AssociationConfig] of the web ACL.
         |}]
type request_body_associated_resource_type_config = {
  default_size_inspection_limit: size_inspection_limit;
  (** 
    Specifies the maximum size of the web request body component that an associated CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resource should send to WAF for inspection. This applies to statements in the web ACL that inspect the body or JSON body.
    
     Default: [16 KB (16,384 bytes)]
      *)

}

type associated_resource_type = | VERIFIED_ACCESS_INSTANCE
  | APP_RUNNER_SERVICE
  | COGNITO_USER_POOL
  | API_GATEWAY
  | CLOUDFRONT

(** 
    Specifies custom configurations for the associations between the web ACL and protected resources.
    
     Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes).
     
      You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
        *)
type association_config = {
  request_body: (string * request_body_associated_resource_type_config) list option;
  [@ocaml.doc {| 
    Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size is 16 KB (16,384 bytes). You can change the setting for any of the available resource types.
    
     You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
     
      Example JSON: [ {
    "API_GATEWAY": "KB_48",
    "APP_RUNNER_SERVICE": "KB_32"
    }]
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
        |}]

}

(** 
    A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resources can be an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
     *)
type web_ac_l = {
  association_config: association_config option;
  (** 
    Specifies custom configurations for the associations between the web ACL and protected resources.
    
     Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes).
     
      You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
        *)

  token_domains: string list option;
  (** 
    Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.
     *)

  challenge_config: challenge_config option;
  (** 
    Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig].
     *)

  captcha_config: captcha_config option;
  (** 
    Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig].
     *)

  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  label_namespace: string option;
  (** 
    The label namespace prefix for this web ACL. All labels added by rules in this web ACL have this prefix.
    
     {ul
          {- The syntax for the label namespace prefix for a web ACL is the following:
             
              
              {[
              awswaf::webacl::
              ]}
              
              
              }
           {- When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon:
              
               
               {[
               :
               ]}
               
               
               }
          
      }
       *)

  managed_by_firewall_manager: bool option;
  (** 
    Indicates whether this web ACL is managed by Firewall Manager. If true, then only Firewall Manager can delete the web ACL or any Firewall Manager rule groups in the web ACL.
     *)

  post_process_firewall_manager_rule_groups: firewall_manager_rule_group list option;
  (** 
    The last set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF policy and contains only rule group references. You can't alter these. Any rules and rule groups that you define for the web ACL are prioritized before these.
    
     In the Firewall Manager WAF policy, the Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a set of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to determine their relative processing order.
      *)

  pre_process_firewall_manager_rule_groups: firewall_manager_rule_group list option;
  (** 
    The first set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF policy and contains only rule group references. You can't alter these. Any rules and rule groups that you define for the web ACL are prioritized after these.
    
     In the Firewall Manager WAF policy, the Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a set of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to determine their relative processing order.
      *)

  capacity: int option;
  (** 
    The web ACL capacity units (WCUs) currently being used by this web ACL.
    
     WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}.
      *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the web ACL that helps with identification.
     *)

  default_action: default_action;
  (** 
    The action to perform if none of the [Rules] contained in the [WebACL] match.
     *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.
     *)

  id: string;
  (** 
    A unique identifier for the [WebACL]. This ID is returned in the responses to create and list commands. You use this ID to do things like get, update, and delete a [WebACL].
     *)

  name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

(** 
    The rule that you've named doesn't aggregate solely on the IP address or solely on the forwarded IP address. This call is only available for rate-based rules with an [AggregateKeyType] setting of [IP] or [FORWARDED_IP].
     *)
type waf_unsupported_aggregate_key_type_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t retrieve a resource that you specified for this operation. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate. Verify the resources that you are specifying in your request parameters and then retry the operation.
     *)
type waf_unavailable_entity_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t perform your tagging operation because of an internal error. Retry your request.
     *)
type waf_tag_operation_internal_error_exception = {
  message: string option;
  
}

(** 
    An error occurred during the tagging operation. Retry your request.
     *)
type waf_tag_operation_exception = {
  message: string option;
  
}

(** 
    You tried to use a managed rule group that's available by subscription, but you aren't subscribed to it yet.
     *)
type waf_subscription_not_found_exception = {
  message: string option;
  
}

(** 
    WAF is not able to access the service linked role. This can be caused by a previous [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. Please try your request again. The service linked role can also be locked by a previous [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you recently made a call to [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. If you receive this same exception again, you will have to wait additional time until the role is unlocked.
     *)
type waf_service_linked_role_error_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t save your changes because you tried to update or delete a resource that has changed since you last retrieved it. Get the resource again, make any changes you need to make to the new copy, and retry your operation.
     *)
type waf_optimistic_lock_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t perform the operation because your resource doesn't exist. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate.
     *)
type waf_nonexistent_item_exception = {
  message: string option;
  
}

(** 
    The operation failed because you don't have the permissions that your logging configuration requires. For information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.
     *)
type waf_log_destination_permission_issue_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t perform the operation because you exceeded your resource limit. For example, the maximum number of [WebACL] objects that you can create for an Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
     *)
type waf_limits_exceeded_exception = {
  source_type: string option;
  (** 
    Source type for the exception.
     *)

  message: string option;
  
}

(** 
    WAF couldn’t perform the operation because the resource that you requested isn’t valid. Check the resource, and try again.
     *)
type waf_invalid_resource_exception = {
  message: string option;
  
}

(** 
    The operation failed because the specified policy isn't in the proper format.
    
     The policy specifications must conform to the following:
     
      {ul
           {- The policy must be composed using IAM Policy version 2012-10-17.
              
              }
            {- The policy must include specifications for [Effect], [Action], and [Principal].
               
               }
            {- [Effect] must specify [Allow].
               
               }
            {- [Action] must specify [wafv2:CreateWebACL], [wafv2:UpdateWebACL], and [wafv2:PutFirewallManagerRuleGroups] and may optionally specify [wafv2:GetRuleGroup]. WAF rejects any extra actions or wildcard actions in the policy.
               
               }
            {- The policy must not include a [Resource] parameter.
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}.
        *)
type waf_invalid_permission_policy_exception = {
  message: string option;
  
}

type parameter_exception_field = | ACP_RULE_SET_RESPONSE_INSPECTION
  | CUSTOM_KEYS
  | SCOPE_DOWN
  | ASSOCIATED_RESOURCE_TYPE
  | ATP_RULE_SET_RESPONSE_INSPECTION
  | TOKEN_DOMAIN
  | CHALLENGE_CONFIG
  | OVERSIZE_HANDLING
  | MAP_MATCH_SCOPE
  | COOKIE_MATCH_PATTERN
  | HEADER_MATCH_PATTERN
  | PAYLOAD_TYPE
  | MANAGED_RULE_GROUP_CONFIG
  | LOG_DESTINATION
  | ASSOCIABLE_RESOURCE
  | CHANGE_PROPAGATION_STATUS
  | EXPIRE_TIMESTAMP
  | FILTER_CONDITION
  | LOGGING_FILTER
  | BODY_PARSING_FALLBACK_BEHAVIOR
  | JSON_MATCH_SCOPE
  | JSON_MATCH_PATTERN
  | CUSTOM_RESPONSE_BODY
  | CUSTOM_RESPONSE
  | RESPONSE_CONTENT_TYPE
  | CUSTOM_REQUEST_HANDLING
  | HEADER_NAME
  | IP_SET_FORWARDED_IP_CONFIG
  | FORWARDED_IP_CONFIG
  | POSITION
  | FALLBACK_BEHAVIOR
  | FIREWALL_MANAGER_STATEMENT
  | METRIC_NAME
  | TAG_KEYS
  | TAGS
  | RESOURCE_TYPE
  | RESOURCE_ARN
  | SCOPE_VALUE
  | OVERRIDE_ACTION
  | ENTITY_LIMIT
  | RULE_ACTION
  | DEFAULT_ACTION
  | SINGLE_HEADER
  | SINGLE_QUERY_ARGUMENT
  | TEXT_TRANSFORMATION
  | FIELD_TO_MATCH
  | IP_ADDRESS_VERSION
  | IP_ADDRESS
  | NOT_STATEMENT
  | OR_STATEMENT
  | AND_STATEMENT
  | LABEL_MATCH_STATEMENT
  | MANAGED_RULE_SET_STATEMENT
  | IP_SET_REFERENCE_STATEMENT
  | REGEX_PATTERN_REFERENCE_STATEMENT
  | RULE_GROUP_REFERENCE_STATEMENT
  | RATE_BASED_STATEMENT
  | GEO_MATCH_STATEMENT
  | SIZE_CONSTRAINT_STATEMENT
  | XSS_MATCH_STATEMENT
  | SQLI_MATCH_STATEMENT
  | BYTE_MATCH_STATEMENT
  | STATEMENT
  | EXCLUDED_RULE
  | RULE
  | MANAGED_RULE_SET
  | IP_SET
  | REGEX_PATTERN_SET
  | RULE_GROUP
  | WEB_ACL

(** 
    The operation failed because WAF didn't recognize a parameter in the request. For example:
    
     {ul
          {- You specified a parameter name or value that isn't valid.
             
             }
           {- Your nested statement isn't valid. You might have tried to nest a statement that can’t be nested.
              
              }
           {- You tried to update a [WebACL] with a [DefaultAction] that isn't among the types available at [DefaultAction].
              
              }
           {- Your request references an ARN that is malformed, or corresponds to a resource with which a web ACL can't be associated.
              
              }
          
      }
       *)
type waf_invalid_parameter_exception = {
  reason: string option;
  (** 
    Additional information about the exception.
     *)

  parameter: string option;
  (** 
    The invalid parameter that resulted in the exception.
     *)

  field: parameter_exception_field option;
  (** 
    The settings where the invalid parameter was found.
     *)

  message: string option;
  
}

(** 
    The operation isn't valid.
     *)
type waf_invalid_operation_exception = {
  message: string option;
  
}

(** 
    Your request is valid, but WAF couldn’t perform the operation because of a system problem. Retry your request.
     *)
type waf_internal_error_exception = {
  message: string option;
  
}

(** 
    The operation failed because the specified version for the managed rule group has expired. You can retrieve the available versions for the managed rule group by calling [ListAvailableManagedRuleGroupVersions].
     *)
type waf_expired_managed_rule_group_version_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t perform the operation because the resource that you tried to save is a duplicate of an existing one.
     *)
type waf_duplicate_item_exception = {
  message: string option;
  
}

(** 
    The operation failed because you are inspecting the web request body, headers, or cookies without specifying how to handle oversize components. Rules that inspect the body must either provide an [OversizeHandling] configuration or they must be preceded by a [SizeConstraintStatement] that blocks the body content from being too large. Rules that inspect the headers or cookies must provide an [OversizeHandling] configuration.
    
     Provide the handling configuration and retry your operation.
     
      Alternately, you can suppress this warning by adding the following tag to the resource that you provide to this operation: [Tag] (key:[WAF:OversizeFieldsHandlingConstraintOptOut], value:[true]).
       *)
type waf_configuration_warning_exception = {
  message: string option;
  
}

(** 
    WAF couldn’t perform the operation because your resource is being used by another resource or it’s associated with another resource.
     *)
type waf_associated_item_exception = {
  message: string option;
  
}

(** 
    A version of the named managed rule group, that the rule group's vendor publishes for use by customers.
    
     This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
     
      Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].
      
       *)
type version_to_publish = {
  forecasted_lifetime: int option;
  (** 
    The amount of time the vendor expects this version of the managed rule group to last, in days.
     *)

  associated_rule_group_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the vendor's rule group that's used in the published managed rule group version.
     *)

}

type update_web_acl_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken].
     *)

}

type scope = | REGIONAL
  | CLOUDFRONT

type update_web_acl_request = {
  association_config: association_config option;
  (** 
    Specifies custom configurations for the associations between the web ACL and protected resources.
    
     Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes).
     
      You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
        *)

  token_domains: string list option;
  [@ocaml.doc {| 
    Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.
    
     Example JSON: ["TokenDomains": { "mywebsite.com", "myotherwebsite.com" }]
     
      Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.
       |}]

  challenge_config: challenge_config option;
  (** 
    Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig].
     *)

  captcha_config: captcha_config option;
  (** 
    Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig].
     *)

  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the web ACL that helps with identification.
     *)

  default_action: default_action;
  (** 
    The action to perform if none of the [Rules] contained in the [WebACL] match.
     *)

  id: string;
  (** 
    The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

type update_rule_group_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken].
     *)

}

type update_rule_group_request = {
  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the rule group that helps with identification.
     *)

  id: string;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type update_regex_pattern_set_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken].
     *)

}

(** 
    A single regular expression. This is used in a [RegexPatternSet].
     *)
type regex = {
  regex_string: string option;
  (** 
    The string representing the regular expression.
     *)

}

type update_regex_pattern_set_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  regular_expression_list: regex list;
  (** 
    
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the set. You cannot change the name after you create the set.
     *)

}

type update_managed_rule_set_version_expiry_date_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  expiry_timestamp: float option;
  [@ocaml.doc {| 
    The time that the version will expire.
    
     Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".
      |}]

  expiring_version: string option;
  (** 
    The version that is set to expire.
     *)

}

type update_managed_rule_set_version_expiry_date_request = {
  expiry_timestamp: float;
  [@ocaml.doc {| 
    The time that you want the version to expire.
    
     Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".
      |}]

  version_to_expire: string;
  (** 
    The version that you want to remove from your list of offerings for the named managed rule group.
     *)

  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.
    
     This name is assigned to the corresponding managed rule group, which your customers can access and use.
      *)

}

type update_ip_set_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken].
     *)

}

type update_ip_set_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  addresses: string list;
  [@ocaml.doc {| 
    Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0].
    
     Example address strings:
     
      {ul
           {- For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].
              
              }
            {- For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].
               
               }
            {- For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].
               
               }
            {- For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].
               
               }
           
      }
       For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
       
        Example JSON [Addresses] specifications:
        
         {ul
              {- Empty array: ["Addresses": \[\]]
                 
                 }
               {- Array with one address: ["Addresses": \["192.0.2.44/32"\]]
                  
                  }
               {- Array with three addresses: ["Addresses": \["192.0.2.44/32", "192.0.2.0/24", "192.0.0.0/16"\]]
                  
                  }
               {- INVALID specification: ["Addresses": \[""\]] INVALID
                  
                  }
              
      }
       |}]

  description: string option;
  (** 
    A description of the IP set that helps with identification.
     *)

  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    An array of keys identifying the tags to disassociate from the resource.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource.
     *)

}

[@@ocaml.doc {| 
    In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time range for which you want WAF to return a sample of web requests.
    
     You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     
      In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the time range for which WAF actually returned a sample of web requests. WAF gets the specified number of requests from among the first 5,000 requests that your Amazon Web Services resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, WAF stops sampling after the 5,000th request. In that case, [EndTime] is the time that WAF received the 5,000th request.
       |}]
type time_window = {
  end_time: float;
  [@ocaml.doc {| 
    The end of the time range from which you want [GetSampledRequests] to return a sample of the requests that your Amazon Web Services resource received. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     |}]

  start_time: float;
  [@ocaml.doc {| 
    The beginning of the time range from which you want [GetSampledRequests] to return a sample of the requests that your Amazon Web Services resource received. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     |}]

}

type tag_resource_response = unit

[@@ocaml.doc {| 
    A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as "environment", and the tag value represents a specific value within that category, such as "test," "development," or "production". Or you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.
    
     You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console.
      |}]
type tag = {
  value: string;
  [@ocaml.doc {| 
    Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as "companyA" or "companyB." Tag values are case-sensitive.
     |}]

  key: string;
  [@ocaml.doc {| 
    Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as "customer." Tag keys are case-sensitive.
     |}]

}

type tag_resource_request = {
  tags: tag list;
  (** 
    An array of key:value pairs to associate with the resource.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource.
     *)

}

[@@ocaml.doc {| 
    The collection of tagging definitions for an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as "environment", and the tag value represents a specific value within that category, such as "test," "development," or "production". Or you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.
    
     You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console.
      |}]
type tag_info_for_resource = {
  tag_list: tag list option;
  (** 
    The array of [Tag] objects defined for the resource.
     *)

  resource_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the resource.
     *)

}

(** 
    Part of the response from [GetSampledRequests]. This is a complex type that appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all of the headers that appear in one of the web requests.
     *)
type http_header = {
  value: string option;
  (** 
    The value of the HTTP header.
     *)

  name: string option;
  (** 
    The name of the HTTP header.
     *)

}

(** 
    Part of the response from [GetSampledRequests]. This is a complex type that appears as [Request] in the response syntax. [HTTPRequest] contains information about one of the web requests.
     *)
type http_request = {
  headers: http_header list option;
  (** 
    A complex type that contains the name and value for each header in the sampled web request.
     *)

  http_version: string option;
  (** 
    The HTTP version specified in the sampled web request, for example, [HTTP/1.1].
     *)

  method_: string option;
  (** 
    The HTTP method specified in the sampled web request.
     *)

  ur_i: string option;
  (** 
    The URI path of the request, which identifies the resource, for example, [/images/daily-ad.jpg].
     *)

  country: string option;
  (** 
    The two-letter country code for the country that the request originated from. For a current list of country codes, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}ISO 3166-1 alpha-2}.
     *)

  client_i_p: string option;
  (** 
    The IP address that the request originated from. If the web ACL is associated with a CloudFront distribution, this is the value of one of the following fields in CloudFront access logs:
    
     {ul
          {- [c-ip], if the viewer did not use an HTTP proxy or a load balancer to send the request
             
             }
           {- [x-forwarded-for], if the viewer did use an HTTP proxy or a load balancer to send the request
              
              }
          
      }
       *)

}

type failure_reason = | TOKEN_DOMAIN_MISMATCH
  | TOKEN_INVALID
  | TOKEN_EXPIRED
  | TOKEN_MISSING

(** 
    The result from the inspection of the web request for a valid [CAPTCHA] token.
     *)
type captcha_response = {
  failure_reason: failure_reason option;
  (** 
    The reason for failure, populated when the evaluation of the token fails.
     *)

  solve_timestamp: int option;
  (** 
    The time that the [CAPTCHA] was last solved for the supplied token.
     *)

  response_code: int option;
  (** 
    The HTTP response code indicating the status of the [CAPTCHA] token in the web request. If the token is missing, invalid, or expired, this code is [405 Method
            Not Allowed].
     *)

}

(** 
    The result from the inspection of the web request for a valid challenge token.
     *)
type challenge_response = {
  failure_reason: failure_reason option;
  (** 
    The reason for failure, populated when the evaluation of the token fails.
     *)

  solve_timestamp: int option;
  (** 
    The time that the challenge was last solved for the supplied token.
     *)

  response_code: int option;
  (** 
    The HTTP response code indicating the status of the challenge token in the web request. If the token is missing, invalid, or expired, this code is [202 Request Accepted].
     *)

}

(** 
    Represents a single sampled web request. The response from [GetSampledRequests] includes a [SampledHTTPRequests] complex type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains an array of [SampledHTTPRequest] objects.
     *)
type sampled_http_request = {
  overridden_action: string option;
  (** 
    Used only for rule group rules that have a rule action override in place in the web ACL. This is the action that the rule group rule is configured for, and not the action that was applied to the request. The action that WAF applied is the [Action] value.
     *)

  challenge_response: challenge_response option;
  (** 
    The [Challenge] response for the request.
     *)

  captcha_response: captcha_response option;
  (** 
    The [CAPTCHA] response for the request.
     *)

  labels: label list option;
  (** 
    Labels applied to the web request by matching rules. WAF applies fully qualified labels to matching web requests. A fully qualified label is the concatenation of a label namespace and a rule label. The rule's rule group or web ACL defines the label namespace.
    
     For example, [awswaf:111122223333:myRuleGroup:testRules:testNS1:testNS2:labelNameA] or [awswaf:managed:aws:managed-rule-set:header:encoding:utf8].
      *)

  response_code_sent: int option;
  (** 
    The response code that was sent for the request.
     *)

  request_headers_inserted: http_header list option;
  (** 
    Custom request headers inserted by WAF into the request, according to the custom request configuration for the matching rule action.
     *)

  rule_name_within_rule_group: string option;
  (** 
    The name of the [Rule] that the request matched. For managed rule groups, the format for this name is 
    {[
    ##
    ]}
    . For your own rule groups, the format for this name is 
    {[
    #
    ]}
    . If the rule is not in a rule group, this field is absent.
     *)

  action: string option;
  (** 
    The action that WAF applied to the request.
     *)

  timestamp_: float option;
  (** 
    The time at which WAF received the request from your Amazon Web Services resource, in Unix time format (in seconds).
     *)

  weight: int;
  (** 
    A value that indicates how one result in the response relates proportionally to other results in the response. For example, a result that has a weight of [2] represents roughly twice as many web requests as a result that has a weight of [1].
     *)

  request: http_request;
  (** 
    A complex type that contains detailed information about the request.
     *)

}

(** 
    High-level information about a [Rule], returned by operations like [DescribeManagedRuleGroup]. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].
     *)
type rule_summary = {
  action: rule_action option;
  (** 
    The action that WAF should take on a web request when it matches a rule's statement. Settings at the web ACL level can override the rule action setting.
     *)

  name: string option;
  (** 
    The name of the rule.
     *)

}

(** 
    High-level information about a [RuleGroup], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].
     *)
type rule_group_summary = {
  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  description: string option;
  (** 
    A description of the rule group that helps with identification.
     *)

  id: string option;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string option;
  (** 
    The name of the data type instance. You cannot change the name after you create the instance.
     *)

}

(** 
    List of labels used by one or more of the rules of a [RuleGroup]. This summary object is used for the following rule group lists:
    
     {ul
          {- [AvailableLabels] - Labels that rules add to matching requests. These labels are defined in the [RuleLabels] for a [Rule].
             
             }
           {- [ConsumedLabels] - Labels that rules match against. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule.
              
              }
          
      }
       *)
type label_summary = {
  name: string option;
  (** 
    An individual label specification.
     *)

}

(** 
    A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements.
     *)
type rule_group = {
  consumed_labels: label_summary list option;
  (** 
    The labels that one or more rules in this rule group match against in label match statements. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule.
     *)

  available_labels: label_summary list option;
  (** 
    The labels that one or more rules in this rule group add to matching web requests. These labels are defined in the [RuleLabels] for a [Rule].
     *)

  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  label_namespace: string option;
  (** 
    The label namespace prefix for this rule group. All labels added by rules in this rule group have this prefix.
    
     {ul
          {- The syntax for the label namespace prefix for your rule groups is the following:
             
              
              {[
              awswaf::rulegroup::
              ]}
              
              
              }
           {- When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon:
              
               
               {[
               :
               ]}
               
               
               }
          
      }
       *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the rule group that helps with identification.
     *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  capacity: int;
  (** 
    The web ACL capacity units (WCUs) required for this rule group.
    
     When you create your own rule group, you define this, and you cannot change it after creation. When you add or modify the rules in a rule group, WAF enforces this limit. You can check the capacity for a set of rules using [CheckCapacity].
     
      WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}.
       *)

  id: string;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type resource_type = | VERIFIED_ACCESS_INSTANCE
  | APP_RUNNER_SERVICE
  | COGNITIO_USER_POOL
  | APPSYNC
  | API_GATEWAY
  | APPLICATION_LOAD_BALANCER

(** 
    High level information for an SDK release.
     *)
type release_summary = {
  timestamp_: float option;
  (** 
    The timestamp of the release.
     *)

  release_version: string option;
  (** 
    The release version.
     *)

}

(** 
    High-level information about a [RegexPatternSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RegexPatternSet], and the ARN, that you provide to the [RegexPatternSetReferenceStatement] to use the pattern set in a [Rule].
     *)
type regex_pattern_set_summary = {
  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  id: string option;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string option;
  (** 
    The name of the data type instance. You cannot change the name after you create the instance.
     *)

}

(** 
    Contains one or more regular expressions.
    
     WAF assigns an ARN to each [RegexPatternSet] that you create. To use a set in a rule, you provide the ARN to the [Rule] statement [RegexPatternSetReferenceStatement].
      *)
type regex_pattern_set = {
  regular_expression_list: regex list option;
  (** 
    The regular expression patterns in the set.
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  id: string option;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string option;
  (** 
    The name of the set. You cannot change the name after you create the set.
     *)

}

type ip_address_version = | IPV6
  | IPV4

(** 
    The set of IP addresses that are currently blocked for a [RateBasedStatement]. This is only available for rate-based rules that aggregate on just the IP address, with the [AggregateKeyType] set to [IP] or [FORWARDED_IP].
    
     A rate-based rule applies its rule action to requests from IP addresses that are in the rule's managed keys list and that match the rule's scope-down statement. When a rule has no scope-down statement, it applies the action to all requests from the IP addresses that are in the list. The rule applies its rule action to rate limit the matching requests. The action is usually Block but it can be any valid rule action except for Allow.
     
      The maximum number of IP addresses that can be rate limited by a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, WAF limits those with the highest rates.
       *)
type rate_based_statement_managed_keys_ip_set = {
  addresses: string list option;
  (** 
    The IP addresses that are currently blocked.
     *)

  ip_address_version: ip_address_version option;
  (** 
    The version of the IP addresses, either [IPV4] or [IPV6].
     *)

}

type put_permission_policy_response = unit

type put_permission_policy_request = {
  policy: string;
  (** 
    The policy to attach to the specified rule group.
    
     The policy specifications must conform to the following:
     
      {ul
           {- The policy must be composed using IAM Policy version 2012-10-17.
              
              }
            {- The policy must include specifications for [Effect], [Action], and [Principal].
               
               }
            {- [Effect] must specify [Allow].
               
               }
            {- [Action] must specify [wafv2:CreateWebACL], [wafv2:UpdateWebACL], and [wafv2:PutFirewallManagerRuleGroups] and may optionally specify [wafv2:GetRuleGroup]. WAF rejects any extra actions or wildcard actions in the policy.
               
               }
            {- The policy must not include a [Resource] parameter.
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}.
        *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the [RuleGroup] to which you want to attach the policy.
     *)

}

type put_managed_rule_set_versions_response = {
  next_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

}

type put_managed_rule_set_versions_request = {
  versions_to_publish: (string * version_to_publish) list option;
  (** 
    The versions of the named managed rule group that you want to offer to your customers.
     *)

  recommended_version: string option;
  (** 
    The version of the named managed rule group that you'd like your customers to choose, from among your version offerings.
     *)

  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.
    
     This name is assigned to the corresponding managed rule group, which your customers can access and use.
      *)

}

type filter_behavior = | DROP
  | KEEP

type filter_requirement = | MEETS_ANY
  | MEETS_ALL

type action_value = | EXCLUDED_AS_COUNT
  | CHALLENGE
  | CAPTCHA
  | COUNT
  | BLOCK
  | ALLOW

(** 
    A single action condition for a [Condition] in a logging filter.
     *)
type action_condition = {
  action: action_value;
  (** 
    The action setting that a log record must contain in order to meet the condition. This is the action that WAF applied to the web request.
    
     For rule groups, this is either the configured rule action setting, or if you've applied a rule action override to the rule, it's the override action. The value [EXCLUDED_AS_COUNT] matches on excluded rules and also on rules that have a rule action override of Count.
      *)

}

(** 
    A single label name condition for a [Condition] in a logging filter.
     *)
type label_name_condition = {
  label_name: string;
  (** 
    The label name that a log record must contain in order to meet the condition. This must be a fully qualified label name. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label.
     *)

}

(** 
    A single match condition for a [Filter].
     *)
type condition = {
  label_name_condition: label_name_condition option;
  (** 
    A single label name condition. This is the fully qualified label name that a log record must contain in order to meet the condition. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label.
     *)

  action_condition: action_condition option;
  (** 
    A single action condition. This is the action setting that a log record must contain in order to meet the condition.
     *)

}

(** 
    A single logging filter, used in [LoggingFilter].
     *)
type filter = {
  conditions: condition list;
  (** 
    Match conditions for the filter.
     *)

  requirement: filter_requirement;
  (** 
    Logic to apply to the filtering conditions. You can specify that, in order to satisfy the filter, a log must match all conditions or must match at least one condition.
     *)

  behavior: filter_behavior;
  (** 
    How to handle logs that satisfy the filter's conditions and requirement.
     *)

}

(** 
    Filtering that specifies which web requests are kept in the logs and which are dropped, defined for a web ACL's [LoggingConfiguration].
    
     You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation.
      *)
type logging_filter = {
  default_behavior: filter_behavior;
  (** 
    Default handling for logs that don't match any of the specified filtering conditions.
     *)

  filters: filter list;
  (** 
    The filters that you want to apply to the logs.
     *)

}

type log_type = | WAF_LOGS

type log_scope = | SECURITY_LAKE
  | CUSTOMER

(** 
    Defines an association between logging destinations and a web ACL resource, for logging from WAF. As part of the association, you can specify parts of the standard logging fields to keep out of the logs and you can specify filters so that you log only a subset of the logging records.
    
     You can define one logging destination per web ACL.
     
      You can access information about the traffic that WAF inspects using the following steps:
      
       {ol
            {- Create your logging destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose.
               
                The name that you give the destination must start with [aws-waf-logs-]. Depending on the type of destination, you might need to configure additional settings or permissions.
                
                 For configuration requirements and pricing information for each destination type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic} in the {i WAF Developer Guide}.
                 
                 }
             {- Associate your logging destination to your web ACL using a [PutLoggingConfiguration] request.
                
                }
            
      }
       When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates an additional role or policy that is required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a service-linked role.
       
        For additional information about web ACL logging, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.
         *)
type logging_configuration = {
  log_scope: log_scope option;
  (** 
    The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage.
    
     The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}.
     
      Default: [CUSTOMER]
       *)

  log_type: log_type option;
  (** 
    Used to distinguish between various logging options. Currently, there is one option.
    
     Default: [WAF_LOGS]
      *)

  logging_filter: logging_filter option;
  (** 
    Filtering that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation.
     *)

  managed_by_firewall_manager: bool option;
  (** 
    Indicates whether the logging configuration was created by Firewall Manager, as part of an WAF policy configuration. If true, only Firewall Manager can modify or delete the configuration.
     *)

  redacted_fields: field_to_match list option;
  (** 
    The parts of the request that you want to keep out of the logs.
    
     For example, if you redact the [SingleHeader] field, the [HEADER] field in the logs will be [REDACTED] for all rules that use the [SingleHeader] [FieldToMatch] setting.
     
      Redaction applies only to the component that's specified in the rule's [FieldToMatch] setting, so the [SingleHeader] redaction doesn't apply to rules that use the [Headers] [FieldToMatch].
      
       You can specify only the following fields for redaction: [UriPath], [QueryString], [SingleHeader], and [Method].
       
        This setting has no impact on request sampling. With request sampling, the only way to exclude fields is by disabling sampling in the web ACL visibility configuration.
        
         *)

  log_destination_configs: string list;
  (** 
    The logging destination configuration that you want to associate with the web ACL.
    
     You can associate one logging destination to a web ACL.
     
      *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL that you want to associate with [LogDestinationConfigs].
     *)

}

type put_logging_configuration_response = {
  logging_configuration: logging_configuration option;
  (** 
    
     *)

}

type put_logging_configuration_request = {
  logging_configuration: logging_configuration;
  (** 
    
     *)

}

(** 
    Information for a single version of a managed rule set.
    
     This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
     
      Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].
      
       *)
type managed_rule_set_version = {
  expiry_timestamp: float option;
  [@ocaml.doc {| 
    The time that this version is set to expire.
    
     Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".
      |}]

  last_update_timestamp: float option;
  [@ocaml.doc {| 
    The last time that you updated this version.
    
     Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".
      |}]

  publish_timestamp: float option;
  [@ocaml.doc {| 
    The time that you first published this version.
    
     Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".
      |}]

  forecasted_lifetime: int option;
  (** 
    The amount of time you expect this version of your managed rule group to last, in days.
     *)

  capacity: int option;
  (** 
    The web ACL capacity units (WCUs) required for this rule group.
    
     WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}.
      *)

  associated_rule_group_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the vendor rule group that's used to define the published version of your managed rule group.
     *)

}

type platform = | ANDROID
  | IOS

(** 
    Information for a release of the mobile SDK, including release notes and tags.
    
     The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.
      *)
type mobile_sdk_release = {
  tags: tag list option;
  (** 
    Tags that are associated with the release.
     *)

  release_notes: string option;
  (** 
    Notes describing the release.
     *)

  timestamp_: float option;
  (** 
    The timestamp of the release.
     *)

  release_version: string option;
  (** 
    The release version.
     *)

}

(** 
    High-level information for a managed rule set.
    
     This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
     
      Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].
      
       *)
type managed_rule_set_summary = {
  label_namespace: string option;
  (** 
    The label namespace prefix for the managed rule groups that are offered to customers from this managed rule set. All labels that are added by rules in the managed rule group have this prefix.
    
     {ul
          {- The syntax for the label namespace prefix for a managed rule group is the following:
             
              
              {[
              awswaf:managed::
              ]}
              :
              
              }
           {- When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon:
              
               
               {[
               :
               ]}
               
               
               }
          
      }
       *)

  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  id: string option;
  (** 
    A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].
     *)

  name: string option;
  (** 
    The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.
    
     This name is assigned to the corresponding managed rule group, which your customers can access and use.
      *)

}

(** 
    A set of rules that is managed by Amazon Web Services and Amazon Web Services Marketplace sellers to provide versioned managed rule groups for customers of WAF.
    
     This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
     
      Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].
      
       *)
type managed_rule_set = {
  label_namespace: string option;
  (** 
    The label namespace prefix for the managed rule groups that are offered to customers from this managed rule set. All labels that are added by rules in the managed rule group have this prefix.
    
     {ul
          {- The syntax for the label namespace prefix for a managed rule group is the following:
             
              
              {[
              awswaf:managed::
              ]}
              :
              
              }
           {- When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon:
              
               
               {[
               :
               ]}
               
               
               }
          
      }
       *)

  recommended_version: string option;
  (** 
    The version that you would like your customers to use.
     *)

  published_versions: (string * managed_rule_set_version) list option;
  (** 
    The versions of this managed rule set that are available for use by customers.
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  id: string;
  (** 
    A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].
     *)

  name: string;
  (** 
    The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.
    
     This name is assigned to the corresponding managed rule group, which your customers can access and use.
      *)

}

(** 
    Describes a single version of a managed rule group.
     *)
type managed_rule_group_version = {
  last_update_timestamp: float option;
  (** 
    The date and time that the managed rule group owner updated the rule group version information.
     *)

  name: string option;
  (** 
    The version name.
     *)

}

(** 
    High-level information about a managed rule group, returned by [ListAvailableManagedRuleGroups]. This provides information like the name and vendor name, that you provide when you add a [ManagedRuleGroupStatement] to a web ACL. Managed rule groups include Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. To use any Amazon Web Services Marketplace managed rule group, first subscribe to the rule group through Amazon Web Services Marketplace.
     *)
type managed_rule_group_summary = {
  description: string option;
  (** 
    The description of the managed rule group, provided by Amazon Web Services Managed Rules or the Amazon Web Services Marketplace seller who manages it.
     *)

  versioning_supported: bool option;
  (** 
    Indicates whether the managed rule group is versioned. If it is, you can retrieve the versions list by calling [ListAvailableManagedRuleGroupVersions].
     *)

  name: string option;
  (** 
    The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.
     *)

  vendor_name: string option;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

}

(** 
    The properties of a managed product, such as an Amazon Web Services Managed Rules rule group or an Amazon Web Services Marketplace managed rule group.
     *)
type managed_product_descriptor = {
  is_advanced_managed_rule_set: bool option;
  (** 
    Indicates whether the rule group provides an advanced set of protections, such as the the Amazon Web Services Managed Rules rule groups that are used for WAF intelligent threat mitigation.
     *)

  is_versioning_supported: bool option;
  (** 
    Indicates whether the rule group is versioned.
     *)

  sns_topic_arn: string option;
  (** 
    The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to provide notification of changes to the managed rule group. You can subscribe to the SNS topic to receive notifications when the managed rule group is modified, such as for new versions and for version expiration. For more information, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon Simple Notification Service Developer Guide}.
     *)

  product_description: string option;
  (** 
    A short description of the managed rule group.
     *)

  product_title: string option;
  (** 
    The display name for the managed rule group. For example, [Anonymous IP list] or [Account takeover prevention].
     *)

  product_link: string option;
  (** 
    For Amazon Web Services Marketplace managed rule groups only, the link to the rule group product page.
     *)

  product_id: string option;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  managed_rule_set_name: string option;
  (** 
    The name of the managed rule group. For example, [AWSManagedRulesAnonymousIpList] or [AWSManagedRulesATPRuleSet].
     *)

  vendor_name: string option;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

}

type list_web_ac_ls_response = {
  web_ac_ls: web_acl_summary list option;
  (** 
    Array of web ACLs. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_web_ac_ls_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_tags_for_resource_response = {
  tag_info_for_resource: tag_info_for_resource option;
  (** 
    The collection of tagging definitions for the resource. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource.
     *)

  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_rule_groups_response = {
  rule_groups: rule_group_summary list option;
  (** 
    Array of rule groups. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_rule_groups_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_resources_for_web_acl_response = {
  resource_arns: string list option;
  (** 
    The array of Amazon Resource Names (ARNs) of the associated resources.
     *)

}

type list_resources_for_web_acl_request = {
  resource_type: resource_type option;
  (** 
    Used for web ACLs that are scoped for regional applications. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     If you don't provide a resource type, the call uses the resource type [APPLICATION_LOAD_BALANCER].
     
      Default: [APPLICATION_LOAD_BALANCER]
       *)

  web_acl_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL.
     *)

}

type list_regex_pattern_sets_response = {
  regex_pattern_sets: regex_pattern_set_summary list option;
  (** 
    Array of regex pattern sets. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_regex_pattern_sets_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_mobile_sdk_releases_response = {
  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  release_summaries: release_summary list option;
  (** 
    The high level information for the available SDK releases. If you specified a [Limit] in your request, this might not be the full list.
     *)

}

type list_mobile_sdk_releases_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  platform: platform;
  (** 
    The device platform to retrieve the list for.
     *)

}

type list_managed_rule_sets_response = {
  managed_rule_sets: managed_rule_set_summary list option;
  (** 
    Your managed rule sets. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_managed_rule_sets_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_logging_configurations_response = {
  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  logging_configurations: logging_configuration list option;
  (** 
    Array of logging configurations. If you specified a [Limit] in your request, this might not be the full list.
     *)

}

type list_logging_configurations_request = {
  log_scope: log_scope option;
  (** 
    The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage.
    
     The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}.
     
      Default: [CUSTOMER]
       *)

  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

(** 
    High-level information about an [IPSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage an [IPSet], and the ARN, that you provide to the [IPSetReferenceStatement] to use the address set in a [Rule].
     *)
type ip_set_summary = {
  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  description: string option;
  (** 
    A description of the IP set that helps with identification.
     *)

  id: string option;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string option;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type list_ip_sets_response = {
  ip_sets: ip_set_summary list option;
  (** 
    Array of IPSets. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_ip_sets_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_available_managed_rule_groups_response = {
  managed_rule_groups: managed_rule_group_summary list option;
  (** 
    Array of managed rule groups that you can use. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_available_managed_rule_groups_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type list_available_managed_rule_group_versions_response = {
  current_default_version: string option;
  (** 
    The name of the version that's currently set as the default.
     *)

  versions: managed_rule_group_version list option;
  (** 
    The versions that are currently available for the specified managed rule group. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_available_managed_rule_group_versions_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.
     *)

  vendor_name: string;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

}

(** 
    Information for a single API key.
    
     API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.
      *)
type api_key_summary = {
  version: int option;
  (** 
    Internal value used by WAF to manage the key.
     *)

  creation_timestamp: float option;
  (** 
    The date and time that the key was created.
     *)

  api_key: string option;
  (** 
    The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration.
     *)

  token_domains: string list option;
  (** 
    The token domains that are defined in this API key.
     *)

}

type list_api_keys_response = {
  application_integration_ur_l: string option;
  (** 
    The CAPTCHA application integration URL, for use in your JavaScript implementation.
     *)

  api_key_summaries: api_key_summary list option;
  (** 
    The array of key summaries. If you specified a [Limit] in your request, this might not be the full list.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

}

type list_api_keys_request = {
  limit: int option;
  (** 
    The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.
     *)

  next_marker: string option;
  (** 
    When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

(** 
    Contains zero or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0. For information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
    
     WAF assigns an ARN to each [IPSet] that you create. To use an IP set in a rule, you provide the ARN to the [Rule] statement [IPSetReferenceStatement].
      *)
type ip_set = {
  addresses: string list;
  [@ocaml.doc {| 
    Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0].
    
     Example address strings:
     
      {ul
           {- For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].
              
              }
            {- For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].
               
               }
            {- For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].
               
               }
            {- For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].
               
               }
           
      }
       For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
       
        Example JSON [Addresses] specifications:
        
         {ul
              {- Empty array: ["Addresses": \[\]]
                 
                 }
               {- Array with one address: ["Addresses": \["192.0.2.44/32"\]]
                  
                  }
               {- Array with three addresses: ["Addresses": \["192.0.2.44/32", "192.0.2.0/24", "192.0.0.0/16"\]]
                  
                  }
               {- INVALID specification: ["Addresses": \[""\]] INVALID
                  
                  }
              
      }
       |}]

  ip_address_version: ip_address_version;
  (** 
    The version of the IP addresses, either [IPV4] or [IPV6].
     *)

  description: string option;
  (** 
    A description of the IP set that helps with identification.
     *)

  ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  name: string;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type get_web_acl_response = {
  application_integration_ur_l: string option;
  (** 
    The URL to use in SDK integrations with Amazon Web Services managed rule groups. For example, you can use the integration SDKs with the account takeover prevention managed rule group [AWSManagedRulesATPRuleSet] and the account creation fraud prevention managed rule group [AWSManagedRulesACFPRuleSet]. This is only populated if you are using a rule group in your web ACL that integrates with your applications in this way. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.
     *)

  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  web_ac_l: web_ac_l option;
  (** 
    The web ACL specification. You can modify the settings in this web ACL and use it to update this web ACL or create a new one.
     *)

}

type get_web_acl_request = {
  id: string;
  (** 
    The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

type get_web_acl_for_resource_response = {
  web_ac_l: web_ac_l option;
  (** 
    The web ACL that is associated with the resource. If there is no associated resource, WAF returns a null web ACL.
     *)

}

type get_web_acl_for_resource_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource whose web ACL you want to retrieve.
    
     The ARN must be in one of the following formats:
     
      {ul
           {- For an Application Load Balancer: 
              {[
              arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id}
              ]}
              
              
              }
            {- For an Amazon API Gateway REST API: 
               {[
               arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name}
               ]}
               
               
               }
            {- For an AppSync GraphQL API: 
               {[
               arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId}
               ]}
               
               
               }
            {- For an Amazon Cognito user pool: 
               {[
               arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id}
               ]}
               
               
               }
            {- For an App Runner service: 
               {[
               arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id}
               ]}
               
               
               }
            {- For an Amazon Web Services Verified Access instance: 
               {[
               arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id}
               ]}
               
               
               }
           
      }
       *)

}

type get_sampled_requests_response = {
  time_window: time_window option;
  (** 
    Usually, [TimeWindow] is the time range that you specified in the [GetSampledRequests] request. However, if your Amazon Web Services resource received more than 5,000 requests during the time range that you specified in the request, [GetSampledRequests] returns the time range for the first 5,000 requests. Times are in Coordinated Universal Time (UTC) format.
     *)

  population_size: int option;
  (** 
    The total number of requests from which [GetSampledRequests] got a sample of [MaxItems] requests. If [PopulationSize] is less than [MaxItems], the sample includes every request that your Amazon Web Services resource received during the specified time range.
     *)

  sampled_requests: sampled_http_request list option;
  (** 
    A complex type that contains detailed information about each of the requests in the sample.
     *)

}

type get_sampled_requests_request = {
  max_items: int;
  (** 
    The number of requests that you want WAF to return from among the first 5,000 requests that your Amazon Web Services resource received during the time range. If your resource received fewer requests than the value of [MaxItems], [GetSampledRequests] returns information about all of them.
     *)

  time_window: time_window;
  [@ocaml.doc {| 
    The start date and time and the end date and time of the range for which you want [GetSampledRequests] to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours. If you specify a start time that's earlier than three hours ago, WAF sets it to three hours ago.
     |}]

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  rule_metric_name: string;
  (** 
    The metric name assigned to the [Rule] or [RuleGroup] dimension for which you want a sample of requests.
     *)

  web_acl_arn: string;
  (** 
    The Amazon resource name (ARN) of the [WebACL] for which you want a sample of requests.
     *)

}

type get_rule_group_response = {
  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  rule_group: rule_group option;
  (** 
    
     *)

}

type get_rule_group_request = {
  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the entity.
     *)

  id: string option;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope option;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string option;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type get_regex_pattern_set_response = {
  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  regex_pattern_set: regex_pattern_set option;
  (** 
    
     *)

}

type get_regex_pattern_set_request = {
  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the set. You cannot change the name after you create the set.
     *)

}

type get_rate_based_statement_managed_keys_response = {
  managed_keys_ip_v6: rate_based_statement_managed_keys_ip_set option;
  (** 
    The keys that are of Internet Protocol version 6 (IPv6).
     *)

  managed_keys_ip_v4: rate_based_statement_managed_keys_ip_set option;
  (** 
    The keys that are of Internet Protocol version 4 (IPv4).
     *)

}

type get_rate_based_statement_managed_keys_request = {
  rule_name: string;
  (** 
    The name of the rate-based rule to get the keys for. If you have the rule defined inside a rule group that you're using in your web ACL, also provide the name of the rule group reference statement in the request parameter [RuleGroupRuleName].
     *)

  rule_group_rule_name: string option;
  (** 
    The name of the rule group reference statement in your web ACL. This is required only when you have the rate-based rule nested inside a rule group.
     *)

  web_acl_id: string;
  (** 
    The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  web_acl_name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type get_permission_policy_response = {
  policy: string option;
  (** 
    The IAM policy that is attached to the specified rule group.
     *)

}

type get_permission_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the rule group for which you want to get the policy.
     *)

}

type get_mobile_sdk_release_response = {
  mobile_sdk_release: mobile_sdk_release option;
  (** 
    Information for a specified SDK release, including release notes and tags.
     *)

}

type get_mobile_sdk_release_request = {
  release_version: string;
  (** 
    The release version. For the latest available version, specify [LATEST].
     *)

  platform: platform;
  (** 
    The device platform.
     *)

}

type get_managed_rule_set_response = {
  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  managed_rule_set: managed_rule_set option;
  (** 
    The managed rule set that you requested.
     *)

}

type get_managed_rule_set_request = {
  id: string;
  (** 
    A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.
    
     This name is assigned to the corresponding managed rule group, which your customers can access and use.
      *)

}

type get_logging_configuration_response = {
  logging_configuration: logging_configuration option;
  (** 
    The [LoggingConfiguration] for the specified web ACL.
     *)

}

type get_logging_configuration_request = {
  log_scope: log_scope option;
  (** 
    The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage.
    
     The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}.
     
      Default: [CUSTOMER]
       *)

  log_type: log_type option;
  (** 
    Used to distinguish between various logging options. Currently, there is one option.
    
     Default: [WAF_LOGS]
      *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL for which you want to get the [LoggingConfiguration].
     *)

}

type get_ip_set_response = {
  lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  ip_set: ip_set option;
  (** 
    
     *)

}

type get_ip_set_request = {
  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type get_decrypted_api_key_response = {
  creation_timestamp: float option;
  (** 
    The date and time that the key was created.
     *)

  token_domains: string list option;
  (** 
    The token domains that are defined in this API key.
     *)

}

type get_decrypted_api_key_request = {
  api_key: string;
  (** 
    The encrypted API key.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type generate_mobile_sdk_release_url_response = {
  url: string option;
  (** 
    The presigned download URL for the specified SDK release.
     *)

}

type generate_mobile_sdk_release_url_request = {
  release_version: string;
  (** 
    The release version. For the latest available version, specify [LATEST].
     *)

  platform: platform;
  (** 
    The device platform.
     *)

}

type disassociate_web_acl_response = unit

type disassociate_web_acl_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to disassociate from the web ACL.
    
     The ARN must be in one of the following formats:
     
      {ul
           {- For an Application Load Balancer: 
              {[
              arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id}
              ]}
              
              
              }
            {- For an Amazon API Gateway REST API: 
               {[
               arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name}
               ]}
               
               
               }
            {- For an AppSync GraphQL API: 
               {[
               arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId}
               ]}
               
               
               }
            {- For an Amazon Cognito user pool: 
               {[
               arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id}
               ]}
               
               
               }
            {- For an App Runner service: 
               {[
               arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id}
               ]}
               
               
               }
            {- For an Amazon Web Services Verified Access instance: 
               {[
               arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id}
               ]}
               
               
               }
           
      }
       *)

}

type describe_managed_rule_group_response = {
  consumed_labels: label_summary list option;
  (** 
    The labels that one or more rules in this rule group match against in label match statements. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule.
     *)

  available_labels: label_summary list option;
  (** 
    The labels that one or more rules in this rule group add to matching web requests. These labels are defined in the [RuleLabels] for a [Rule].
     *)

  label_namespace: string option;
  (** 
    The label namespace prefix for this rule group. All labels added by rules in this rule group have this prefix.
    
     {ul
          {- The syntax for the label namespace prefix for a managed rule group is the following:
             
              
              {[
              awswaf:managed::
              ]}
              :
              
              }
           {- When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon:
              
               
               {[
               :
               ]}
               
               
               }
          
      }
       *)

  rules: rule_summary list option;
  (** 
    
     *)

  capacity: int option;
  (** 
    The web ACL capacity units (WCUs) required for this rule group.
    
     WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}.
      *)

  sns_topic_arn: string option;
  (** 
    The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to provide notification of changes to the managed rule group. You can subscribe to the SNS topic to receive notifications when the managed rule group is modified, such as for new versions and for version expiration. For more information, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon Simple Notification Service Developer Guide}.
     *)

  version_name: string option;
  (** 
    The managed rule group's version.
     *)

}

type describe_managed_rule_group_request = {
  version_name: string option;
  (** 
    The version of the rule group. You can only use a version that is not scheduled for expiration. If you don't provide this, WAF uses the vendor's default version.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.
     *)

  vendor_name: string;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

}

type describe_managed_products_by_vendor_response = {
  managed_products: managed_product_descriptor list option;
  (** 
    High-level information for the managed rule groups owned by the specified vendor.
     *)

}

type describe_managed_products_by_vendor_request = {
  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  vendor_name: string;
  (** 
    The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.
     *)

}

type describe_all_managed_products_response = {
  managed_products: managed_product_descriptor list option;
  (** 
    High-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups.
     *)

}

type describe_all_managed_products_request = {
  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type delete_web_acl_response = unit

type delete_web_acl_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

type delete_rule_group_response = unit

type delete_rule_group_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type delete_regex_pattern_set_response = unit

type delete_regex_pattern_set_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the set. You cannot change the name after you create the set.
     *)

}

type delete_permission_policy_response = unit

type delete_permission_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the rule group from which you want to delete the policy.
    
     You must be the owner of the rule group to perform this operation.
      *)

}

type delete_logging_configuration_response = unit

type delete_logging_configuration_request = {
  log_scope: log_scope option;
  (** 
    The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage.
    
     The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}.
     
      Default: [CUSTOMER]
       *)

  log_type: log_type option;
  (** 
    Used to distinguish between various logging options. Currently, there is one option.
    
     Default: [WAF_LOGS]
      *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL from which you want to delete the [LoggingConfiguration].
     *)

}

type delete_ip_set_response = unit

type delete_ip_set_request = {
  lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  id: string;
  (** 
    A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type delete_firewall_manager_rule_groups_response = {
  next_web_acl_lock_token: string option;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

}

type delete_firewall_manager_rule_groups_request = {
  web_acl_lock_token: string;
  (** 
    A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation.
     *)

  web_acl_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL.
     *)

}

type delete_api_key_response = unit

type delete_api_key_request = {
  api_key: string;
  (** 
    The encrypted API key that you want to delete.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type create_web_acl_response = {
  summary: web_acl_summary option;
  (** 
    High-level information about a [WebACL], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [WebACL], and the ARN, that you provide to operations like [AssociateWebACL].
     *)

}

type create_web_acl_request = {
  association_config: association_config option;
  (** 
    Specifies custom configurations for the associations between the web ACL and protected resources.
    
     Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes).
     
      You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.
      
       For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).
        *)

  token_domains: string list option;
  [@ocaml.doc {| 
    Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.
    
     Example JSON: ["TokenDomains": { "mywebsite.com", "myotherwebsite.com" }]
     
      Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.
       |}]

  challenge_config: challenge_config option;
  (** 
    Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig].
     *)

  captcha_config: captcha_config option;
  (** 
    Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig].
     *)

  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  tags: tag list option;
  (** 
    An array of key:value pairs to associate with the resource.
     *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the web ACL that helps with identification.
     *)

  default_action: default_action;
  (** 
    The action to perform if none of the [Rules] contained in the [WebACL] match.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the web ACL. You cannot change the name of a web ACL after you create it.
     *)

}

type create_rule_group_response = {
  summary: rule_group_summary option;
  (** 
    High-level information about a [RuleGroup], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].
     *)

}

type create_rule_group_request = {
  custom_response_bodies: (string * custom_response_body) list option;
  (** 
    A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group.
    
     For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}.
     
      For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.
       *)

  tags: tag list option;
  (** 
    An array of key:value pairs to associate with the resource.
     *)

  visibility_config: visibility_config;
  (** 
    Defines and enables Amazon CloudWatch metrics and web request sample collection.
     *)

  rules: rule list option;
  (** 
    The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them.
     *)

  description: string option;
  (** 
    A description of the rule group that helps with identification.
     *)

  capacity: int;
  (** 
    The web ACL capacity units (WCUs) required for this rule group.
    
     When you create your own rule group, you define this, and you cannot change it after creation. When you add or modify the rules in a rule group, WAF enforces this limit. You can check the capacity for a set of rules using [CheckCapacity].
     
      WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}.
       *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the rule group. You cannot change the name of a rule group after you create it.
     *)

}

type create_regex_pattern_set_response = {
  summary: regex_pattern_set_summary option;
  (** 
    High-level information about a [RegexPatternSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RegexPatternSet], and the ARN, that you provide to the [RegexPatternSetReferenceStatement] to use the pattern set in a [Rule].
     *)

}

type create_regex_pattern_set_request = {
  tags: tag list option;
  (** 
    An array of key:value pairs to associate with the resource.
     *)

  regular_expression_list: regex list;
  (** 
    Array of regular expression strings.
     *)

  description: string option;
  (** 
    A description of the set that helps with identification.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the set. You cannot change the name after you create the set.
     *)

}

type create_ip_set_response = {
  summary: ip_set_summary option;
  (** 
    High-level information about an [IPSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage an [IPSet], and the ARN, that you provide to the [IPSetReferenceStatement] to use the address set in a [Rule].
     *)

}

type create_ip_set_request = {
  tags: tag list option;
  (** 
    An array of key:value pairs to associate with the resource.
     *)

  addresses: string list;
  [@ocaml.doc {| 
    Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0].
    
     Example address strings:
     
      {ul
           {- For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].
              
              }
            {- For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].
               
               }
            {- For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].
               
               }
            {- For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].
               
               }
           
      }
       For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
       
        Example JSON [Addresses] specifications:
        
         {ul
              {- Empty array: ["Addresses": \[\]]
                 
                 }
               {- Array with one address: ["Addresses": \["192.0.2.44/32"\]]
                  
                  }
               {- Array with three addresses: ["Addresses": \["192.0.2.44/32", "192.0.2.0/24", "192.0.0.0/16"\]]
                  
                  }
               {- INVALID specification: ["Addresses": \[""\]] INVALID
                  
                  }
              
      }
       |}]

  ip_address_version: ip_address_version;
  (** 
    The version of the IP addresses, either [IPV4] or [IPV6].
     *)

  description: string option;
  (** 
    A description of the IP set that helps with identification.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

  name: string;
  (** 
    The name of the IP set. You cannot change the name of an [IPSet] after you create it.
     *)

}

type create_api_key_response = {
  api_key: string option;
  (** 
    The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration.
     *)

}

type create_api_key_request = {
  token_domains: string list;
  [@ocaml.doc {| 
    The client application domains that you want to use this API key for.
    
     Example JSON: ["TokenDomains": \["abc.com", "store.abc.com"\]]
     
      Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.
       |}]

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type check_capacity_response = {
  capacity: int option;
  (** 
    The capacity required by the rules and scope.
     *)

}

type check_capacity_request = {
  rules: rule list;
  (** 
    An array of [Rule] that you're configuring to use in a rule group or web ACL.
     *)

  scope: scope;
  (** 
    Specifies whether this is for an Amazon CloudFront distribution or for a regional application. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
    
     To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows:
     
      {ul
           {- CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1].
              
              }
            {- API and SDKs - For all calls, use the Region endpoint us-east-1.
               
               }
           
      }
       *)

}

type associate_web_acl_response = unit

type associate_web_acl_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to associate with the web ACL.
    
     The ARN must be in one of the following formats:
     
      {ul
           {- For an Application Load Balancer: 
              {[
              arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id}
              ]}
              
              
              }
            {- For an Amazon API Gateway REST API: 
               {[
               arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name}
               ]}
               
               
               }
            {- For an AppSync GraphQL API: 
               {[
               arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId}
               ]}
               
               
               }
            {- For an Amazon Cognito user pool: 
               {[
               arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id}
               ]}
               
               
               }
            {- For an App Runner service: 
               {[
               arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id}
               ]}
               
               
               }
            {- For an Amazon Web Services Verified Access instance: 
               {[
               arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id}
               ]}
               
               
               }
           
      }
       *)

  web_acl_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.
     *)

}

[@@ocaml.doc {| 
    WAF This is the latest version of the {b WAF} API, released in November, 2019. The names of the entities that you use to access this API, like endpoints and namespaces, all have the versioning information added, like "V2" or "v2", to distinguish from the prior version. We recommend migrating your resources to this version, because it has a number of significant improvements.
        
         If you used WAF prior to this release, you can't use this WAFV2 API to access any WAF resources that you created before. You can access your old rules, web ACLs, and other WAF resources only through the WAF Classic APIs. The WAF Classic APIs have retained the prior names, endpoints, and namespaces.
         
          For information, including how to migrate your WAF resources to this version, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}.
          
           WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to an Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, or Amazon Web Services Verified Access instance. WAF also lets you control access to your content, to protect the Amazon Web Services resource that WAF is monitoring. Based on conditions that you specify, such as the IP addresses that requests originate from or the values of query strings, the protected resource responds to requests with either the requested content, an HTTP 403 status code (Forbidden), or with a custom response.
           
            This API guide is for developers who need detailed information about WAF API actions, data types, and errors. For detailed information about WAF features and guidance for configuring and using WAF, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html}WAF Developer Guide}.
            
             You can make calls using the endpoints listed in {{:https://docs.aws.amazon.com/general/latest/gr/waf.html}WAF endpoints and quotas}.
             
              {ul
                   {- For regional applications, you can use any of the endpoints in the list. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance.
                      
                      }
                    {- For Amazon CloudFront applications, you must use the API endpoint listed for US East (N. Virginia): us-east-1.
                       
                       }
                   
      }
       Alternatively, you can use one of the Amazon Web Services SDKs to access an API that's tailored to the programming language or platform that you're using. For more information, see {{:http://aws.amazon.com/tools/#SDKs}Amazon Web Services SDKs}.
       
        We currently provide two versions of the WAF API: this API and the prior versions, the classic WAF APIs. This new API provides the same functionality as the older versions, with the following major improvements:
        
         {ul
              {- You use one API for both global and regional applications. Where you need to distinguish the scope, you specify a [Scope] parameter and set it to [CLOUDFRONT] or [REGIONAL].
                 
                 }
               {- You can define a web ACL or rule group with a single call, and update it with a single call. You define all rule specifications in JSON format, and pass them to your rule group or web ACL calls.
                  
                  }
               {- The limits WAF places on the use of rules more closely reflects the cost of running each type of rule. Rule groups include capacity settings, so you know the maximum cost of a rule group when you use it.
                  
                  }
              
      }
       |}]


type base_document = Json.t

