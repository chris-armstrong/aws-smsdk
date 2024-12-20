(** 
    WAF client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type match_field_type = | ALL_QUERY_ARGS
  | SINGLE_QUERY_ARG
  | BODY
  | METHOD
  | HEADER
  | QUERY_STRING
  | URI

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies where in a web request to look for [TargetString].
       *)
type field_to_match = {
  data: string option;
  (** 
    When the value of [Type] is [HEADER], enter the name of the header that you want AWS WAF to search, for example, [User-Agent] or [Referer]. The name of the header is not case sensitive.
    
     When the value of [Type] is [SINGLE_QUERY_ARG], enter the name of the parameter that you want AWS WAF to search, for example, [UserName] or [SalesRegion]. The parameter name is not case sensitive.
     
      If the value of [Type] is any other value, omit [Data].
       *)

  type_: match_field_type;
  (** 
    The part of the web request that you want AWS WAF to search for a specified string. Parts of a request that you can search include the following:
    
     {ul
          {- [HEADER]: A specified request header, for example, the value of the [User-Agent] or [Referer] header. If you choose [HEADER] for the type, specify the name of the header in [Data].
             
             }
           {- [METHOD]: The HTTP method, which indicated the type of operation that the request is asking the origin to perform. Amazon CloudFront supports the following methods: [DELETE], [GET], [HEAD], [OPTIONS], [PATCH], [POST], and [PUT].
              
              }
           {- [QUERY_STRING]: A query string, which is the part of a URL that appears after a [?] character, if any.
              
              }
           {- [URI]: The part of a web request that identifies a resource, for example, [/images/daily-ad.jpg].
              
              }
           {- [BODY]: The part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. The request body immediately follows the request headers. Note that only the first [8192] bytes of the request body are forwarded to AWS WAF for inspection. To allow or block requests based on the length of the body, you can create a size constraint set. For more information, see [CreateSizeConstraintSet].
              
              }
           {- [SINGLE_QUERY_ARG]: The parameter in the query string that you will inspect, such as {i UserName} or {i SalesRegion}. The maximum length for [SINGLE_QUERY_ARG] is 30 characters.
              
              }
           {- [ALL_QUERY_ARGS]: Similar to [SINGLE_QUERY_ARG], but rather than inspecting a single parameter, AWS WAF will inspect all parameters within the query for the value or regex pattern that you specify in [TargetString].
              
              }
          
      }
       *)

}

type text_transformation = | URL_DECODE
  | CMD_LINE
  | LOWERCASE
  | HTML_ENTITY_DECODE
  | COMPRESS_WHITE_SPACE
  | NONE

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.
       *)
type xss_match_tuple = {
  text_transformation: text_transformation;
  [@ocaml.doc {| 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on [FieldToMatch] before inspecting it for a match.
    
     You can only specify a single type of TextTransformation.
     
      {b CMD_LINE}
      
       When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:
       
        {ul
             {- Delete the following characters: \ " ' ^
                
                }
              {- Delete spaces before the following characters: / (
                 
                 }
              {- Replace the following characters with a space: , ;
                 
                 }
              {- Replace multiple spaces with one space
                 
                 }
              {- Convert uppercase letters (A-Z) to lowercase (a-z)
                 
                 }
             
      }
       {b COMPRESS_WHITE_SPACE}
       
        Use this option to replace the following characters with a space character (decimal 32):
        
         {ul
              {- \f, formfeed, decimal 12
                 
                 }
               {- \t, tab, decimal 9
                  
                  }
               {- \n, newline, decimal 10
                  
                  }
               {- \r, carriage return, decimal 13
                  
                  }
               {- \v, vertical tab, decimal 11
                  
                  }
               {- non-breaking space, decimal 160
                  
                  }
              
      }
       [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.
       
        {b HTML_ENTITY_DECODE}
        
         Use this option to replace HTML-encoded characters with unencoded characters. [HTML_ENTITY_DECODE] performs the following operations:
         
          {ul
               {- Replaces [(ampersand)quot;] with ["]
                  
                  }
                {- Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160
                   
                   }
                {- Replaces [(ampersand)lt;] with a "less than" symbol
                   
                   }
                {- Replaces [(ampersand)gt;] with [>]
                   
                   }
                {- Replaces characters that are represented in hexadecimal format, [(ampersand)#xhhhh;], with the corresponding characters
                   
                   }
                {- Replaces characters that are represented in decimal format, [(ampersand)#nnnn;], with the corresponding characters
                   
                   }
               
      }
       {b LOWERCASE}
       
        Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
        
         {b URL_DECODE}
         
          Use this option to decode a URL-encoded value.
          
           {b NONE}
           
            Specify [NONE] if you don't want to perform any text transformations.
             |}]

  field_to_match: field_to_match;
  (** 
    Specifies where in a web request to look for cross-site scripting attacks.
     *)

}

type change_action = | DELETE
  | INSERT

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the part of a web request that you want to inspect for cross-site scripting attacks and indicates whether you want to add the specification to an [XssMatchSet] or delete it from an [XssMatchSet].
       *)
type xss_match_set_update = {
  xss_match_tuple: xss_match_tuple;
  (** 
    Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.
     *)

  action: change_action;
  (** 
    Specify [INSERT] to add an [XssMatchSetUpdate] to an [XssMatchSet]. Use [DELETE] to remove an [XssMatchSetUpdate] from an [XssMatchSet].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The [Id] and [Name] of an [XssMatchSet].
       *)
type xss_match_set_summary = {
  name: string;
  (** 
    The name of the [XssMatchSet], if any, specified by [Id].
     *)

  xss_match_set_id: string;
  (** 
    A unique identifier for an [XssMatchSet]. You use [XssMatchSetId] to get information about a [XssMatchSet] (see [GetXssMatchSet]), update an [XssMatchSet] (see [UpdateXssMatchSet]), insert an [XssMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete an [XssMatchSet] from AWS WAF (see [DeleteXssMatchSet]).
    
     [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A complex type that contains [XssMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header. If a [XssMatchSet] contains more than one [XssMatchTuple] object, a request needs to include cross-site scripting attacks in only one of the specified parts of the request to be considered a match.
       *)
type xss_match_set = {
  xss_match_tuples: xss_match_tuple list;
  (** 
    Specifies the parts of web requests that you want to inspect for cross-site scripting attacks.
     *)

  name: string option;
  (** 
    The name, if any, of the [XssMatchSet].
     *)

  xss_match_set_id: string;
  (** 
    A unique identifier for an [XssMatchSet]. You use [XssMatchSetId] to get information about an [XssMatchSet] (see [GetXssMatchSet]), update an [XssMatchSet] (see [UpdateXssMatchSet]), insert an [XssMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete an [XssMatchSet] from AWS WAF (see [DeleteXssMatchSet]).
    
     [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].
      *)

}

type waf_action_type = | COUNT
  | ALLOW
  | BLOCK

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      For the action that is associated with a rule in a [WebACL], specifies the action that you want AWS WAF to perform when a web request matches all of the conditions in a rule. For the default action in a [WebACL], specifies the action that you want AWS WAF to take when a web request doesn't match all of the conditions in any of the rules in a [WebACL].
       *)
type waf_action = {
  type_: waf_action_type;
  (** 
    Specifies how you want AWS WAF to respond to requests that match the settings in a [Rule]. Valid settings include the following:
    
     {ul
          {- [ALLOW]: AWS WAF allows requests
             
             }
           {- [BLOCK]: AWS WAF blocks requests
              
              }
           {- [COUNT]: AWS WAF increments a counter of the requests that match all of the conditions in the rule. AWS WAF then continues to inspect the web request based on the remaining rules in the web ACL. You can't specify [COUNT] for the default action for a [WebACL].
              
              }
          
      }
       *)

}

type waf_override_action_type = | COUNT
  | NONE

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The action to take if any rule within the [RuleGroup] matches a request.
       *)
type waf_override_action = {
  type_: waf_override_action_type;
  (** 
    [COUNT] overrides the action specified by the individual rule within a [RuleGroup] . If set to [NONE], the rule's action will take place.
     *)

}

type waf_rule_type = | GROUP
  | RATE_BASED
  | REGULAR

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The rule to exclude from a rule group. This is applicable only when the [ActivatedRule] refers to a [RuleGroup]. The rule must belong to the [RuleGroup] that is specified by the [ActivatedRule].
       *)
type excluded_rule = {
  rule_id: string;
  (** 
    The unique identifier for the rule to exclude from the rule group.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The [ActivatedRule] object in an [UpdateWebACL] request specifies a [Rule] that you want to insert or delete, the priority of the [Rule] in the [WebACL], and the action that you want AWS WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).
      
       To specify whether to insert or delete a [Rule], use the [Action] parameter in the [WebACLUpdate] data type.
        *)
type activated_rule = {
  excluded_rules: excluded_rule list option;
  (** 
    An array of rules to exclude from a rule group. This is applicable only when the [ActivatedRule] refers to a [RuleGroup].
    
     Sometimes it is necessary to troubleshoot rule groups that are blocking traffic unexpectedly (false positives). One troubleshooting technique is to identify the specific rule within the rule group that is blocking the legitimate traffic and then disable (exclude) that particular rule. You can exclude rules from both your own rule groups and AWS Marketplace rule groups that have been associated with a web ACL.
     
      Specifying [ExcludedRules] does not remove those rules from the rule group. Rather, it changes the action for the rules to [COUNT]. Therefore, requests that match an [ExcludedRule] are counted but not blocked. The [RuleGroup] owner will receive COUNT metrics for each [ExcludedRule].
      
       If you want to exclude rules from a rule group that is already associated with a web ACL, perform the following steps:
       
        {ol
             {- Use the AWS WAF logs to identify the IDs of the rules that you want to exclude. For more information about the logs, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging Web ACL Traffic Information}.
                
                }
              {- Submit an [UpdateWebACL] request that has two actions:
                 
                  {ul
                       {- The first action deletes the existing rule group from the web ACL. That is, in the [UpdateWebACL] request, the first [Updates:Action] should be [DELETE] and [Updates:ActivatedRule:RuleId] should be the rule group that contains the rules that you want to exclude.
                          
                          }
                        {- The second action inserts the same rule group back in, but specifying the rules to exclude. That is, the second [Updates:Action] should be [INSERT], [Updates:ActivatedRule:RuleId] should be the rule group that you just removed, and [ExcludedRules] should contain the rules that you want to exclude.
                           
                           }
                       
               }
               }
             
      }
       *)

  type_: waf_rule_type option;
  (** 
    The rule type, either [REGULAR], as defined by [Rule], [RATE_BASED], as defined by [RateBasedRule], or [GROUP], as defined by [RuleGroup]. The default is REGULAR. Although this field is optional, be aware that if you try to add a RATE_BASED rule to a web ACL without setting the type, the [UpdateWebACL] request will fail because the request tries to add a REGULAR rule with the specified ID, which does not exist.
     *)

  override_action: waf_override_action option;
  (** 
    Use the [OverrideAction] to test your [RuleGroup].
    
     Any rule in a [RuleGroup] can potentially block a request. If you set the [OverrideAction] to [None], the [RuleGroup] will block a request if any individual rule in the [RuleGroup] matches the request and is configured to block that request. However if you first want to test the [RuleGroup], set the [OverrideAction] to [Count]. The [RuleGroup] will then override any block action specified by individual rules contained within the group. Instead of blocking matching requests, those requests will be counted. You can view a record of counted requests using [GetSampledRequests].
     
      [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a [WebACL]. In this case you do not use [ActivatedRule|Action]. For all other update requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].
       *)

  action: waf_action option;
  (** 
    Specifies the action that CloudFront or AWS WAF takes when a web request matches the conditions in the [Rule]. Valid values for [Action] include the following:
    
     {ul
          {- [ALLOW]: CloudFront responds with the requested object.
             
             }
           {- [BLOCK]: CloudFront responds with an HTTP 403 (Forbidden) status code.
              
              }
           {- [COUNT]: AWS WAF increments a counter of requests that match the conditions in the rule and then continues to inspect the web request based on the remaining rules in the web ACL.
              
              }
          
      }
       [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a [WebACL]. In this case, you do not use [ActivatedRule|Action]. For all other update requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].
        *)

  rule_id: string;
  (** 
    The [RuleId] for a [Rule]. You use [RuleId] to get more information about a [Rule] (see [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or delete a one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see [DeleteRule]).
    
     [RuleId] is returned by [CreateRule] and by [ListRules].
      *)

  priority: int;
  (** 
    Specifies the order in which the [Rules] in a [WebACL] are evaluated. Rules with a lower value for [Priority] are evaluated before [Rules] with a higher value. The value must be a unique integer. If you add multiple [Rules] to a [WebACL], the values don't need to be consecutive.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies whether to insert a [Rule] into or delete a [Rule] from a [WebACL].
       *)
type web_acl_update = {
  activated_rule: activated_rule;
  (** 
    The [ActivatedRule] object in an [UpdateWebACL] request specifies a [Rule] that you want to insert or delete, the priority of the [Rule] in the [WebACL], and the action that you want AWS WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).
     *)

  action: change_action;
  (** 
    Specifies whether to insert a [Rule] into or delete a [Rule] from a [WebACL].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the identifier and the name or description of the [WebACL].
       *)
type web_acl_summary = {
  name: string;
  (** 
    A friendly name or description of the [WebACL]. You can't change the name of a [WebACL] after you create it.
     *)

  web_acl_id: string;
  (** 
    A unique identifier for a [WebACL]. You use [WebACLId] to get information about a [WebACL] (see [GetWebACL]), update a [WebACL] (see [UpdateWebACL]), and delete a [WebACL] from AWS WAF (see [DeleteWebACL]).
    
     [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the [Rules] that identify the requests that you want to allow, block, or count. In a [WebACL], you also specify a default action ([ALLOW] or [BLOCK]), and the action for each [Rule] that you add to a [WebACL], for example, block requests from specified IP addresses or block requests from specified referrers. You also associate the [WebACL] with a CloudFront distribution to identify the requests that you want AWS WAF to filter. If you add more than one [Rule] to a [WebACL], a request needs to match only one of the specifications to be allowed, blocked, or counted. For more information, see [UpdateWebACL].
       *)
type web_ac_l = {
  web_acl_arn: string option;
  (** 
    Tha Amazon Resource Name (ARN) of the web ACL.
     *)

  rules: activated_rule list;
  (** 
    An array that contains the action for each [Rule] in a [WebACL], the priority of the [Rule], and the ID of the [Rule].
     *)

  default_action: waf_action;
  (** 
    The action to perform if none of the [Rules] contained in the [WebACL] match. The action is specified by the [WafAction] object.
     *)

  metric_name: string option;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [WebACL]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change [MetricName] after you create the [WebACL].
     |}]

  name: string option;
  (** 
    A friendly name or description of the [WebACL]. You can't change the name of a [WebACL] after you create it.
     *)

  web_acl_id: string;
  (** 
    A unique identifier for a [WebACL]. You use [WebACLId] to get information about a [WebACL] (see [GetWebACL]), update a [WebACL] (see [UpdateWebACL]), and delete a [WebACL] from AWS WAF (see [DeleteWebACL]).
    
     [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].
      *)

}

(** 
    
     *)
type waf_tag_operation_internal_error_exception = {
  message: string option;
  
}

(** 
    
     *)
type waf_tag_operation_exception = {
  message: string option;
  
}

(** 
    The specified subscription does not exist.
     *)
type waf_subscription_not_found_exception = {
  message: string option;
  
}

(** 
    The operation failed because you tried to create, update, or delete an object by using a change token that has already been used.
     *)
type waf_stale_data_exception = {
  message: string option;
  
}

(** 
    AWS WAF is not able to access the service linked role. This can be caused by a previous [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. Please try your request again. The service linked role can also be locked by a previous [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you recently made a [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. If you receive this same exception again, you will have to wait additional time until the role is unlocked.
     *)
type waf_service_linked_role_error_exception = {
  message: string option;
  
}

(** 
    The operation failed because you tried to delete an object that is still in use. For example:
    
     {ul
          {- You tried to delete a [ByteMatchSet] that is still referenced by a [Rule].
             
             }
           {- You tried to delete a [Rule] that is still referenced by a [WebACL].
              
              }
          
      }
       *)
type waf_referenced_item_exception = {
  message: string option;
  
}

(** 
    The operation failed because the referenced object doesn't exist.
     *)
type waf_nonexistent_item_exception = {
  message: string option;
  
}

(** 
    The operation failed because you tried to add an object to or delete an object from another object that doesn't exist. For example:
    
     {ul
          {- You tried to add a [Rule] to or delete a [Rule] from a [WebACL] that doesn't exist.
             
             }
           {- You tried to add a [ByteMatchSet] to or delete a [ByteMatchSet] from a [Rule] that doesn't exist.
              
              }
           {- You tried to add an IP address to or delete an IP address from an [IPSet] that doesn't exist.
              
              }
           {- You tried to add a [ByteMatchTuple] to or delete a [ByteMatchTuple] from a [ByteMatchSet] that doesn't exist.
              
              }
          
      }
       *)
type waf_nonexistent_container_exception = {
  message: string option;
  
}

(** 
    The operation failed because you tried to delete an object that isn't empty. For example:
    
     {ul
          {- You tried to delete a [WebACL] that still contains one or more [Rule] objects.
             
             }
           {- You tried to delete a [Rule] that still contains one or more [ByteMatchSet] objects or other predicates.
              
              }
           {- You tried to delete a [ByteMatchSet] that contains one or more [ByteMatchTuple] objects.
              
              }
           {- You tried to delete an [IPSet] that references one or more IP addresses.
              
              }
          
      }
       *)
type waf_non_empty_entity_exception = {
  message: string option;
  
}

(** 
    The operation exceeds a resource limit, for example, the maximum number of [WebACL] objects that you can create for an AWS account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}Limits} in the {i AWS WAF Developer Guide}.
     *)
type waf_limits_exceeded_exception = {
  message: string option;
  
}

(** 
    The regular expression (regex) you specified in [RegexPatternString] is invalid.
     *)
type waf_invalid_regex_pattern_exception = {
  message: string option;
  
}

(** 
    The operation failed because the specified policy is not in the proper format.
    
     The policy is subject to the following restrictions:
     
      {ul
           {- You can attach only one policy with each [PutPermissionPolicy] request.
              
              }
            {- The policy must include an [Effect], [Action] and [Principal].
               
               }
            {- [Effect] must specify [Allow].
               
               }
            {- The [Action] in the policy must be [waf:UpdateWebACL], [waf-regional:UpdateWebACL], [waf:GetRuleGroup] and [waf-regional:GetRuleGroup] . Any extra or wildcard actions in the policy will be rejected.
               
               }
            {- The policy cannot include a [Resource] parameter.
               
               }
            {- The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.
               
               }
            {- The user making the request must be the owner of the RuleGroup.
               
               }
            {- Your policy must be composed using IAM Policy version 2012-10-17.
               
               }
           
      }
       *)
type waf_invalid_permission_policy_exception = {
  message: string option;
  
}

type parameter_exception_field = | TAG_KEYS
  | TAGS
  | RESOURCE_ARN
  | NEXT_MARKER
  | RULE_TYPE
  | RATE_KEY
  | GEO_MATCH_LOCATION_VALUE
  | GEO_MATCH_LOCATION_TYPE
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR
  | BYTE_MATCH_POSITIONAL_CONSTRAINT
  | BYTE_MATCH_TEXT_TRANSFORMATION
  | SQL_INJECTION_MATCH_FIELD_TYPE
  | BYTE_MATCH_FIELD_TYPE
  | IPSET_TYPE
  | PREDICATE_TYPE
  | WAF_OVERRIDE_ACTION
  | WAF_ACTION
  | CHANGE_ACTION

type parameter_exception_reason = | INVALID_TAG_KEY
  | ILLEGAL_ARGUMENT
  | ILLEGAL_COMBINATION
  | INVALID_OPTION

(** 
    The operation failed because AWS WAF didn't recognize a parameter in the request. For example:
    
     {ul
          {- You specified an invalid parameter name.
             
             }
           {- You specified an invalid value.
              
              }
           {- You tried to update an object ([ByteMatchSet], [IPSet], [Rule], or [WebACL]) using an action other than [INSERT] or [DELETE].
              
              }
           {- You tried to create a [WebACL] with a [DefaultAction] [Type] other than [ALLOW], [BLOCK], or [COUNT].
              
              }
           {- You tried to create a [RateBasedRule] with a [RateKey] value other than [IP].
              
              }
           {- You tried to update a [WebACL] with a [WafAction] [Type] other than [ALLOW], [BLOCK], or [COUNT].
              
              }
           {- You tried to update a [ByteMatchSet] with a [FieldToMatch] [Type] other than HEADER, METHOD, QUERY_STRING, URI, or BODY.
              
              }
           {- You tried to update a [ByteMatchSet] with a [Field] of [HEADER] but no value for [Data].
              
              }
           {- Your request references an ARN that is malformed, or corresponds to a resource with which a web ACL cannot be associated.
              
              }
          
      }
       *)
type waf_invalid_parameter_exception = {
  reason: parameter_exception_reason option;
  
  parameter: string option;
  
  field: parameter_exception_field option;
  
}

(** 
    The operation failed because there was nothing to do. For example:
    
     {ul
          {- You tried to remove a [Rule] from a [WebACL], but the [Rule] isn't in the specified [WebACL].
             
             }
           {- You tried to remove an IP address from an [IPSet], but the IP address isn't in the specified [IPSet].
              
              }
           {- You tried to remove a [ByteMatchTuple] from a [ByteMatchSet], but the [ByteMatchTuple] isn't in the specified [WebACL].
              
              }
           {- You tried to add a [Rule] to a [WebACL], but the [Rule] already exists in the specified [WebACL].
              
              }
           {- You tried to add a [ByteMatchTuple] to a [ByteMatchSet], but the [ByteMatchTuple] already exists in the specified [WebACL].
              
              }
          
      }
       *)
type waf_invalid_operation_exception = {
  message: string option;
  
}

(** 
    The operation failed because you tried to create, update, or delete an object by using an invalid account identifier.
     *)
type waf_invalid_account_exception = unit

(** 
    The operation failed because of a system problem, even though the request was valid. Retry your request.
     *)
type waf_internal_error_exception = {
  message: string option;
  
}

type migration_error_type = | S3_INTERNAL_ERROR
  | S3_BUCKET_INVALID_REGION
  | S3_BUCKET_NOT_FOUND
  | S3_BUCKET_NOT_ACCESSIBLE
  | S3_BUCKET_NO_PERMISSION
  | ENTITY_NOT_FOUND
  | ENTITY_NOT_SUPPORTED

(** 
    The operation failed due to a problem with the migration. The failure cause is provided in the exception, in the [MigrationErrorType]:
    
     {ul
          {- [ENTITY_NOT_SUPPORTED] - The web ACL has an unsupported entity but the [IgnoreUnsupportedType] is not set to true.
             
             }
           {- [ENTITY_NOT_FOUND] - The web ACL doesn't exist.
              
              }
           {- [S3_BUCKET_NO_PERMISSION] - You don't have permission to perform the [PutObject] action to the specified Amazon S3 bucket.
              
              }
           {- [S3_BUCKET_NOT_ACCESSIBLE] - The bucket policy doesn't allow AWS WAF to perform the [PutObject] action in the bucket.
              
              }
           {- [S3_BUCKET_NOT_FOUND] - The S3 bucket doesn't exist.
              
              }
           {- [S3_BUCKET_INVALID_REGION] - The S3 bucket is not in the same Region as the web ACL.
              
              }
           {- [S3_INTERNAL_ERROR] - AWS WAF failed to create the template in the S3 bucket for another reason.
              
              }
          
      }
       *)
type waf_entity_migration_exception = {
  migration_error_reason: string option;
  
  migration_error_type: migration_error_type option;
  
  message: string option;
  
}

(** 
    The name specified is invalid.
     *)
type waf_disallowed_name_exception = {
  message: string option;
  
}

(** 
    
     *)
type waf_bad_request_exception = {
  message: string option;
  
}

(** 
    The response to an [UpdateXssMatchSets] request.
     *)
type update_xss_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateXssMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    A request to update an [XssMatchSet].
     *)
type update_xss_match_set_request = {
  updates: xss_match_set_update list;
  (** 
    An array of [XssMatchSetUpdate] objects that you want to insert into or delete from an [XssMatchSet]. For more information, see the applicable data types:
    
     {ul
          {- [XssMatchSetUpdate]: Contains [Action] and [XssMatchTuple]
             
             }
           {- [XssMatchTuple]: Contains [FieldToMatch] and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  xss_match_set_id: string;
  (** 
    The [XssMatchSetId] of the [XssMatchSet] that you want to update. [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].
     *)

}

type update_web_acl_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateWebACL] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type update_web_acl_request = {
  default_action: waf_action option;
  (** 
    A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs the default action if a request doesn't match the criteria in any of the rules in a web ACL.
     *)

  updates: web_acl_update list option;
  (** 
    An array of updates to make to the [WebACL].
    
     An array of [WebACLUpdate] objects that you want to insert into or delete from a [WebACL]. For more information, see the applicable data types:
     
      {ul
           {- [WebACLUpdate]: Contains [Action] and [ActivatedRule]
              
              }
            {- [ActivatedRule]: Contains [Action], [OverrideAction], [Priority], [RuleId], and [Type]. [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a [WebACL]. In this case, you do not use [ActivatedRule|Action]. For all other update requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].
               
               }
            {- [WafAction]: Contains [Type]
               
               }
           
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  web_acl_id: string;
  (** 
    The [WebACLId] of the [WebACL] that you want to update. [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].
     *)

}

(** 
    The response to an [UpdateSqlInjectionMatchSets] request.
     *)
type update_sql_injection_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateSqlInjectionMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.
       *)
type sql_injection_match_tuple = {
  text_transformation: text_transformation;
  [@ocaml.doc {| 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on [FieldToMatch] before inspecting it for a match.
    
     You can only specify a single type of TextTransformation.
     
      {b CMD_LINE}
      
       When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:
       
        {ul
             {- Delete the following characters: \ " ' ^
                
                }
              {- Delete spaces before the following characters: / (
                 
                 }
              {- Replace the following characters with a space: , ;
                 
                 }
              {- Replace multiple spaces with one space
                 
                 }
              {- Convert uppercase letters (A-Z) to lowercase (a-z)
                 
                 }
             
      }
       {b COMPRESS_WHITE_SPACE}
       
        Use this option to replace the following characters with a space character (decimal 32):
        
         {ul
              {- \f, formfeed, decimal 12
                 
                 }
               {- \t, tab, decimal 9
                  
                  }
               {- \n, newline, decimal 10
                  
                  }
               {- \r, carriage return, decimal 13
                  
                  }
               {- \v, vertical tab, decimal 11
                  
                  }
               {- non-breaking space, decimal 160
                  
                  }
              
      }
       [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.
       
        {b HTML_ENTITY_DECODE}
        
         Use this option to replace HTML-encoded characters with unencoded characters. [HTML_ENTITY_DECODE] performs the following operations:
         
          {ul
               {- Replaces [(ampersand)quot;] with ["]
                  
                  }
                {- Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160
                   
                   }
                {- Replaces [(ampersand)lt;] with a "less than" symbol
                   
                   }
                {- Replaces [(ampersand)gt;] with [>]
                   
                   }
                {- Replaces characters that are represented in hexadecimal format, [(ampersand)#xhhhh;], with the corresponding characters
                   
                   }
                {- Replaces characters that are represented in decimal format, [(ampersand)#nnnn;], with the corresponding characters
                   
                   }
               
      }
       {b LOWERCASE}
       
        Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
        
         {b URL_DECODE}
         
          Use this option to decode a URL-encoded value.
          
           {b NONE}
           
            Specify [NONE] if you don't want to perform any text transformations.
             |}]

  field_to_match: field_to_match;
  (** 
    Specifies where in a web request to look for snippets of malicious SQL code.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the part of a web request that you want to inspect for snippets of malicious SQL code and indicates whether you want to add the specification to a [SqlInjectionMatchSet] or delete it from a [SqlInjectionMatchSet].
       *)
type sql_injection_match_set_update = {
  sql_injection_match_tuple: sql_injection_match_tuple;
  (** 
    Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.
     *)

  action: change_action;
  (** 
    Specify [INSERT] to add a [SqlInjectionMatchSetUpdate] to a [SqlInjectionMatchSet]. Use [DELETE] to remove a [SqlInjectionMatchSetUpdate] from a [SqlInjectionMatchSet].
     *)

}

(** 
    A request to update a [SqlInjectionMatchSet].
     *)
type update_sql_injection_match_set_request = {
  updates: sql_injection_match_set_update list;
  (** 
    An array of [SqlInjectionMatchSetUpdate] objects that you want to insert into or delete from a [SqlInjectionMatchSet]. For more information, see the applicable data types:
    
     {ul
          {- [SqlInjectionMatchSetUpdate]: Contains [Action] and [SqlInjectionMatchTuple]
             
             }
           {- [SqlInjectionMatchTuple]: Contains [FieldToMatch] and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  sql_injection_match_set_id: string;
  (** 
    The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to update. [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by [ListSqlInjectionMatchSets].
     *)

}

type update_size_constraint_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateSizeConstraintSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type comparison_operator = | GT
  | GE
  | LT
  | LE
  | NE
  | EQ

[@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies a constraint on the size of a part of the web request. AWS WAF uses the [Size], [ComparisonOperator], and [FieldToMatch] to build an expression in the form of "[Size] [ComparisonOperator] size in bytes of [FieldToMatch]". If that expression is true, the [SizeConstraint] is considered to match.
       |}]
type size_constraint = {
  size: int;
  [@ocaml.doc {| 
    The size in bytes that you want AWS WAF to compare against the size of the specified [FieldToMatch]. AWS WAF uses this in combination with [ComparisonOperator] and [FieldToMatch] to build an expression in the form of "[Size] [ComparisonOperator] size in bytes of [FieldToMatch]". If that expression is true, the [SizeConstraint] is considered to match.
    
     Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).
     
      If you specify [URI] for the value of [Type], the / in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.
       |}]

  comparison_operator: comparison_operator;
  [@ocaml.doc {| 
    The type of comparison you want AWS WAF to perform. AWS WAF uses this in combination with the provided [Size] and [FieldToMatch] to build an expression in the form of "[Size] [ComparisonOperator] size in bytes of [FieldToMatch]". If that expression is true, the [SizeConstraint] is considered to match.
    
     {b EQ}: Used to test if the [Size] is equal to the size of the [FieldToMatch]
     
      {b NE}: Used to test if the [Size] is not equal to the size of the [FieldToMatch]
      
       {b LE}: Used to test if the [Size] is less than or equal to the size of the [FieldToMatch]
       
        {b LT}: Used to test if the [Size] is strictly less than the size of the [FieldToMatch]
        
         {b GE}: Used to test if the [Size] is greater than or equal to the size of the [FieldToMatch]
         
          {b GT}: Used to test if the [Size] is strictly greater than the size of the [FieldToMatch]
           |}]

  text_transformation: text_transformation;
  [@ocaml.doc {| 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on [FieldToMatch] before inspecting it for a match.
    
     You can only specify a single type of TextTransformation.
     
      Note that if you choose [BODY] for the value of [Type], you must choose [NONE] for [TextTransformation] because CloudFront forwards only the first 8192 bytes for inspection.
      
       {b NONE}
       
        Specify [NONE] if you don't want to perform any text transformations.
        
         {b CMD_LINE}
         
          When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:
          
           {ul
                {- Delete the following characters: \ " ' ^
                   
                   }
                 {- Delete spaces before the following characters: / (
                    
                    }
                 {- Replace the following characters with a space: , ;
                    
                    }
                 {- Replace multiple spaces with one space
                    
                    }
                 {- Convert uppercase letters (A-Z) to lowercase (a-z)
                    
                    }
                
      }
       {b COMPRESS_WHITE_SPACE}
       
        Use this option to replace the following characters with a space character (decimal 32):
        
         {ul
              {- \f, formfeed, decimal 12
                 
                 }
               {- \t, tab, decimal 9
                  
                  }
               {- \n, newline, decimal 10
                  
                  }
               {- \r, carriage return, decimal 13
                  
                  }
               {- \v, vertical tab, decimal 11
                  
                  }
               {- non-breaking space, decimal 160
                  
                  }
              
      }
       [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.
       
        {b HTML_ENTITY_DECODE}
        
         Use this option to replace HTML-encoded characters with unencoded characters. [HTML_ENTITY_DECODE] performs the following operations:
         
          {ul
               {- Replaces [(ampersand)quot;] with ["]
                  
                  }
                {- Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160
                   
                   }
                {- Replaces [(ampersand)lt;] with a "less than" symbol
                   
                   }
                {- Replaces [(ampersand)gt;] with [>]
                   
                   }
                {- Replaces characters that are represented in hexadecimal format, [(ampersand)#xhhhh;], with the corresponding characters
                   
                   }
                {- Replaces characters that are represented in decimal format, [(ampersand)#nnnn;], with the corresponding characters
                   
                   }
               
      }
       {b LOWERCASE}
       
        Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
        
         {b URL_DECODE}
         
          Use this option to decode a URL-encoded value.
           |}]

  field_to_match: field_to_match;
  (** 
    Specifies where in a web request to look for the size constraint.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the part of a web request that you want to inspect the size of and indicates whether you want to add the specification to a [SizeConstraintSet] or delete it from a [SizeConstraintSet].
       *)
type size_constraint_set_update = {
  size_constraint: size_constraint;
  [@ocaml.doc {| 
    Specifies a constraint on the size of a part of the web request. AWS WAF uses the [Size], [ComparisonOperator], and [FieldToMatch] to build an expression in the form of "[Size] [ComparisonOperator] size in bytes of [FieldToMatch]". If that expression is true, the [SizeConstraint] is considered to match.
     |}]

  action: change_action;
  (** 
    Specify [INSERT] to add a [SizeConstraintSetUpdate] to a [SizeConstraintSet]. Use [DELETE] to remove a [SizeConstraintSetUpdate] from a [SizeConstraintSet].
     *)

}

type update_size_constraint_set_request = {
  updates: size_constraint_set_update list;
  (** 
    An array of [SizeConstraintSetUpdate] objects that you want to insert into or delete from a [SizeConstraintSet]. For more information, see the applicable data types:
    
     {ul
          {- [SizeConstraintSetUpdate]: Contains [Action] and [SizeConstraint]
             
             }
           {- [SizeConstraint]: Contains [FieldToMatch], [TextTransformation], [ComparisonOperator], and [Size]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  size_constraint_set_id: string;
  (** 
    The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to update. [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by [ListSizeConstraintSets].
     *)

}

type update_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type predicate_type = | REGEX_MATCH
  | XSS_MATCH
  | SIZE_CONSTRAINT
  | GEO_MATCH
  | SQL_INJECTION_MATCH
  | BYTE_MATCH
  | IP_MATCH

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], [XssMatchSet], [RegexMatchSet], [GeoMatchSet], and [SizeConstraintSet] objects that you want to add to a [Rule] and, for each object, indicates whether you want to negate the settings, for example, requests that do NOT originate from the IP address 192.0.2.44.
       *)
type predicate = {
  data_id: string;
  (** 
    A unique identifier for a predicate in a [Rule], such as [ByteMatchSetId] or [IPSetId]. The ID is returned by the corresponding [Create] or [List] command.
     *)

  type_: predicate_type;
  (** 
    The type of predicate in a [Rule], such as [ByteMatch] or [IPSet].
     *)

  negated: bool;
  (** 
    Set [Negated] to [False] if you want AWS WAF to allow, block, or count requests based on the settings in the specified [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], [XssMatchSet], [RegexMatchSet], [GeoMatchSet], or [SizeConstraintSet]. For example, if an [IPSet] includes the IP address [192.0.2.44], AWS WAF will allow or block requests based on that IP address.
    
     Set [Negated] to [True] if you want AWS WAF to allow or block a request based on the negation of the settings in the [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], [XssMatchSet], [RegexMatchSet], [GeoMatchSet], or [SizeConstraintSet]. For example, if an [IPSet] includes the IP address [192.0.2.44], AWS WAF will allow, block, or count requests based on all IP addresses {i except} [192.0.2.44].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies a [Predicate] (such as an [IPSet]) and indicates whether you want to add it to a [Rule] or delete it from a [Rule].
       *)
type rule_update = {
  predicate: predicate;
  (** 
    The ID of the [Predicate] (such as an [IPSet]) that you want to add to a [Rule].
     *)

  action: change_action;
  (** 
    Specify [INSERT] to add a [Predicate] to a [Rule]. Use [DELETE] to remove a [Predicate] from a [Rule].
     *)

}

type update_rule_request = {
  updates: rule_update list;
  (** 
    An array of [RuleUpdate] objects that you want to insert into or delete from a [Rule]. For more information, see the applicable data types:
    
     {ul
          {- [RuleUpdate]: Contains [Action] and [Predicate]
             
             }
           {- [Predicate]: Contains [DataId], [Negated], and [Type]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  rule_id: string;
  (** 
    The [RuleId] of the [Rule] that you want to update. [RuleId] is returned by [CreateRule] and by [ListRules].
     *)

}

type update_rule_group_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateRuleGroup] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies an [ActivatedRule] and indicates whether you want to add it to a [RuleGroup] or delete it from a [RuleGroup].
       *)
type rule_group_update = {
  activated_rule: activated_rule;
  (** 
    The [ActivatedRule] object specifies a [Rule] that you want to insert or delete, the priority of the [Rule] in the [WebACL], and the action that you want AWS WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).
     *)

  action: change_action;
  (** 
    Specify [INSERT] to add an [ActivatedRule] to a [RuleGroup]. Use [DELETE] to remove an [ActivatedRule] from a [RuleGroup].
     *)

}

type update_rule_group_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  updates: rule_group_update list;
  (** 
    An array of [RuleGroupUpdate] objects that you want to insert into or delete from a [RuleGroup].
    
     You can only insert [REGULAR] rules into a rule group.
     
      [ActivatedRule|OverrideAction] applies only when updating or adding a [RuleGroup] to a [WebACL]. In this case you do not use [ActivatedRule|Action]. For all other update requests, [ActivatedRule|Action] is used instead of [ActivatedRule|OverrideAction].
       *)

  rule_group_id: string;
  (** 
    The [RuleGroupId] of the [RuleGroup] that you want to update. [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].
     *)

}

type update_regex_pattern_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateRegexPatternSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In an [UpdateRegexPatternSet] request, [RegexPatternSetUpdate] specifies whether to insert or delete a [RegexPatternString] and includes the settings for the [RegexPatternString].
       *)
type regex_pattern_set_update = {
  regex_pattern_string: string;
  (** 
    Specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as [B\[a@\]dB\[o0\]t].
     *)

  action: change_action;
  (** 
    Specifies whether to insert or delete a [RegexPatternString].
     *)

}

type update_regex_pattern_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  updates: regex_pattern_set_update list;
  (** 
    An array of [RegexPatternSetUpdate] objects that you want to insert into or delete from a [RegexPatternSet].
     *)

  regex_pattern_set_id: string;
  (** 
    The [RegexPatternSetId] of the [RegexPatternSet] that you want to update. [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
     *)

}

type update_regex_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateRegexMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The regular expression pattern that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings. Each [RegexMatchTuple] object contains:
      
       {ul
            {- The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the [User-Agent] header.
               
               }
             {- The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see [RegexPatternSet].
                
                }
             {- Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
                
                }
            
      }
       *)
type regex_match_tuple = {
  regex_pattern_set_id: string;
  (** 
    The [RegexPatternSetId] for a [RegexPatternSet]. You use [RegexPatternSetId] to get information about a [RegexPatternSet] (see [GetRegexPatternSet]), update a [RegexPatternSet] (see [UpdateRegexPatternSet]), insert a [RegexPatternSet] into a [RegexMatchSet] or delete one from a [RegexMatchSet] (see [UpdateRegexMatchSet]), and delete an [RegexPatternSet] from AWS WAF (see [DeleteRegexPatternSet]).
    
     [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
      *)

  text_transformation: text_transformation;
  [@ocaml.doc {| 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on [RegexPatternSet] before inspecting a request for a match.
    
     You can only specify a single type of TextTransformation.
     
      {b CMD_LINE}
      
       When you're concerned that attackers are injecting an operating system commandline command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:
       
        {ul
             {- Delete the following characters: \ " ' ^
                
                }
              {- Delete spaces before the following characters: / (
                 
                 }
              {- Replace the following characters with a space: , ;
                 
                 }
              {- Replace multiple spaces with one space
                 
                 }
              {- Convert uppercase letters (A-Z) to lowercase (a-z)
                 
                 }
             
      }
       {b COMPRESS_WHITE_SPACE}
       
        Use this option to replace the following characters with a space character (decimal 32):
        
         {ul
              {- \f, formfeed, decimal 12
                 
                 }
               {- \t, tab, decimal 9
                  
                  }
               {- \n, newline, decimal 10
                  
                  }
               {- \r, carriage return, decimal 13
                  
                  }
               {- \v, vertical tab, decimal 11
                  
                  }
               {- non-breaking space, decimal 160
                  
                  }
              
      }
       [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.
       
        {b HTML_ENTITY_DECODE}
        
         Use this option to replace HTML-encoded characters with unencoded characters. [HTML_ENTITY_DECODE] performs the following operations:
         
          {ul
               {- Replaces [(ampersand)quot;] with ["]
                  
                  }
                {- Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160
                   
                   }
                {- Replaces [(ampersand)lt;] with a "less than" symbol
                   
                   }
                {- Replaces [(ampersand)gt;] with [>]
                   
                   }
                {- Replaces characters that are represented in hexadecimal format, [(ampersand)#xhhhh;], with the corresponding characters
                   
                   }
                {- Replaces characters that are represented in decimal format, [(ampersand)#nnnn;], with the corresponding characters
                   
                   }
               
      }
       {b LOWERCASE}
       
        Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
        
         {b URL_DECODE}
         
          Use this option to decode a URL-encoded value.
          
           {b NONE}
           
            Specify [NONE] if you don't want to perform any text transformations.
             |}]

  field_to_match: field_to_match;
  (** 
    Specifies where in a web request to look for the [RegexPatternSet].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In an [UpdateRegexMatchSet] request, [RegexMatchSetUpdate] specifies whether to insert or delete a [RegexMatchTuple] and includes the settings for the [RegexMatchTuple].
       *)
type regex_match_set_update = {
  regex_match_tuple: regex_match_tuple;
  (** 
    Information about the part of a web request that you want AWS WAF to inspect and the identifier of the regular expression (regex) pattern that you want AWS WAF to search for. If you specify [DELETE] for the value of [Action], the [RegexMatchTuple] values must exactly match the values in the [RegexMatchTuple] that you want to delete from the [RegexMatchSet].
     *)

  action: change_action;
  (** 
    Specifies whether to insert or delete a [RegexMatchTuple].
     *)

}

type update_regex_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  updates: regex_match_set_update list;
  (** 
    An array of [RegexMatchSetUpdate] objects that you want to insert into or delete from a [RegexMatchSet]. For more information, see [RegexMatchTuple].
     *)

  regex_match_set_id: string;
  (** 
    The [RegexMatchSetId] of the [RegexMatchSet] that you want to update. [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].
     *)

}

type update_rate_based_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateRateBasedRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type update_rate_based_rule_request = {
  rate_limit: int;
  (** 
    The maximum number of requests, which have an identical value in the field specified by the [RateKey], allowed in a five-minute period. If the number of requests exceeds the [RateLimit] and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.
     *)

  updates: rule_update list;
  (** 
    An array of [RuleUpdate] objects that you want to insert into or delete from a [RateBasedRule].
     *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  rule_id: string;
  (** 
    The [RuleId] of the [RateBasedRule] that you want to update. [RuleId] is returned by [CreateRateBasedRule] and by [ListRateBasedRules].
     *)

}

type update_ip_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateIPSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type ip_set_descriptor_type = | IPV6
  | IPV4

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR format) that web requests originate from.
       *)
type ip_set_descriptor = {
  value: string;
  (** 
    Specify an IPv4 address by using CIDR notation. For example:
    
     {ul
          {- To configure AWS WAF to allow, block, or count requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].
             
             }
           {- To configure AWS WAF to allow, block, or count requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].
              
              }
          
      }
       For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
       
        Specify an IPv6 address by using CIDR notation. For example:
        
         {ul
              {- To configure AWS WAF to allow, block, or count requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].
                 
                 }
               {- To configure AWS WAF to allow, block, or count requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].
                  
                  }
              
      }
       *)

  type_: ip_set_descriptor_type;
  (** 
    Specify [IPV4] or [IPV6].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the type of update to perform to an [IPSet] with [UpdateIPSet].
       *)
type ip_set_update = {
  ip_set_descriptor: ip_set_descriptor;
  (** 
    The IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR notation) that web requests originate from.
     *)

  action: change_action;
  (** 
    Specifies whether to insert or delete an IP address with [UpdateIPSet].
     *)

}

type update_ip_set_request = {
  updates: ip_set_update list;
  (** 
    An array of [IPSetUpdate] objects that you want to insert into or delete from an [IPSet]. For more information, see the applicable data types:
    
     {ul
          {- [IPSetUpdate]: Contains [Action] and [IPSetDescriptor]
             
             }
           {- [IPSetDescriptor]: Contains [Type] and [Value]
              
              }
          
      }
       You can insert a maximum of 1000 addresses in a single request.
        *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  ip_set_id: string;
  (** 
    The [IPSetId] of the [IPSet] that you want to update. [IPSetId] is returned by [CreateIPSet] and by [ListIPSets].
     *)

}

type update_geo_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateGeoMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type geo_match_constraint_type = | Country

type geo_match_constraint_value = | ZW
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
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The country from which web requests originate that you want AWS WAF to search for.
       *)
type geo_match_constraint = {
  value: geo_match_constraint_value;
  (** 
    The country that you want AWS WAF to search for.
     *)

  type_: geo_match_constraint_type;
  (** 
    The type of geographical area you want AWS WAF to search for. Currently [Country] is the only valid value.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Specifies the type of update to perform to an [GeoMatchSet] with [UpdateGeoMatchSet].
       *)
type geo_match_set_update = {
  geo_match_constraint: geo_match_constraint;
  (** 
    The country from which web requests originate that you want AWS WAF to search for.
     *)

  action: change_action;
  (** 
    Specifies whether to insert or delete a country with [UpdateGeoMatchSet].
     *)

}

type update_geo_match_set_request = {
  updates: geo_match_set_update list;
  (** 
    An array of [GeoMatchSetUpdate] objects that you want to insert into or delete from an [GeoMatchSet]. For more information, see the applicable data types:
    
     {ul
          {- [GeoMatchSetUpdate]: Contains [Action] and [GeoMatchConstraint]
             
             }
           {- [GeoMatchConstraint]: Contains [Type] and [Value]
              
               You can have only one [Type] and [Value] per [GeoMatchConstraint]. To add multiple countries, include multiple [GeoMatchSetUpdate] objects in your request.
               
               }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  geo_match_set_id: string;
  (** 
    The [GeoMatchSetId] of the [GeoMatchSet] that you want to update. [GeoMatchSetId] is returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].
     *)

}

type update_byte_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [UpdateByteMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type positional_constraint = | CONTAINS_WORD
  | CONTAINS
  | ENDS_WITH
  | STARTS_WITH
  | EXACTLY

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings.
       *)
type byte_match_tuple = {
  positional_constraint: positional_constraint;
  (** 
    Within the portion of a web request that you want to search (for example, in the query string, if any), specify where you want AWS WAF to search. Valid values include the following:
    
     {b CONTAINS}
     
      The specified part of the web request must include the value of [TargetString], but the location doesn't matter.
      
       {b CONTAINS_WORD}
       
        The specified part of the web request must include the value of [TargetString], and [TargetString] must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition, [TargetString] must be a word, which means one of the following:
        
         {ul
              {- [TargetString] exactly matches the value of the specified part of the web request, such as the value of a header.
                 
                 }
               {- [TargetString] is at the beginning of the specified part of the web request and is followed by a character other than an alphanumeric character or underscore (_), for example, [BadBot;].
                  
                  }
               {- [TargetString] is at the end of the specified part of the web request and is preceded by a character other than an alphanumeric character or underscore (_), for example, [;BadBot].
                  
                  }
               {- [TargetString] is in the middle of the specified part of the web request and is preceded and followed by characters other than alphanumeric characters or underscore (_), for example, [-BadBot;].
                  
                  }
              
      }
       {b EXACTLY}
       
        The value of the specified part of the web request must exactly match the value of [TargetString].
        
         {b STARTS_WITH}
         
          The value of [TargetString] must appear at the beginning of the specified part of the web request.
          
           {b ENDS_WITH}
           
            The value of [TargetString] must appear at the end of the specified part of the web request.
             *)

  text_transformation: text_transformation;
  [@ocaml.doc {| 
    Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on [FieldToMatch] before inspecting it for a match.
    
     You can only specify a single type of TextTransformation.
     
      {b CMD_LINE}
      
       When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:
       
        {ul
             {- Delete the following characters: \ " ' ^
                
                }
              {- Delete spaces before the following characters: / (
                 
                 }
              {- Replace the following characters with a space: , ;
                 
                 }
              {- Replace multiple spaces with one space
                 
                 }
              {- Convert uppercase letters (A-Z) to lowercase (a-z)
                 
                 }
             
      }
       {b COMPRESS_WHITE_SPACE}
       
        Use this option to replace the following characters with a space character (decimal 32):
        
         {ul
              {- \f, formfeed, decimal 12
                 
                 }
               {- \t, tab, decimal 9
                  
                  }
               {- \n, newline, decimal 10
                  
                  }
               {- \r, carriage return, decimal 13
                  
                  }
               {- \v, vertical tab, decimal 11
                  
                  }
               {- non-breaking space, decimal 160
                  
                  }
              
      }
       [COMPRESS_WHITE_SPACE] also replaces multiple spaces with one space.
       
        {b HTML_ENTITY_DECODE}
        
         Use this option to replace HTML-encoded characters with unencoded characters. [HTML_ENTITY_DECODE] performs the following operations:
         
          {ul
               {- Replaces [(ampersand)quot;] with ["]
                  
                  }
                {- Replaces [(ampersand)nbsp;] with a non-breaking space, decimal 160
                   
                   }
                {- Replaces [(ampersand)lt;] with a "less than" symbol
                   
                   }
                {- Replaces [(ampersand)gt;] with [>]
                   
                   }
                {- Replaces characters that are represented in hexadecimal format, [(ampersand)#xhhhh;], with the corresponding characters
                   
                   }
                {- Replaces characters that are represented in decimal format, [(ampersand)#nnnn;], with the corresponding characters
                   
                   }
               
      }
       {b LOWERCASE}
       
        Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
        
         {b URL_DECODE}
         
          Use this option to decode a URL-encoded value.
          
           {b NONE}
           
            Specify [NONE] if you don't want to perform any text transformations.
             |}]

  target_string: bytes;
  (** 
    The value that you want AWS WAF to search for. AWS WAF searches for the specified string in the part of web requests that you specified in [FieldToMatch]. The maximum length of the value is 50 bytes.
    
     Valid values depend on the values that you specified for [FieldToMatch]:
     
      {ul
           {- [HEADER]: The value that you want AWS WAF to search for in the request header that you specified in [FieldToMatch], for example, the value of the [User-Agent] or [Referer] header.
              
              }
            {- [METHOD]: The HTTP method, which indicates the type of operation specified in the request. CloudFront supports the following methods: [DELETE], [GET], [HEAD], [OPTIONS], [PATCH], [POST], and [PUT].
               
               }
            {- [QUERY_STRING]: The value that you want AWS WAF to search for in the query string, which is the part of a URL that appears after a [?] character.
               
               }
            {- [URI]: The value that you want AWS WAF to search for in the part of a URL that identifies a resource, for example, [/images/daily-ad.jpg].
               
               }
            {- [BODY]: The part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. The request body immediately follows the request headers. Note that only the first [8192] bytes of the request body are forwarded to AWS WAF for inspection. To allow or block requests based on the length of the body, you can create a size constraint set. For more information, see [CreateSizeConstraintSet].
               
               }
            {- [SINGLE_QUERY_ARG]: The parameter in the query string that you will inspect, such as {i UserName} or {i SalesRegion}. The maximum length for [SINGLE_QUERY_ARG] is 30 characters.
               
               }
            {- [ALL_QUERY_ARGS]: Similar to [SINGLE_QUERY_ARG], but instead of inspecting a single parameter, AWS WAF inspects all parameters within the query string for the value or regex pattern that you specify in [TargetString].
               
               }
           
      }
       If [TargetString] includes alphabetic characters A-Z and a-z, note that the value is case sensitive.
       
        {b If you're using the AWS WAF API}
        
         Specify a base64-encoded version of the value. The maximum length of the value before you base64-encode it is 50 bytes.
         
          For example, suppose the value of [Type] is [HEADER] and the value of [Data] is [User-Agent]. If you want to search the [User-Agent] header for the value [BadBot], you base64-encode [BadBot] using MIME base64-encoding and include the resulting value, [QmFkQm90], in the value of [TargetString].
          
           {b If you're using the AWS CLI or one of the AWS SDKs}
           
            The value that you want AWS WAF to search for. The SDK automatically base64 encodes the value.
             *)

  field_to_match: field_to_match;
  (** 
    The part of a web request that you want AWS WAF to search, such as a specified header or a query string. For more information, see [FieldToMatch].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In an [UpdateByteMatchSet] request, [ByteMatchSetUpdate] specifies whether to insert or delete a [ByteMatchTuple] and includes the settings for the [ByteMatchTuple].
       *)
type byte_match_set_update = {
  byte_match_tuple: byte_match_tuple;
  (** 
    Information about the part of a web request that you want AWS WAF to inspect and the value that you want AWS WAF to search for. If you specify [DELETE] for the value of [Action], the [ByteMatchTuple] values must exactly match the values in the [ByteMatchTuple] that you want to delete from the [ByteMatchSet].
     *)

  action: change_action;
  (** 
    Specifies whether to insert or delete a [ByteMatchTuple].
     *)

}

type update_byte_match_set_request = {
  updates: byte_match_set_update list;
  (** 
    An array of [ByteMatchSetUpdate] objects that you want to insert into or delete from a [ByteMatchSet]. For more information, see the applicable data types:
    
     {ul
          {- [ByteMatchSetUpdate]: Contains [Action] and [ByteMatchTuple]
             
             }
           {- [ByteMatchTuple]: Contains [FieldToMatch], [PositionalConstraint], [TargetString], and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  byte_match_set_id: string;
  (** 
    The [ByteMatchSetId] of the [ByteMatchSet] that you want to update. [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    
     *)

  resource_ar_n: string;
  (** 
    
     *)

}

[@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time range for which you want AWS WAF to return a sample of web requests.
      
       You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"].
       
        In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the time range for which AWS WAF actually returned a sample of web requests. AWS WAF gets the specified number of requests from among the first 5,000 requests that your AWS resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, AWS WAF stops sampling after the 5,000th request. In that case, [EndTime] is the time that AWS WAF received the 5,000th request.
         |}]
type time_window = {
  end_time: float;
  [@ocaml.doc {| 
    The end of the time range from which you want [GetSampledRequests] to return a sample of the requests that your AWS resource received. You must specify the date and time in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     |}]

  start_time: float;
  [@ocaml.doc {| 
    The beginning of the time range from which you want [GetSampledRequests] to return a sample of the requests that your AWS resource received. You must specify the date and time in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     |}]

}

type tag_resource_response = unit

[@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
      
       Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
        |}]
type tag = {
  value: string;
  (** 
    
     *)

  key: string;
  (** 
    
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    
     *)

  resource_ar_n: string;
  (** 
    
     *)

}

[@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Information for a tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
      
       Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
        |}]
type tag_info_for_resource = {
  tag_list: tag list option;
  (** 
    
     *)

  resource_ar_n: string option;
  (** 
    
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A summary of the rule groups you are subscribed to.
       *)
type subscribed_rule_group_summary = {
  metric_name: string;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [RuleGroup]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [RuleGroup].
     |}]

  name: string;
  (** 
    A friendly name or description of the [RuleGroup]. You can't change the name of a [RuleGroup] after you create it.
     *)

  rule_group_id: string;
  (** 
    A unique identifier for a [RuleGroup].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The [Id] and [Name] of a [SqlInjectionMatchSet].
       *)
type sql_injection_match_set_summary = {
  name: string;
  (** 
    The name of the [SqlInjectionMatchSet], if any, specified by [Id].
     *)

  sql_injection_match_set_id: string;
  (** 
    A unique identifier for a [SqlInjectionMatchSet]. You use [SqlInjectionMatchSetId] to get information about a [SqlInjectionMatchSet] (see [GetSqlInjectionMatchSet]), update a [SqlInjectionMatchSet] (see [UpdateSqlInjectionMatchSet]), insert a [SqlInjectionMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SqlInjectionMatchSet] from AWS WAF (see [DeleteSqlInjectionMatchSet]).
    
     [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by [ListSqlInjectionMatchSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A complex type that contains [SqlInjectionMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header. If a [SqlInjectionMatchSet] contains more than one [SqlInjectionMatchTuple] object, a request needs to include snippets of SQL code in only one of the specified parts of the request to be considered a match.
       *)
type sql_injection_match_set = {
  sql_injection_match_tuples: sql_injection_match_tuple list;
  (** 
    Specifies the parts of web requests that you want to inspect for snippets of malicious SQL code.
     *)

  name: string option;
  (** 
    The name, if any, of the [SqlInjectionMatchSet].
     *)

  sql_injection_match_set_id: string;
  (** 
    A unique identifier for a [SqlInjectionMatchSet]. You use [SqlInjectionMatchSetId] to get information about a [SqlInjectionMatchSet] (see [GetSqlInjectionMatchSet]), update a [SqlInjectionMatchSet] (see [UpdateSqlInjectionMatchSet]), insert a [SqlInjectionMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SqlInjectionMatchSet] from AWS WAF (see [DeleteSqlInjectionMatchSet]).
    
     [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by [ListSqlInjectionMatchSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The [Id] and [Name] of a [SizeConstraintSet].
       *)
type size_constraint_set_summary = {
  name: string;
  (** 
    The name of the [SizeConstraintSet], if any.
     *)

  size_constraint_set_id: string;
  (** 
    A unique identifier for a [SizeConstraintSet]. You use [SizeConstraintSetId] to get information about a [SizeConstraintSet] (see [GetSizeConstraintSet]), update a [SizeConstraintSet] (see [UpdateSizeConstraintSet]), insert a [SizeConstraintSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SizeConstraintSet] from AWS WAF (see [DeleteSizeConstraintSet]).
    
     [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by [ListSizeConstraintSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A complex type that contains [SizeConstraint] objects, which specify the parts of web requests that you want AWS WAF to inspect the size of. If a [SizeConstraintSet] contains more than one [SizeConstraint] object, a request only needs to match one constraint to be considered a match.
       *)
type size_constraint_set = {
  size_constraints: size_constraint list;
  (** 
    Specifies the parts of web requests that you want to inspect the size of.
     *)

  name: string option;
  (** 
    The name, if any, of the [SizeConstraintSet].
     *)

  size_constraint_set_id: string;
  (** 
    A unique identifier for a [SizeConstraintSet]. You use [SizeConstraintSetId] to get information about a [SizeConstraintSet] (see [GetSizeConstraintSet]), update a [SizeConstraintSet] (see [UpdateSizeConstraintSet]), insert a [SizeConstraintSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [SizeConstraintSet] from AWS WAF (see [DeleteSizeConstraintSet]).
    
     [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by [ListSizeConstraintSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The response from a [GetSampledRequests] request includes an [HTTPHeader] complex type that appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all of the headers that appear in one of the web requests that were returned by [GetSampledRequests].
       *)
type http_header = {
  value: string option;
  (** 
    The value of one of the headers in the sampled web request.
     *)

  name: string option;
  (** 
    The name of one of the headers in the sampled web request.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The response from a [GetSampledRequests] request includes an [HTTPRequest] complex type that appears as [Request] in the response syntax. [HTTPRequest] contains information about one of the web requests that were returned by [GetSampledRequests].
       *)
type http_request = {
  headers: http_header list option;
  (** 
    A complex type that contains two values for each header in the sampled web request: the name of the header and the value of the header.
     *)

  http_version: string option;
  (** 
    The HTTP version specified in the sampled web request, for example, [HTTP/1.1].
     *)

  method_: string option;
  (** 
    The HTTP method specified in the sampled web request. CloudFront supports the following methods: [DELETE], [GET], [HEAD], [OPTIONS], [PATCH], [POST], and [PUT].
     *)

  ur_i: string option;
  (** 
    The part of a web request that identifies the resource, for example, [/images/daily-ad.jpg].
     *)

  country: string option;
  (** 
    The two-letter country code for the country that the request originated from. For a current list of country codes, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}ISO 3166-1 alpha-2}.
     *)

  client_i_p: string option;
  (** 
    The IP address that the request originated from. If the [WebACL] is associated with a CloudFront distribution, this is the value of one of the following fields in CloudFront access logs:
    
     {ul
          {- [c-ip], if the viewer did not use an HTTP proxy or a load balancer to send the request
             
             }
           {- [x-forwarded-for], if the viewer did use an HTTP proxy or a load balancer to send the request
              
              }
          
      }
       *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The response from a [GetSampledRequests] request includes a [SampledHTTPRequests] complex type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains one [SampledHTTPRequest] object for each web request that is returned by [GetSampledRequests].
       *)
type sampled_http_request = {
  rule_within_rule_group: string option;
  (** 
    This value is returned if the [GetSampledRequests] request specifies the ID of a [RuleGroup] rather than the ID of an individual rule. [RuleWithinRuleGroup] is the rule within the specified [RuleGroup] that matched the request listed in the response.
     *)

  action: string option;
  (** 
    The action for the [Rule] that the request matched: [ALLOW], [BLOCK], or [COUNT].
     *)

  timestamp_: float option;
  (** 
    The time at which AWS WAF received the request from your AWS resource, in Unix time format (in seconds).
     *)

  weight: int;
  (** 
    A value that indicates how one result in the response relates proportionally to other results in the response. A result that has a weight of [2] represents roughly twice as many CloudFront web requests as a result that has a weight of [1].
     *)

  request: http_request;
  (** 
    A complex type that contains detailed information about the request.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the identifier and the friendly name or description of the [Rule].
       *)
type rule_summary = {
  name: string;
  (** 
    A friendly name or description of the [Rule]. You can't change the name of a [Rule] after you create it.
     *)

  rule_id: string;
  (** 
    A unique identifier for a [Rule]. You use [RuleId] to get more information about a [Rule] (see [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or delete one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see [DeleteRule]).
    
     [RuleId] is returned by [CreateRule] and by [ListRules].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the identifier and the friendly name or description of the [RuleGroup].
       *)
type rule_group_summary = {
  name: string;
  (** 
    A friendly name or description of the [RuleGroup]. You can't change the name of a [RuleGroup] after you create it.
     *)

  rule_group_id: string;
  (** 
    A unique identifier for a [RuleGroup]. You use [RuleGroupId] to get more information about a [RuleGroup] (see [GetRuleGroup]), update a [RuleGroup] (see [UpdateRuleGroup]), insert a [RuleGroup] into a [WebACL] or delete one from a [WebACL] (see [UpdateWebACL]), or delete a [RuleGroup] from AWS WAF (see [DeleteRuleGroup]).
    
     [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A collection of predefined rules that you can add to a web ACL.
      
       Rule groups are subject to the following limits:
       
        {ul
             {- Three rule groups per account. You can request an increase to this limit by contacting customer support.
                
                }
              {- One rule group per web ACL.
                 
                 }
              {- Ten rules per rule group.
                 
                 }
             
      }
       *)
type rule_group = {
  metric_name: string option;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [RuleGroup]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [RuleGroup].
     |}]

  name: string option;
  (** 
    The friendly name or description for the [RuleGroup]. You can't change the name of a [RuleGroup] after you create it.
     *)

  rule_group_id: string;
  (** 
    A unique identifier for a [RuleGroup]. You use [RuleGroupId] to get more information about a [RuleGroup] (see [GetRuleGroup]), update a [RuleGroup] (see [UpdateRuleGroup]), insert a [RuleGroup] into a [WebACL] or delete a one from a [WebACL] (see [UpdateWebACL]), or delete a [RuleGroup] from AWS WAF (see [DeleteRuleGroup]).
    
     [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A combination of [ByteMatchSet], [IPSet], and/or [SqlInjectionMatchSet] objects that identify the web requests that you want to allow, block, or count. For example, you might create a [Rule] that includes the following predicates:
      
       {ul
            {- An [IPSet] that causes AWS WAF to search for web requests that originate from the IP address [192.0.2.44]
               
               }
             {- A [ByteMatchSet] that causes AWS WAF to search for web requests for which the value of the [User-Agent] header is [BadBot].
                
                }
            
      }
       To match the settings in this [Rule], a request must originate from [192.0.2.44] AND include a [User-Agent] header for which the value is [BadBot].
        *)
type rule = {
  predicates: predicate list;
  (** 
    The [Predicates] object contains one [Predicate] element for each [ByteMatchSet], [IPSet], or [SqlInjectionMatchSet] object that you want to include in a [Rule].
     *)

  metric_name: string option;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [Rule]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change [MetricName] after you create the [Rule].
     |}]

  name: string option;
  (** 
    The friendly name or description for the [Rule]. You can't change the name of a [Rule] after you create it.
     *)

  rule_id: string;
  (** 
    A unique identifier for a [Rule]. You use [RuleId] to get more information about a [Rule] (see [GetRule]), update a [Rule] (see [UpdateRule]), insert a [Rule] into a [WebACL] or delete a one from a [WebACL] (see [UpdateWebACL]), or delete a [Rule] from AWS WAF (see [DeleteRule]).
    
     [RuleId] is returned by [CreateRule] and by [ListRules].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returned by [ListRegexPatternSets]. Each [RegexPatternSetSummary] object includes the [Name] and [RegexPatternSetId] for one [RegexPatternSet].
       *)
type regex_pattern_set_summary = {
  name: string;
  (** 
    A friendly name or description of the [RegexPatternSet]. You can't change [Name] after you create a [RegexPatternSet].
     *)

  regex_pattern_set_id: string;
  (** 
    The [RegexPatternSetId] for a [RegexPatternSet]. You use [RegexPatternSetId] to get information about a [RegexPatternSet], update a [RegexPatternSet], remove a [RegexPatternSet] from a [RegexMatchSet], and delete a [RegexPatternSet] from AWS WAF.
    
     [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The [RegexPatternSet] specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
       *)
type regex_pattern_set = {
  regex_pattern_strings: string list;
  (** 
    Specifies the regular expression (regex) patterns that you want AWS WAF to search for, such as [B\[a@\]dB\[o0\]t].
     *)

  name: string option;
  (** 
    A friendly name or description of the [RegexPatternSet]. You can't change [Name] after you create a [RegexPatternSet].
     *)

  regex_pattern_set_id: string;
  (** 
    The identifier for the [RegexPatternSet]. You use [RegexPatternSetId] to get information about a [RegexPatternSet], update a [RegexPatternSet], remove a [RegexPatternSet] from a [RegexMatchSet], and delete a [RegexPatternSet] from AWS WAF.
    
     [RegexMatchSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returned by [ListRegexMatchSets]. Each [RegexMatchSetSummary] object includes the [Name] and [RegexMatchSetId] for one [RegexMatchSet].
       *)
type regex_match_set_summary = {
  name: string;
  (** 
    A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you create a [RegexMatchSet].
     *)

  regex_match_set_id: string;
  (** 
    The [RegexMatchSetId] for a [RegexMatchSet]. You use [RegexMatchSetId] to get information about a [RegexMatchSet], update a [RegexMatchSet], remove a [RegexMatchSet] from a [Rule], and delete a [RegexMatchSet] from AWS WAF.
    
     [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].
      *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In a [GetRegexMatchSet] request, [RegexMatchSet] is a complex type that contains the [RegexMatchSetId] and [Name] of a [RegexMatchSet], and the values that you specified when you updated the [RegexMatchSet].
      
       The values are contained in a [RegexMatchTuple] object, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a [RegexMatchSet] contains more than one [RegexMatchTuple] object, a request needs to match the settings in only one [ByteMatchTuple] to be considered a match.
        *)
type regex_match_set = {
  regex_match_tuples: regex_match_tuple list option;
  (** 
    Contains an array of [RegexMatchTuple] objects. Each [RegexMatchTuple] object contains:
    
     {ul
          {- The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the [User-Agent] header.
             
             }
           {- The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see [RegexPatternSet].
              
              }
           {- Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
              
              }
          
      }
       *)

  name: string option;
  (** 
    A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you create a [RegexMatchSet].
     *)

  regex_match_set_id: string option;
  (** 
    The [RegexMatchSetId] for a [RegexMatchSet]. You use [RegexMatchSetId] to get information about a [RegexMatchSet] (see [GetRegexMatchSet]), update a [RegexMatchSet] (see [UpdateRegexMatchSet]), insert a [RegexMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [RegexMatchSet] from AWS WAF (see [DeleteRegexMatchSet]).
    
     [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].
      *)

}

type rate_key = | IP

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      A [RateBasedRule] is identical to a regular [Rule], with one addition: a [RateBasedRule] counts the number of requests that arrive from a specified IP address every five minutes. For example, based on recent requests that you've seen from an attacker, you might create a [RateBasedRule] that includes the following conditions:
      
       {ul
            {- The requests come from 192.0.2.44.
               
               }
             {- They contain the value [BadBot] in the [User-Agent] header.
                
                }
            
      }
       In the rule, you also define the rate limit as 1,000.
       
        Requests that meet both of these conditions and exceed 1,000 requests every five minutes trigger the rule's action (block or count), which is defined in the web ACL.
         *)
type rate_based_rule = {
  rate_limit: int;
  (** 
    The maximum number of requests, which have an identical value in the field specified by the [RateKey], allowed in a five-minute period. If the number of requests exceeds the [RateLimit] and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.
     *)

  rate_key: rate_key;
  (** 
    The field that AWS WAF uses to determine if requests are likely arriving from single source and thus subject to rate monitoring. The only valid value for [RateKey] is [IP]. [IP] indicates that requests arriving from the same IP address are subject to the [RateLimit] that is specified in the [RateBasedRule].
     *)

  match_predicates: predicate list;
  (** 
    The [Predicates] object contains one [Predicate] element for each [ByteMatchSet], [IPSet], or [SqlInjectionMatchSet] object that you want to include in a [RateBasedRule].
     *)

  metric_name: string option;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for a [RateBasedRule]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [RateBasedRule].
     |}]

  name: string option;
  (** 
    A friendly name or description for a [RateBasedRule]. You can't change the name of a [RateBasedRule] after you create it.
     *)

  rule_id: string;
  (** 
    A unique identifier for a [RateBasedRule]. You use [RuleId] to get more information about a [RateBasedRule] (see [GetRateBasedRule]), update a [RateBasedRule] (see [UpdateRateBasedRule]), insert a [RateBasedRule] into a [WebACL] or delete one from a [WebACL] (see [UpdateWebACL]), or delete a [RateBasedRule] from AWS WAF (see [DeleteRateBasedRule]).
     *)

}

type put_permission_policy_response = unit

type put_permission_policy_request = {
  policy: string;
  (** 
    The policy to attach to the specified RuleGroup.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the RuleGroup to which you want to attach the policy.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      The Amazon Kinesis Data Firehose, [RedactedFields] information, and the web ACL Amazon Resource Name (ARN).
       *)
type logging_configuration = {
  redacted_fields: field_to_match list option;
  (** 
    The parts of the request that you want redacted from the logs. For example, if you redact the cookie field, the cookie field in the firehose will be [xxx].
     *)

  log_destination_configs: string list;
  (** 
    An array of Amazon Kinesis Data Firehose ARNs.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL that you want to associate with [LogDestinationConfigs].
     *)

}

type put_logging_configuration_response = {
  logging_configuration: logging_configuration option;
  (** 
    The [LoggingConfiguration] that you submitted in the request.
     *)

}

type put_logging_configuration_request = {
  logging_configuration: logging_configuration;
  (** 
    The Amazon Kinesis Data Firehose that contains the inspected traffic information, the redacted fields details, and the Amazon Resource Name (ARN) of the web ACL to monitor.
    
     When specifying [Type] in [RedactedFields], you must use one of the following values: [URI], [QUERY_STRING], [HEADER], or [METHOD].
     
      *)

}

(** 
    The response to a [ListXssMatchSets] request.
     *)
type list_xss_match_sets_response = {
  xss_match_sets: xss_match_set_summary list option;
  (** 
    An array of [XssMatchSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [XssMatchSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [XssMatchSet] objects, submit another [ListXssMatchSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

(** 
    A request to list the [XssMatchSet] objects created by the current AWS account.
     *)
type list_xss_match_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [XssMatchSet] objects that you want AWS WAF to return for this request. If you have more [XssMatchSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [Rules].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [XssMatchSet] objects than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [XssMatchSets]. For the second and subsequent [ListXssMatchSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [XssMatchSets].
     *)

}

type list_web_ac_ls_response = {
  web_ac_ls: web_acl_summary list option;
  (** 
    An array of [WebACLSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [WebACL] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [WebACL] objects, submit another [ListWebACLs] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_web_ac_ls_request = {
  limit: int option;
  (** 
    Specifies the number of [WebACL] objects that you want AWS WAF to return for this request. If you have more [WebACL] objects than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [WebACL] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [WebACL] objects than the number that you specify for [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [WebACL] objects. For the second and subsequent [ListWebACLs] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [WebACL] objects.
     *)

}

type list_tags_for_resource_response = {
  tag_info_for_resource: tag_info_for_resource option;
  (** 
    
     *)

  next_marker: string option;
  (** 
    
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    
     *)

  limit: int option;
  (** 
    
     *)

  next_marker: string option;
  (** 
    
     *)

}

type list_subscribed_rule_groups_response = {
  rule_groups: subscribed_rule_group_summary list option;
  (** 
    An array of [RuleGroup] objects.
     *)

  next_marker: string option;
  (** 
    If you have more objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more objects, submit another [ListSubscribedRuleGroups] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_subscribed_rule_groups_request = {
  limit: int option;
  (** 
    Specifies the number of subscribed rule groups that you want AWS WAF to return for this request. If you have more objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [ByteMatchSets]subscribed rule groups than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of subscribed rule groups. For the second and subsequent [ListSubscribedRuleGroupsRequest] requests, specify the value of [NextMarker] from the previous response to get information about another batch of subscribed rule groups.
     *)

}

(** 
    The response to a [ListSqlInjectionMatchSets] request.
     *)
type list_sql_injection_match_sets_response = {
  sql_injection_match_sets: sql_injection_match_set_summary list option;
  (** 
    An array of [SqlInjectionMatchSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [SqlInjectionMatchSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [SqlInjectionMatchSet] objects, submit another [ListSqlInjectionMatchSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

(** 
    A request to list the [SqlInjectionMatchSet] objects created by the current AWS account.
     *)
type list_sql_injection_match_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [SqlInjectionMatchSet] objects that you want AWS WAF to return for this request. If you have more [SqlInjectionMatchSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [Rules].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [SqlInjectionMatchSet] objects than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [SqlInjectionMatchSets]. For the second and subsequent [ListSqlInjectionMatchSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [SqlInjectionMatchSets].
     *)

}

type list_size_constraint_sets_response = {
  size_constraint_sets: size_constraint_set_summary list option;
  (** 
    An array of [SizeConstraintSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [SizeConstraintSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [SizeConstraintSet] objects, submit another [ListSizeConstraintSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_size_constraint_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [SizeConstraintSet] objects that you want AWS WAF to return for this request. If you have more [SizeConstraintSets] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [SizeConstraintSet] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [SizeConstraintSets] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [SizeConstraintSets]. For the second and subsequent [ListSizeConstraintSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [SizeConstraintSets].
     *)

}

type list_rules_response = {
  rules: rule_summary list option;
  (** 
    An array of [RuleSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [Rules] than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [Rules], submit another [ListRules] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_rules_request = {
  limit: int option;
  (** 
    Specifies the number of [Rules] that you want AWS WAF to return for this request. If you have more [Rules] than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [Rules].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [Rules] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [Rules]. For the second and subsequent [ListRules] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [Rules].
     *)

}

type list_rule_groups_response = {
  rule_groups: rule_group_summary list option;
  (** 
    An array of [RuleGroup] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [RuleGroups] than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [RuleGroups], submit another [ListRuleGroups] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_rule_groups_request = {
  limit: int option;
  (** 
    Specifies the number of [RuleGroups] that you want AWS WAF to return for this request. If you have more [RuleGroups] than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [RuleGroups].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [RuleGroups] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [RuleGroups]. For the second and subsequent [ListRuleGroups] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [RuleGroups].
     *)

}

type list_regex_pattern_sets_response = {
  regex_pattern_sets: regex_pattern_set_summary list option;
  (** 
    An array of [RegexPatternSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [RegexPatternSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [RegexPatternSet] objects, submit another [ListRegexPatternSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_regex_pattern_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [RegexPatternSet] objects that you want AWS WAF to return for this request. If you have more [RegexPatternSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [RegexPatternSet] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [RegexPatternSet] objects than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [RegexPatternSet] objects. For the second and subsequent [ListRegexPatternSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [RegexPatternSet] objects.
     *)

}

type list_regex_match_sets_response = {
  regex_match_sets: regex_match_set_summary list option;
  (** 
    An array of [RegexMatchSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [RegexMatchSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [RegexMatchSet] objects, submit another [ListRegexMatchSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_regex_match_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [RegexMatchSet] objects that you want AWS WAF to return for this request. If you have more [RegexMatchSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [RegexMatchSet] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [RegexMatchSet] objects than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [ByteMatchSets]. For the second and subsequent [ListRegexMatchSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [RegexMatchSet] objects.
     *)

}

type list_rate_based_rules_response = {
  rules: rule_summary list option;
  (** 
    An array of [RuleSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [Rules] than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [Rules], submit another [ListRateBasedRules] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_rate_based_rules_request = {
  limit: int option;
  (** 
    Specifies the number of [Rules] that you want AWS WAF to return for this request. If you have more [Rules] than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [Rules].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [Rules] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [Rules]. For the second and subsequent [ListRateBasedRules] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [Rules].
     *)

}

type list_logging_configurations_response = {
  next_marker: string option;
  (** 
    If you have more [LoggingConfigurations] than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [LoggingConfigurations], submit another [ListLoggingConfigurations] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

  logging_configurations: logging_configuration list option;
  (** 
    An array of [LoggingConfiguration] objects.
     *)

}

type list_logging_configurations_request = {
  limit: int option;
  (** 
    Specifies the number of [LoggingConfigurations] that you want AWS WAF to return for this request. If you have more [LoggingConfigurations] than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [LoggingConfigurations].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [LoggingConfigurations] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [LoggingConfigurations]. For the second and subsequent [ListLoggingConfigurations] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [ListLoggingConfigurations].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the identifier and the name of the [IPSet].
       *)
type ip_set_summary = {
  name: string;
  (** 
    A friendly name or description of the [IPSet]. You can't change the name of an [IPSet] after you create it.
     *)

  ip_set_id: string;
  (** 
    The [IPSetId] for an [IPSet]. You can use [IPSetId] in a [GetIPSet] request to get detailed information about an [IPSet].
     *)

}

type list_ip_sets_response = {
  ip_sets: ip_set_summary list option;
  (** 
    An array of [IPSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    To list more [IPSet] objects, submit another [ListIPSets] request, and in the next request use the [NextMarker] response value as the [NextMarker] value.
     *)

}

type list_ip_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [IPSet] objects that you want AWS WAF to return for this request. If you have more [IPSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [IPSet] objects.
     *)

  next_marker: string option;
  (** 
    AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [IPSets]. For the second and subsequent [ListIPSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [IPSets].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains the identifier and the name of the [GeoMatchSet].
       *)
type geo_match_set_summary = {
  name: string;
  (** 
    A friendly name or description of the [GeoMatchSet]. You can't change the name of an [GeoMatchSet] after you create it.
     *)

  geo_match_set_id: string;
  (** 
    The [GeoMatchSetId] for an [GeoMatchSet]. You can use [GeoMatchSetId] in a [GetGeoMatchSet] request to get detailed information about an [GeoMatchSet].
     *)

}

type list_geo_match_sets_response = {
  geo_match_sets: geo_match_set_summary list option;
  (** 
    An array of [GeoMatchSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [GeoMatchSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [GeoMatchSet] objects, submit another [ListGeoMatchSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_geo_match_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [GeoMatchSet] objects that you want AWS WAF to return for this request. If you have more [GeoMatchSet] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [GeoMatchSet] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [GeoMatchSet]s than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [GeoMatchSet] objects. For the second and subsequent [ListGeoMatchSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [GeoMatchSet] objects.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returned by [ListByteMatchSets]. Each [ByteMatchSetSummary] object includes the [Name] and [ByteMatchSetId] for one [ByteMatchSet].
       *)
type byte_match_set_summary = {
  name: string;
  (** 
    A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you create a [ByteMatchSet].
     *)

  byte_match_set_id: string;
  (** 
    The [ByteMatchSetId] for a [ByteMatchSet]. You use [ByteMatchSetId] to get information about a [ByteMatchSet], update a [ByteMatchSet], remove a [ByteMatchSet] from a [Rule], and delete a [ByteMatchSet] from AWS WAF.
    
     [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].
      *)

}

type list_byte_match_sets_response = {
  byte_match_sets: byte_match_set_summary list option;
  (** 
    An array of [ByteMatchSetSummary] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [ByteMatchSet] objects than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [ByteMatchSet] objects, submit another [ListByteMatchSets] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_byte_match_sets_request = {
  limit: int option;
  (** 
    Specifies the number of [ByteMatchSet] objects that you want AWS WAF to return for this request. If you have more [ByteMatchSets] objects than the number you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [ByteMatchSet] objects.
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [ByteMatchSets] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [ByteMatchSets]. For the second and subsequent [ListByteMatchSets] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [ByteMatchSets].
     *)

}

type list_activated_rules_in_rule_group_response = {
  activated_rules: activated_rule list option;
  (** 
    An array of [ActivatedRules] objects.
     *)

  next_marker: string option;
  (** 
    If you have more [ActivatedRules] than the number that you specified for [Limit] in the request, the response includes a [NextMarker] value. To list more [ActivatedRules], submit another [ListActivatedRulesInRuleGroup] request, and specify the [NextMarker] value from the response in the [NextMarker] value in the next request.
     *)

}

type list_activated_rules_in_rule_group_request = {
  limit: int option;
  (** 
    Specifies the number of [ActivatedRules] that you want AWS WAF to return for this request. If you have more [ActivatedRules] than the number that you specify for [Limit], the response includes a [NextMarker] value that you can use to get another batch of [ActivatedRules].
     *)

  next_marker: string option;
  (** 
    If you specify a value for [Limit] and you have more [ActivatedRules] than the value of [Limit], AWS WAF returns a [NextMarker] value in the response that allows you to list another group of [ActivatedRules]. For the second and subsequent [ListActivatedRulesInRuleGroup] requests, specify the value of [NextMarker] from the previous response to get information about another batch of [ActivatedRules].
     *)

  rule_group_id: string option;
  (** 
    The [RuleGroupId] of the [RuleGroup] for which you want to get a list of [ActivatedRule] objects.
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains one or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128.
      
       To specify an individual IP address, you specify the four-part IP address followed by a [/32], for example, 192.0.2.0/32. To block a range of IP addresses, you can specify /8 or any range between /16 through /32 (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
        *)
type ip_set = {
  ip_set_descriptors: ip_set_descriptor list;
  (** 
    The IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR notation) that web requests originate from. If the [WebACL] is associated with a CloudFront distribution and the viewer did not use an HTTP proxy or a load balancer to send the request, this is the value of the c-ip field in the CloudFront access logs.
     *)

  name: string option;
  (** 
    A friendly name or description of the [IPSet]. You can't change the name of an [IPSet] after you create it.
     *)

  ip_set_id: string;
  (** 
    The [IPSetId] for an [IPSet]. You use [IPSetId] to get information about an [IPSet] (see [GetIPSet]), update an [IPSet] (see [UpdateIPSet]), insert an [IPSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete an [IPSet] from AWS WAF (see [DeleteIPSet]).
    
     [IPSetId] is returned by [CreateIPSet] and by [ListIPSets].
      *)

}

(** 
    The response to a [GetXssMatchSet] request.
     *)
type get_xss_match_set_response = {
  xss_match_set: xss_match_set option;
  (** 
    Information about the [XssMatchSet] that you specified in the [GetXssMatchSet] request. For more information, see the following topics:
    
     {ul
          {- [XssMatchSet]: Contains [Name], [XssMatchSetId], and an array of [XssMatchTuple] objects
             
             }
           {- [XssMatchTuple]: Each [XssMatchTuple] object contains [FieldToMatch] and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

}

(** 
    A request to get an [XssMatchSet].
     *)
type get_xss_match_set_request = {
  xss_match_set_id: string;
  (** 
    The [XssMatchSetId] of the [XssMatchSet] that you want to get. [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].
     *)

}

type get_web_acl_response = {
  web_ac_l: web_ac_l option;
  (** 
    Information about the [WebACL] that you specified in the [GetWebACL] request. For more information, see the following topics:
    
     {ul
          {- [WebACL]: Contains [DefaultAction], [MetricName], [Name], an array of [Rule] objects, and [WebACLId]
             
             }
           {- [DefaultAction] (Data type is [WafAction]): Contains [Type]
              
              }
           {- [Rules]: Contains an array of [ActivatedRule] objects, which contain [Action], [Priority], and [RuleId]
              
              }
           {- [Action]: Contains [Type]
              
              }
          
      }
       *)

}

type get_web_acl_request = {
  web_acl_id: string;
  (** 
    The [WebACLId] of the [WebACL] that you want to get. [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].
     *)

}

(** 
    The response to a [GetSqlInjectionMatchSet] request.
     *)
type get_sql_injection_match_set_response = {
  sql_injection_match_set: sql_injection_match_set option;
  (** 
    Information about the [SqlInjectionMatchSet] that you specified in the [GetSqlInjectionMatchSet] request. For more information, see the following topics:
    
     {ul
          {- [SqlInjectionMatchSet]: Contains [Name], [SqlInjectionMatchSetId], and an array of [SqlInjectionMatchTuple] objects
             
             }
           {- [SqlInjectionMatchTuple]: Each [SqlInjectionMatchTuple] object contains [FieldToMatch] and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

}

(** 
    A request to get a [SqlInjectionMatchSet].
     *)
type get_sql_injection_match_set_request = {
  sql_injection_match_set_id: string;
  (** 
    The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to get. [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by [ListSqlInjectionMatchSets].
     *)

}

type get_size_constraint_set_response = {
  size_constraint_set: size_constraint_set option;
  (** 
    Information about the [SizeConstraintSet] that you specified in the [GetSizeConstraintSet] request. For more information, see the following topics:
    
     {ul
          {- [SizeConstraintSet]: Contains [SizeConstraintSetId], [SizeConstraints], and [Name]
             
             }
           {- [SizeConstraints]: Contains an array of [SizeConstraint] objects. Each [SizeConstraint] object contains [FieldToMatch], [TextTransformation], [ComparisonOperator], and [Size]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

}

type get_size_constraint_set_request = {
  size_constraint_set_id: string;
  (** 
    The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to get. [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by [ListSizeConstraintSets].
     *)

}

type get_sampled_requests_response = {
  time_window: time_window option;
  (** 
    Usually, [TimeWindow] is the time range that you specified in the [GetSampledRequests] request. However, if your AWS resource received more than 5,000 requests during the time range that you specified in the request, [GetSampledRequests] returns the time range for the first 5,000 requests. Times are in Coordinated Universal Time (UTC) format.
     *)

  population_size: int option;
  (** 
    The total number of requests from which [GetSampledRequests] got a sample of [MaxItems] requests. If [PopulationSize] is less than [MaxItems], the sample includes every request that your AWS resource received during the specified time range.
     *)

  sampled_requests: sampled_http_request list option;
  (** 
    A complex type that contains detailed information about each of the requests in the sample.
     *)

}

type get_sampled_requests_request = {
  max_items: int;
  (** 
    The number of requests that you want AWS WAF to return from among the first 5,000 requests that your AWS resource received during the time range. If your resource received fewer requests than the value of [MaxItems], [GetSampledRequests] returns information about all of them.
     *)

  time_window: time_window;
  [@ocaml.doc {| 
    The start date and time and the end date and time of the range for which you want [GetSampledRequests] to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, ["2016-09-27T14:50Z"]. You can specify any time range in the previous three hours.
     |}]

  rule_id: string;
  (** 
    [RuleId] is one of three values:
    
     {ul
          {- The [RuleId] of the [Rule] or the [RuleGroupId] of the [RuleGroup] for which you want [GetSampledRequests] to return a sample of requests.
             
             }
           {- [Default_Action], which causes [GetSampledRequests] to return a sample of the requests that didn't match any of the rules in the specified [WebACL].
              
              }
          
      }
       *)

  web_acl_id: string;
  (** 
    The [WebACLId] of the [WebACL] for which you want [GetSampledRequests] to return a sample of requests.
     *)

}

type get_rule_response = {
  rule: rule option;
  (** 
    Information about the [Rule] that you specified in the [GetRule] request. For more information, see the following topics:
    
     {ul
          {- [Rule]: Contains [MetricName], [Name], an array of [Predicate] objects, and [RuleId]
             
             }
           {- [Predicate]: Each [Predicate] object contains [DataId], [Negated], and [Type]
              
              }
          
      }
       *)

}

type get_rule_request = {
  rule_id: string;
  (** 
    The [RuleId] of the [Rule] that you want to get. [RuleId] is returned by [CreateRule] and by [ListRules].
     *)

}

type get_rule_group_response = {
  rule_group: rule_group option;
  (** 
    Information about the [RuleGroup] that you specified in the [GetRuleGroup] request.
     *)

}

type get_rule_group_request = {
  rule_group_id: string;
  (** 
    The [RuleGroupId] of the [RuleGroup] that you want to get. [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].
     *)

}

type get_regex_pattern_set_response = {
  regex_pattern_set: regex_pattern_set option;
  (** 
    Information about the [RegexPatternSet] that you specified in the [GetRegexPatternSet] request, including the identifier of the pattern set and the regular expression patterns you want AWS WAF to search for.
     *)

}

type get_regex_pattern_set_request = {
  regex_pattern_set_id: string;
  (** 
    The [RegexPatternSetId] of the [RegexPatternSet] that you want to get. [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
     *)

}

type get_regex_match_set_response = {
  regex_match_set: regex_match_set option;
  (** 
    Information about the [RegexMatchSet] that you specified in the [GetRegexMatchSet] request. For more information, see [RegexMatchTuple].
     *)

}

type get_regex_match_set_request = {
  regex_match_set_id: string;
  (** 
    The [RegexMatchSetId] of the [RegexMatchSet] that you want to get. [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].
     *)

}

type get_rate_based_rule_response = {
  rule: rate_based_rule option;
  (** 
    Information about the [RateBasedRule] that you specified in the [GetRateBasedRule] request.
     *)

}

type get_rate_based_rule_request = {
  rule_id: string;
  (** 
    The [RuleId] of the [RateBasedRule] that you want to get. [RuleId] is returned by [CreateRateBasedRule] and by [ListRateBasedRules].
     *)

}

type get_rate_based_rule_managed_keys_response = {
  next_marker: string option;
  (** 
    A null value and not currently used.
     *)

  managed_keys: string list option;
  (** 
    An array of IP addresses that currently are blocked by the specified [RateBasedRule].
     *)

}

type get_rate_based_rule_managed_keys_request = {
  next_marker: string option;
  (** 
    A null value and not currently used. Do not include this in your request.
     *)

  rule_id: string;
  (** 
    The [RuleId] of the [RateBasedRule] for which you want to get a list of [ManagedKeys]. [RuleId] is returned by [CreateRateBasedRule] and by [ListRateBasedRules].
     *)

}

type get_permission_policy_response = {
  policy: string option;
  (** 
    The IAM policy attached to the specified RuleGroup.
     *)

}

type get_permission_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the RuleGroup for which you want to get the policy.
     *)

}

type get_logging_configuration_response = {
  logging_configuration: logging_configuration option;
  (** 
    The [LoggingConfiguration] for the specified web ACL.
     *)

}

type get_logging_configuration_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL for which you want to get the [LoggingConfiguration].
     *)

}

type get_ip_set_response = {
  ip_set: ip_set option;
  (** 
    Information about the [IPSet] that you specified in the [GetIPSet] request. For more information, see the following topics:
    
     {ul
          {- [IPSet]: Contains [IPSetDescriptors], [IPSetId], and [Name]
             
             }
           {- [IPSetDescriptors]: Contains an array of [IPSetDescriptor] objects. Each [IPSetDescriptor] object contains [Type] and [Value]
              
              }
          
      }
       *)

}

type get_ip_set_request = {
  ip_set_id: string;
  (** 
    The [IPSetId] of the [IPSet] that you want to get. [IPSetId] is returned by [CreateIPSet] and by [ListIPSets].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Contains one or more countries that AWS WAF will search for.
       *)
type geo_match_set = {
  geo_match_constraints: geo_match_constraint list;
  (** 
    An array of [GeoMatchConstraint] objects, which contain the country that you want AWS WAF to search for.
     *)

  name: string option;
  (** 
    A friendly name or description of the [GeoMatchSet]. You can't change the name of an [GeoMatchSet] after you create it.
     *)

  geo_match_set_id: string;
  (** 
    The [GeoMatchSetId] for an [GeoMatchSet]. You use [GeoMatchSetId] to get information about a [GeoMatchSet] (see [GeoMatchSet]), update a [GeoMatchSet] (see [UpdateGeoMatchSet]), insert a [GeoMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [GeoMatchSet] from AWS WAF (see [DeleteGeoMatchSet]).
    
     [GeoMatchSetId] is returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].
      *)

}

type get_geo_match_set_response = {
  geo_match_set: geo_match_set option;
  (** 
    Information about the [GeoMatchSet] that you specified in the [GetGeoMatchSet] request. This includes the [Type], which for a [GeoMatchContraint] is always [Country], as well as the [Value], which is the identifier for a specific country.
     *)

}

type get_geo_match_set_request = {
  geo_match_set_id: string;
  (** 
    The [GeoMatchSetId] of the [GeoMatchSet] that you want to get. [GeoMatchSetId] is returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].
     *)

}

type change_token_status = | INSYNC
  | PENDING
  | PROVISIONED

type get_change_token_status_response = {
  change_token_status: change_token_status option;
  (** 
    The status of the change token.
     *)

}

type get_change_token_status_request = {
  change_token: string;
  (** 
    The change token for which you want to get the status. This change token was previously returned in the [GetChangeToken] response.
     *)

}

type get_change_token_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used in the request. Use this value in a [GetChangeTokenStatus] request to get the current status of the request.
     *)

}

type get_change_token_request = unit

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      In a [GetByteMatchSet] request, [ByteMatchSet] is a complex type that contains the [ByteMatchSetId] and [Name] of a [ByteMatchSet], and the values that you specified when you updated the [ByteMatchSet].
      
       A complex type that contains [ByteMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a [ByteMatchSet] contains more than one [ByteMatchTuple] object, a request needs to match the settings in only one [ByteMatchTuple] to be considered a match.
        *)
type byte_match_set = {
  byte_match_tuples: byte_match_tuple list;
  (** 
    Specifies the bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings.
     *)

  name: string option;
  (** 
    A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you create a [ByteMatchSet].
     *)

  byte_match_set_id: string;
  (** 
    The [ByteMatchSetId] for a [ByteMatchSet]. You use [ByteMatchSetId] to get information about a [ByteMatchSet] (see [GetByteMatchSet]), update a [ByteMatchSet] (see [UpdateByteMatchSet]), insert a [ByteMatchSet] into a [Rule] or delete one from a [Rule] (see [UpdateRule]), and delete a [ByteMatchSet] from AWS WAF (see [DeleteByteMatchSet]).
    
     [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].
      *)

}

type get_byte_match_set_response = {
  byte_match_set: byte_match_set option;
  (** 
    Information about the [ByteMatchSet] that you specified in the [GetByteMatchSet] request. For more information, see the following topics:
    
     {ul
          {- [ByteMatchSet]: Contains [ByteMatchSetId], [ByteMatchTuples], and [Name]
             
             }
           {- [ByteMatchTuples]: Contains an array of [ByteMatchTuple] objects. Each [ByteMatchTuple] object contains [FieldToMatch], [PositionalConstraint], [TargetString], and [TextTransformation]
              
              }
           {- [FieldToMatch]: Contains [Data] and [Type]
              
              }
          
      }
       *)

}

type get_byte_match_set_request = {
  byte_match_set_id: string;
  (** 
    The [ByteMatchSetId] of the [ByteMatchSet] that you want to get. [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].
     *)

}

(** 
    The response to a request to delete an [XssMatchSet] from AWS WAF.
     *)
type delete_xss_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteXssMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    A request to delete an [XssMatchSet] from AWS WAF.
     *)
type delete_xss_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  xss_match_set_id: string;
  (** 
    The [XssMatchSetId] of the [XssMatchSet] that you want to delete. [XssMatchSetId] is returned by [CreateXssMatchSet] and by [ListXssMatchSets].
     *)

}

type delete_web_acl_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteWebACL] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_web_acl_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  web_acl_id: string;
  (** 
    The [WebACLId] of the [WebACL] that you want to delete. [WebACLId] is returned by [CreateWebACL] and by [ListWebACLs].
     *)

}

(** 
    The response to a request to delete a [SqlInjectionMatchSet] from AWS WAF.
     *)
type delete_sql_injection_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteSqlInjectionMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

(** 
    A request to delete a [SqlInjectionMatchSet] from AWS WAF.
     *)
type delete_sql_injection_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  sql_injection_match_set_id: string;
  (** 
    The [SqlInjectionMatchSetId] of the [SqlInjectionMatchSet] that you want to delete. [SqlInjectionMatchSetId] is returned by [CreateSqlInjectionMatchSet] and by [ListSqlInjectionMatchSets].
     *)

}

type delete_size_constraint_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteSizeConstraintSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_size_constraint_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  size_constraint_set_id: string;
  (** 
    The [SizeConstraintSetId] of the [SizeConstraintSet] that you want to delete. [SizeConstraintSetId] is returned by [CreateSizeConstraintSet] and by [ListSizeConstraintSets].
     *)

}

type delete_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_rule_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  rule_id: string;
  (** 
    The [RuleId] of the [Rule] that you want to delete. [RuleId] is returned by [CreateRule] and by [ListRules].
     *)

}

type delete_rule_group_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteRuleGroup] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_rule_group_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  rule_group_id: string;
  (** 
    The [RuleGroupId] of the [RuleGroup] that you want to delete. [RuleGroupId] is returned by [CreateRuleGroup] and by [ListRuleGroups].
     *)

}

type delete_regex_pattern_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteRegexPatternSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_regex_pattern_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  regex_pattern_set_id: string;
  (** 
    The [RegexPatternSetId] of the [RegexPatternSet] that you want to delete. [RegexPatternSetId] is returned by [CreateRegexPatternSet] and by [ListRegexPatternSets].
     *)

}

type delete_regex_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteRegexMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_regex_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  regex_match_set_id: string;
  (** 
    The [RegexMatchSetId] of the [RegexMatchSet] that you want to delete. [RegexMatchSetId] is returned by [CreateRegexMatchSet] and by [ListRegexMatchSets].
     *)

}

type delete_rate_based_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteRateBasedRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_rate_based_rule_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  rule_id: string;
  (** 
    The [RuleId] of the [RateBasedRule] that you want to delete. [RuleId] is returned by [CreateRateBasedRule] and by [ListRateBasedRules].
     *)

}

type delete_permission_policy_response = unit

type delete_permission_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the RuleGroup from which you want to delete the policy.
    
     The user making the request must be the owner of the RuleGroup.
      *)

}

type delete_logging_configuration_response = unit

type delete_logging_configuration_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the web ACL from which you want to delete the [LoggingConfiguration].
     *)

}

type delete_ip_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteIPSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_ip_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  ip_set_id: string;
  (** 
    The [IPSetId] of the [IPSet] that you want to delete. [IPSetId] is returned by [CreateIPSet] and by [ListIPSets].
     *)

}

type delete_geo_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteGeoMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_geo_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  geo_match_set_id: string;
  (** 
    The [GeoMatchSetID] of the [GeoMatchSet] that you want to delete. [GeoMatchSetId] is returned by [CreateGeoMatchSet] and by [ListGeoMatchSets].
     *)

}

type delete_byte_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [DeleteByteMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

}

type delete_byte_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  byte_match_set_id: string;
  (** 
    The [ByteMatchSetId] of the [ByteMatchSet] that you want to delete. [ByteMatchSetId] is returned by [CreateByteMatchSet] and by [ListByteMatchSets].
     *)

}

(** 
    The response to a [CreateXssMatchSet] request.
     *)
type create_xss_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateXssMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  xss_match_set: xss_match_set option;
  (** 
    An [XssMatchSet].
     *)

}

(** 
    A request to create an [XssMatchSet].
     *)
type create_xss_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description for the [XssMatchSet] that you're creating. You can't change [Name] after you create the [XssMatchSet].
     *)

}

type create_web_acl_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateWebACL] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  web_ac_l: web_ac_l option;
  (** 
    The [WebACL] returned in the [CreateWebACL] response.
     *)

}

type create_web_acl_request = {
  tags: tag list option;
  (** 
    
     *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  default_action: waf_action;
  (** 
    The action that you want AWS WAF to take when a request doesn't match the criteria specified in any of the [Rule] objects that are associated with the [WebACL].
     *)

  metric_name: string;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [WebACL].The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change [MetricName] after you create the [WebACL].
     |}]

  name: string;
  (** 
    A friendly name or description of the [WebACL]. You can't change [Name] after you create the [WebACL].
     *)

}

type create_web_acl_migration_stack_response = {
  s3_object_url: string;
  (** 
    The URL of the template created in Amazon S3.
     *)

}

type create_web_acl_migration_stack_request = {
  ignore_unsupported_type: bool;
  (** 
    Indicates whether to exclude entities that can't be migrated or to stop the migration. Set this to true to ignore unsupported entities in the web ACL during the migration. Otherwise, if AWS WAF encounters unsupported entities, it stops the process and throws an exception.
     *)

  s3_bucket_name: string;
  (** 
    The name of the Amazon S3 bucket to store the CloudFormation template in. The S3 bucket must be configured as follows for the migration:
    
     {ul
          {- The bucket name must start with [aws-waf-migration-]. For example, [aws-waf-migration-my-web-acl].
             
             }
           {- The bucket must be in the Region where you are deploying the template. For example, for a web ACL in us-west-2, you must use an Amazon S3 bucket in us-west-2 and you must deploy the template stack to us-west-2.
              
              }
           {- The bucket policies must permit the migration process to write data. For listings of the bucket policies, see the Examples section.
              
              }
          
      }
       *)

  web_acl_id: string;
  (** 
    The UUID of the WAF Classic web ACL that you want to migrate to WAF v2.
     *)

}

(** 
    The response to a [CreateSqlInjectionMatchSet] request.
     *)
type create_sql_injection_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateSqlInjectionMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  sql_injection_match_set: sql_injection_match_set option;
  (** 
    A [SqlInjectionMatchSet].
     *)

}

(** 
    A request to create a [SqlInjectionMatchSet].
     *)
type create_sql_injection_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description for the [SqlInjectionMatchSet] that you're creating. You can't change [Name] after you create the [SqlInjectionMatchSet].
     *)

}

type create_size_constraint_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateSizeConstraintSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  size_constraint_set: size_constraint_set option;
  (** 
    A [SizeConstraintSet] that contains no [SizeConstraint] objects.
     *)

}

type create_size_constraint_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [SizeConstraintSet]. You can't change [Name] after you create a [SizeConstraintSet].
     *)

}

type create_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  rule: rule option;
  (** 
    The [Rule] returned in the [CreateRule] response.
     *)

}

type create_rule_request = {
  tags: tag list option;
  (** 
    
     *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  metric_name: string;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [Rule]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [Rule].
     |}]

  name: string;
  (** 
    A friendly name or description of the [Rule]. You can't change the name of a [Rule] after you create it.
     *)

}

type create_rule_group_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateRuleGroup] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  rule_group: rule_group option;
  (** 
    An empty [RuleGroup].
     *)

}

type create_rule_group_request = {
  tags: tag list option;
  (** 
    
     *)

  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  metric_name: string;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [RuleGroup]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [RuleGroup].
     |}]

  name: string;
  (** 
    A friendly name or description of the [RuleGroup]. You can't change [Name] after you create a [RuleGroup].
     *)

}

type create_regex_pattern_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateRegexPatternSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  regex_pattern_set: regex_pattern_set option;
  (** 
    A [RegexPatternSet] that contains no objects.
     *)

}

type create_regex_pattern_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [RegexPatternSet]. You can't change [Name] after you create a [RegexPatternSet].
     *)

}

type create_regex_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateRegexMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  regex_match_set: regex_match_set option;
  (** 
    A [RegexMatchSet] that contains no [RegexMatchTuple] objects.
     *)

}

type create_regex_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [RegexMatchSet]. You can't change [Name] after you create a [RegexMatchSet].
     *)

}

type create_rate_based_rule_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateRateBasedRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  rule: rate_based_rule option;
  (** 
    The [RateBasedRule] that is returned in the [CreateRateBasedRule] response.
     *)

}

type create_rate_based_rule_request = {
  tags: tag list option;
  (** 
    
     *)

  change_token: string;
  (** 
    The [ChangeToken] that you used to submit the [CreateRateBasedRule] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  rate_limit: int;
  (** 
    The maximum number of requests, which have an identical value in the field that is specified by [RateKey], allowed in a five-minute period. If the number of requests exceeds the [RateLimit] and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.
     *)

  rate_key: rate_key;
  (** 
    The field that AWS WAF uses to determine if requests are likely arriving from a single source and thus subject to rate monitoring. The only valid value for [RateKey] is [IP]. [IP] indicates that requests that arrive from the same IP address are subject to the [RateLimit] that is specified in the [RateBasedRule].
     *)

  metric_name: string;
  [@ocaml.doc {| 
    A friendly name or description for the metrics for this [RateBasedRule]. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the [RateBasedRule].
     |}]

  name: string;
  (** 
    A friendly name or description of the [RateBasedRule]. You can't change the name of a [RateBasedRule] after you create it.
     *)

}

type create_ip_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateIPSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  ip_set: ip_set option;
  (** 
    The [IPSet] returned in the [CreateIPSet] response.
     *)

}

type create_ip_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [IPSet]. You can't change [Name] after you create the [IPSet].
     *)

}

type create_geo_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateGeoMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  geo_match_set: geo_match_set option;
  (** 
    The [GeoMatchSet] returned in the [CreateGeoMatchSet] response. The [GeoMatchSet] contains no [GeoMatchConstraints].
     *)

}

type create_geo_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [GeoMatchSet]. You can't change [Name] after you create the [GeoMatchSet].
     *)

}

type create_byte_match_set_response = {
  change_token: string option;
  (** 
    The [ChangeToken] that you used to submit the [CreateByteMatchSet] request. You can also use this value to query the status of the request. For more information, see [GetChangeTokenStatus].
     *)

  byte_match_set: byte_match_set option;
  (** 
    A [ByteMatchSet] that contains no [ByteMatchTuple] objects.
     *)

}

type create_byte_match_set_request = {
  change_token: string;
  (** 
    The value returned by the most recent call to [GetChangeToken].
     *)

  name: string;
  (** 
    A friendly name or description of the [ByteMatchSet]. You can't change [Name] after you create a [ByteMatchSet].
     *)

}

(** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      This is the {i AWS WAF Classic API Reference} for using AWS WAF Classic with Amazon CloudFront. The AWS WAF Classic actions and data types listed in the reference are available for protecting Amazon CloudFront distributions. You can use these actions and data types via the endpoint {i waf.amazonaws.com}. This guide is for developers who need detailed information about the AWS WAF Classic API actions, data types, and errors. For detailed information about AWS WAF Classic features and an overview of how to use the AWS WAF Classic API, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_field_to_match : ?data:string -> type_:match_field_type -> unit
-> field_to_match
(** Create a {!type-field_to_match} type *)

val make_xss_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> xss_match_tuple
(** Create a {!type-xss_match_tuple} type *)

val make_xss_match_set_update :
  xss_match_tuple:xss_match_tuple -> action:change_action -> unit
-> xss_match_set_update
(** Create a {!type-xss_match_set_update} type *)

val make_xss_match_set_summary :
  name:string -> xss_match_set_id:string -> unit
-> xss_match_set_summary
(** Create a {!type-xss_match_set_summary} type *)

val make_xss_match_set :
  ?name:string ->
  xss_match_tuples:xss_match_tuple list ->
  xss_match_set_id:string ->
  unit
-> xss_match_set
(** Create a {!type-xss_match_set} type *)

val make_waf_action : type_:waf_action_type -> unit
-> waf_action
(** Create a {!type-waf_action} type *)

val make_waf_override_action : type_:waf_override_action_type -> unit
-> waf_override_action
(** Create a {!type-waf_override_action} type *)

val make_excluded_rule : rule_id:string -> unit
-> excluded_rule
(** Create a {!type-excluded_rule} type *)

val make_activated_rule :
  ?excluded_rules:excluded_rule list ->
  ?type_:waf_rule_type ->
  ?override_action:waf_override_action ->
  ?action:waf_action ->
  rule_id:string ->
  priority:int ->
  unit
-> activated_rule
(** Create a {!type-activated_rule} type *)

val make_web_acl_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> web_acl_update
(** Create a {!type-web_acl_update} type *)

val make_web_acl_summary : name:string -> web_acl_id:string -> unit
-> web_acl_summary
(** Create a {!type-web_acl_summary} type *)

val make_web_ac_l :
  ?web_acl_arn:string ->
  ?metric_name:string ->
  ?name:string ->
  rules:activated_rule list ->
  default_action:waf_action ->
  web_acl_id:string ->
  unit
-> web_ac_l
(** Create a {!type-web_ac_l} type *)

val make_update_xss_match_set_response : ?change_token:string -> unit
-> update_xss_match_set_response
(** Create a {!type-update_xss_match_set_response} type *)

val make_update_xss_match_set_request :
  updates:xss_match_set_update list ->
  change_token:string ->
  xss_match_set_id:string ->
  unit
-> update_xss_match_set_request
(** Create a {!type-update_xss_match_set_request} type *)

val make_update_web_acl_response : ?change_token:string -> unit
-> update_web_acl_response
(** Create a {!type-update_web_acl_response} type *)

val make_update_web_acl_request :
  ?default_action:waf_action ->
  ?updates:web_acl_update list ->
  change_token:string ->
  web_acl_id:string ->
  unit
-> update_web_acl_request
(** Create a {!type-update_web_acl_request} type *)

val make_update_sql_injection_match_set_response :
  ?change_token:string -> unit
-> update_sql_injection_match_set_response
(** Create a {!type-update_sql_injection_match_set_response} type *)

val make_sql_injection_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> sql_injection_match_tuple
(** Create a {!type-sql_injection_match_tuple} type *)

val make_sql_injection_match_set_update :
  sql_injection_match_tuple:sql_injection_match_tuple ->
  action:change_action ->
  unit
-> sql_injection_match_set_update
(** Create a {!type-sql_injection_match_set_update} type *)

val make_update_sql_injection_match_set_request :
  updates:sql_injection_match_set_update list ->
  change_token:string ->
  sql_injection_match_set_id:string ->
  unit
-> update_sql_injection_match_set_request
(** Create a {!type-update_sql_injection_match_set_request} type *)

val make_update_size_constraint_set_response : ?change_token:string -> unit
-> update_size_constraint_set_response
(** Create a {!type-update_size_constraint_set_response} type *)

val make_size_constraint :
  size:int ->
  comparison_operator:comparison_operator ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> size_constraint
(** Create a {!type-size_constraint} type *)

val make_size_constraint_set_update :
  size_constraint:size_constraint -> action:change_action -> unit
-> size_constraint_set_update
(** Create a {!type-size_constraint_set_update} type *)

val make_update_size_constraint_set_request :
  updates:size_constraint_set_update list ->
  change_token:string ->
  size_constraint_set_id:string ->
  unit
-> update_size_constraint_set_request
(** Create a {!type-update_size_constraint_set_request} type *)

val make_update_rule_response : ?change_token:string -> unit
-> update_rule_response
(** Create a {!type-update_rule_response} type *)

val make_predicate :
  data_id:string -> type_:predicate_type -> negated:bool -> unit
-> predicate
(** Create a {!type-predicate} type *)

val make_rule_update : predicate:predicate -> action:change_action -> unit
-> rule_update
(** Create a {!type-rule_update} type *)

val make_update_rule_request :
  updates:rule_update list -> change_token:string -> rule_id:string -> unit
-> update_rule_request
(** Create a {!type-update_rule_request} type *)

val make_update_rule_group_response : ?change_token:string -> unit
-> update_rule_group_response
(** Create a {!type-update_rule_group_response} type *)

val make_rule_group_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> rule_group_update
(** Create a {!type-rule_group_update} type *)

val make_update_rule_group_request :
  change_token:string ->
  updates:rule_group_update list ->
  rule_group_id:string ->
  unit
-> update_rule_group_request
(** Create a {!type-update_rule_group_request} type *)

val make_update_regex_pattern_set_response : ?change_token:string -> unit
-> update_regex_pattern_set_response
(** Create a {!type-update_regex_pattern_set_response} type *)

val make_regex_pattern_set_update :
  regex_pattern_string:string -> action:change_action -> unit
-> regex_pattern_set_update
(** Create a {!type-regex_pattern_set_update} type *)

val make_update_regex_pattern_set_request :
  change_token:string ->
  updates:regex_pattern_set_update list ->
  regex_pattern_set_id:string ->
  unit
-> update_regex_pattern_set_request
(** Create a {!type-update_regex_pattern_set_request} type *)

val make_update_regex_match_set_response : ?change_token:string -> unit
-> update_regex_match_set_response
(** Create a {!type-update_regex_match_set_response} type *)

val make_regex_match_tuple :
  regex_pattern_set_id:string ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> regex_match_tuple
(** Create a {!type-regex_match_tuple} type *)

val make_regex_match_set_update :
  regex_match_tuple:regex_match_tuple -> action:change_action -> unit
-> regex_match_set_update
(** Create a {!type-regex_match_set_update} type *)

val make_update_regex_match_set_request :
  change_token:string ->
  updates:regex_match_set_update list ->
  regex_match_set_id:string ->
  unit
-> update_regex_match_set_request
(** Create a {!type-update_regex_match_set_request} type *)

val make_update_rate_based_rule_response : ?change_token:string -> unit
-> update_rate_based_rule_response
(** Create a {!type-update_rate_based_rule_response} type *)

val make_update_rate_based_rule_request :
  rate_limit:int ->
  updates:rule_update list ->
  change_token:string ->
  rule_id:string ->
  unit
-> update_rate_based_rule_request
(** Create a {!type-update_rate_based_rule_request} type *)

val make_update_ip_set_response : ?change_token:string -> unit
-> update_ip_set_response
(** Create a {!type-update_ip_set_response} type *)

val make_ip_set_descriptor :
  value:string -> type_:ip_set_descriptor_type -> unit
-> ip_set_descriptor
(** Create a {!type-ip_set_descriptor} type *)

val make_ip_set_update :
  ip_set_descriptor:ip_set_descriptor -> action:change_action -> unit
-> ip_set_update
(** Create a {!type-ip_set_update} type *)

val make_update_ip_set_request :
  updates:ip_set_update list ->
  change_token:string ->
  ip_set_id:string ->
  unit
-> update_ip_set_request
(** Create a {!type-update_ip_set_request} type *)

val make_update_geo_match_set_response : ?change_token:string -> unit
-> update_geo_match_set_response
(** Create a {!type-update_geo_match_set_response} type *)

val make_geo_match_constraint :
  value:geo_match_constraint_value -> type_:geo_match_constraint_type -> unit
-> geo_match_constraint
(** Create a {!type-geo_match_constraint} type *)

val make_geo_match_set_update :
  geo_match_constraint:geo_match_constraint -> action:change_action -> unit
-> geo_match_set_update
(** Create a {!type-geo_match_set_update} type *)

val make_update_geo_match_set_request :
  updates:geo_match_set_update list ->
  change_token:string ->
  geo_match_set_id:string ->
  unit
-> update_geo_match_set_request
(** Create a {!type-update_geo_match_set_request} type *)

val make_update_byte_match_set_response : ?change_token:string -> unit
-> update_byte_match_set_response
(** Create a {!type-update_byte_match_set_response} type *)

val make_byte_match_tuple :
  positional_constraint:positional_constraint ->
  text_transformation:text_transformation ->
  target_string:bytes ->
  field_to_match:field_to_match ->
  unit
-> byte_match_tuple
(** Create a {!type-byte_match_tuple} type *)

val make_byte_match_set_update :
  byte_match_tuple:byte_match_tuple -> action:change_action -> unit
-> byte_match_set_update
(** Create a {!type-byte_match_set_update} type *)

val make_update_byte_match_set_request :
  updates:byte_match_set_update list ->
  change_token:string ->
  byte_match_set_id:string ->
  unit
-> update_byte_match_set_request
(** Create a {!type-update_byte_match_set_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_time_window : end_time:float -> start_time:float -> unit
-> time_window
(** Create a {!type-time_window} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_tag_info_for_resource :
  ?tag_list:tag list -> ?resource_ar_n:string -> unit
-> tag_info_for_resource
(** Create a {!type-tag_info_for_resource} type *)

val make_subscribed_rule_group_summary :
  metric_name:string -> name:string -> rule_group_id:string -> unit
-> subscribed_rule_group_summary
(** Create a {!type-subscribed_rule_group_summary} type *)

val make_sql_injection_match_set_summary :
  name:string -> sql_injection_match_set_id:string -> unit
-> sql_injection_match_set_summary
(** Create a {!type-sql_injection_match_set_summary} type *)

val make_sql_injection_match_set :
  ?name:string ->
  sql_injection_match_tuples:sql_injection_match_tuple list ->
  sql_injection_match_set_id:string ->
  unit
-> sql_injection_match_set
(** Create a {!type-sql_injection_match_set} type *)

val make_size_constraint_set_summary :
  name:string -> size_constraint_set_id:string -> unit
-> size_constraint_set_summary
(** Create a {!type-size_constraint_set_summary} type *)

val make_size_constraint_set :
  ?name:string ->
  size_constraints:size_constraint list ->
  size_constraint_set_id:string ->
  unit
-> size_constraint_set
(** Create a {!type-size_constraint_set} type *)

val make_http_header : ?value:string -> ?name:string -> unit
-> http_header
(** Create a {!type-http_header} type *)

val make_http_request :
  ?headers:http_header list ->
  ?http_version:string ->
  ?method_:string ->
  ?ur_i:string ->
  ?country:string ->
  ?client_i_p:string ->
  unit
-> http_request
(** Create a {!type-http_request} type *)

val make_sampled_http_request :
  ?rule_within_rule_group:string ->
  ?action:string ->
  ?timestamp_:float ->
  weight:int ->
  request:http_request ->
  unit
-> sampled_http_request
(** Create a {!type-sampled_http_request} type *)

val make_rule_summary : name:string -> rule_id:string -> unit
-> rule_summary
(** Create a {!type-rule_summary} type *)

val make_rule_group_summary : name:string -> rule_group_id:string -> unit
-> rule_group_summary
(** Create a {!type-rule_group_summary} type *)

val make_rule_group :
  ?metric_name:string -> ?name:string -> rule_group_id:string -> unit
-> rule_group
(** Create a {!type-rule_group} type *)

val make_rule :
  ?metric_name:string ->
  ?name:string ->
  predicates:predicate list ->
  rule_id:string ->
  unit
-> rule
(** Create a {!type-rule} type *)

val make_regex_pattern_set_summary :
  name:string -> regex_pattern_set_id:string -> unit
-> regex_pattern_set_summary
(** Create a {!type-regex_pattern_set_summary} type *)

val make_regex_pattern_set :
  ?name:string ->
  regex_pattern_strings:string list ->
  regex_pattern_set_id:string ->
  unit
-> regex_pattern_set
(** Create a {!type-regex_pattern_set} type *)

val make_regex_match_set_summary :
  name:string -> regex_match_set_id:string -> unit
-> regex_match_set_summary
(** Create a {!type-regex_match_set_summary} type *)

val make_regex_match_set :
  ?regex_match_tuples:regex_match_tuple list ->
  ?name:string ->
  ?regex_match_set_id:string ->
  unit
-> regex_match_set
(** Create a {!type-regex_match_set} type *)

val make_rate_based_rule :
  ?metric_name:string ->
  ?name:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  match_predicates:predicate list ->
  rule_id:string ->
  unit
-> rate_based_rule
(** Create a {!type-rate_based_rule} type *)

val make_put_permission_policy_response : unit
-> put_permission_policy_response
(** Create a {!type-put_permission_policy_response} type *)

val make_put_permission_policy_request :
  policy:string -> resource_arn:string -> unit
-> put_permission_policy_request
(** Create a {!type-put_permission_policy_request} type *)

val make_logging_configuration :
  ?redacted_fields:field_to_match list ->
  log_destination_configs:string list ->
  resource_arn:string ->
  unit
-> logging_configuration
(** Create a {!type-logging_configuration} type *)

val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> put_logging_configuration_response
(** Create a {!type-put_logging_configuration_response} type *)

val make_put_logging_configuration_request :
  logging_configuration:logging_configuration -> unit
-> put_logging_configuration_request
(** Create a {!type-put_logging_configuration_request} type *)

val make_list_xss_match_sets_response :
  ?xss_match_sets:xss_match_set_summary list -> ?next_marker:string -> unit
-> list_xss_match_sets_response
(** Create a {!type-list_xss_match_sets_response} type *)

val make_list_xss_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_xss_match_sets_request
(** Create a {!type-list_xss_match_sets_request} type *)

val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list -> ?next_marker:string -> unit
-> list_web_ac_ls_response
(** Create a {!type-list_web_ac_ls_response} type *)

val make_list_web_ac_ls_request : ?limit:int -> ?next_marker:string -> unit
-> list_web_ac_ls_request
(** Create a {!type-list_web_ac_ls_request} type *)

val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource -> ?next_marker:string -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_marker:string -> resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_subscribed_rule_groups_response :
  ?rule_groups:subscribed_rule_group_summary list ->
  ?next_marker:string ->
  unit
-> list_subscribed_rule_groups_response
(** Create a {!type-list_subscribed_rule_groups_response} type *)

val make_list_subscribed_rule_groups_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_subscribed_rule_groups_request
(** Create a {!type-list_subscribed_rule_groups_request} type *)

val make_list_sql_injection_match_sets_response :
  ?sql_injection_match_sets:sql_injection_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_sql_injection_match_sets_response
(** Create a {!type-list_sql_injection_match_sets_response} type *)

val make_list_sql_injection_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_sql_injection_match_sets_request
(** Create a {!type-list_sql_injection_match_sets_request} type *)

val make_list_size_constraint_sets_response :
  ?size_constraint_sets:size_constraint_set_summary list ->
  ?next_marker:string ->
  unit
-> list_size_constraint_sets_response
(** Create a {!type-list_size_constraint_sets_response} type *)

val make_list_size_constraint_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_size_constraint_sets_request
(** Create a {!type-list_size_constraint_sets_request} type *)

val make_list_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rules_response
(** Create a {!type-list_rules_response} type *)

val make_list_rules_request : ?limit:int -> ?next_marker:string -> unit
-> list_rules_request
(** Create a {!type-list_rules_request} type *)

val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list -> ?next_marker:string -> unit
-> list_rule_groups_response
(** Create a {!type-list_rule_groups_response} type *)

val make_list_rule_groups_request : ?limit:int -> ?next_marker:string -> unit
-> list_rule_groups_request
(** Create a {!type-list_rule_groups_request} type *)

val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_pattern_sets_response
(** Create a {!type-list_regex_pattern_sets_response} type *)

val make_list_regex_pattern_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_pattern_sets_request
(** Create a {!type-list_regex_pattern_sets_request} type *)

val make_list_regex_match_sets_response :
  ?regex_match_sets:regex_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_match_sets_response
(** Create a {!type-list_regex_match_sets_response} type *)

val make_list_regex_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_match_sets_request
(** Create a {!type-list_regex_match_sets_request} type *)

val make_list_rate_based_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rate_based_rules_response
(** Create a {!type-list_rate_based_rules_response} type *)

val make_list_rate_based_rules_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_rate_based_rules_request
(** Create a {!type-list_rate_based_rules_request} type *)

val make_list_logging_configurations_response :
  ?next_marker:string ->
  ?logging_configurations:logging_configuration list ->
  unit
-> list_logging_configurations_response
(** Create a {!type-list_logging_configurations_response} type *)

val make_list_logging_configurations_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_logging_configurations_request
(** Create a {!type-list_logging_configurations_request} type *)

val make_ip_set_summary : name:string -> ip_set_id:string -> unit
-> ip_set_summary
(** Create a {!type-ip_set_summary} type *)

val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list -> ?next_marker:string -> unit
-> list_ip_sets_response
(** Create a {!type-list_ip_sets_response} type *)

val make_list_ip_sets_request : ?limit:int -> ?next_marker:string -> unit
-> list_ip_sets_request
(** Create a {!type-list_ip_sets_request} type *)

val make_geo_match_set_summary :
  name:string -> geo_match_set_id:string -> unit
-> geo_match_set_summary
(** Create a {!type-geo_match_set_summary} type *)

val make_list_geo_match_sets_response :
  ?geo_match_sets:geo_match_set_summary list -> ?next_marker:string -> unit
-> list_geo_match_sets_response
(** Create a {!type-list_geo_match_sets_response} type *)

val make_list_geo_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_geo_match_sets_request
(** Create a {!type-list_geo_match_sets_request} type *)

val make_byte_match_set_summary :
  name:string -> byte_match_set_id:string -> unit
-> byte_match_set_summary
(** Create a {!type-byte_match_set_summary} type *)

val make_list_byte_match_sets_response :
  ?byte_match_sets:byte_match_set_summary list -> ?next_marker:string -> unit
-> list_byte_match_sets_response
(** Create a {!type-list_byte_match_sets_response} type *)

val make_list_byte_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_byte_match_sets_request
(** Create a {!type-list_byte_match_sets_request} type *)

val make_list_activated_rules_in_rule_group_response :
  ?activated_rules:activated_rule list -> ?next_marker:string -> unit
-> list_activated_rules_in_rule_group_response
(** Create a {!type-list_activated_rules_in_rule_group_response} type *)

val make_list_activated_rules_in_rule_group_request :
  ?limit:int -> ?next_marker:string -> ?rule_group_id:string -> unit
-> list_activated_rules_in_rule_group_request
(** Create a {!type-list_activated_rules_in_rule_group_request} type *)

val make_ip_set :
  ?name:string ->
  ip_set_descriptors:ip_set_descriptor list ->
  ip_set_id:string ->
  unit
-> ip_set
(** Create a {!type-ip_set} type *)

val make_get_xss_match_set_response : ?xss_match_set:xss_match_set -> unit
-> get_xss_match_set_response
(** Create a {!type-get_xss_match_set_response} type *)

val make_get_xss_match_set_request : xss_match_set_id:string -> unit
-> get_xss_match_set_request
(** Create a {!type-get_xss_match_set_request} type *)

val make_get_web_acl_response : ?web_ac_l:web_ac_l -> unit
-> get_web_acl_response
(** Create a {!type-get_web_acl_response} type *)

val make_get_web_acl_request : web_acl_id:string -> unit
-> get_web_acl_request
(** Create a {!type-get_web_acl_request} type *)

val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set -> unit
-> get_sql_injection_match_set_response
(** Create a {!type-get_sql_injection_match_set_response} type *)

val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:string -> unit
-> get_sql_injection_match_set_request
(** Create a {!type-get_sql_injection_match_set_request} type *)

val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set -> unit
-> get_size_constraint_set_response
(** Create a {!type-get_size_constraint_set_response} type *)

val make_get_size_constraint_set_request :
  size_constraint_set_id:string -> unit
-> get_size_constraint_set_request
(** Create a {!type-get_size_constraint_set_request} type *)

val make_get_sampled_requests_response :
  ?time_window:time_window ->
  ?population_size:int ->
  ?sampled_requests:sampled_http_request list ->
  unit
-> get_sampled_requests_response
(** Create a {!type-get_sampled_requests_response} type *)

val make_get_sampled_requests_request :
  max_items:int ->
  time_window:time_window ->
  rule_id:string ->
  web_acl_id:string ->
  unit
-> get_sampled_requests_request
(** Create a {!type-get_sampled_requests_request} type *)

val make_get_rule_response : ?rule:rule -> unit
-> get_rule_response
(** Create a {!type-get_rule_response} type *)

val make_get_rule_request : rule_id:string -> unit
-> get_rule_request
(** Create a {!type-get_rule_request} type *)

val make_get_rule_group_response : ?rule_group:rule_group -> unit
-> get_rule_group_response
(** Create a {!type-get_rule_group_response} type *)

val make_get_rule_group_request : rule_group_id:string -> unit
-> get_rule_group_request
(** Create a {!type-get_rule_group_request} type *)

val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set -> unit
-> get_regex_pattern_set_response
(** Create a {!type-get_regex_pattern_set_response} type *)

val make_get_regex_pattern_set_request : regex_pattern_set_id:string -> unit
-> get_regex_pattern_set_request
(** Create a {!type-get_regex_pattern_set_request} type *)

val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit
-> get_regex_match_set_response
(** Create a {!type-get_regex_match_set_response} type *)

val make_get_regex_match_set_request : regex_match_set_id:string -> unit
-> get_regex_match_set_request
(** Create a {!type-get_regex_match_set_request} type *)

val make_get_rate_based_rule_response : ?rule:rate_based_rule -> unit
-> get_rate_based_rule_response
(** Create a {!type-get_rate_based_rule_response} type *)

val make_get_rate_based_rule_request : rule_id:string -> unit
-> get_rate_based_rule_request
(** Create a {!type-get_rate_based_rule_request} type *)

val make_get_rate_based_rule_managed_keys_response :
  ?next_marker:string -> ?managed_keys:string list -> unit
-> get_rate_based_rule_managed_keys_response
(** Create a {!type-get_rate_based_rule_managed_keys_response} type *)

val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:string -> rule_id:string -> unit
-> get_rate_based_rule_managed_keys_request
(** Create a {!type-get_rate_based_rule_managed_keys_request} type *)

val make_get_permission_policy_response : ?policy:string -> unit
-> get_permission_policy_response
(** Create a {!type-get_permission_policy_response} type *)

val make_get_permission_policy_request : resource_arn:string -> unit
-> get_permission_policy_request
(** Create a {!type-get_permission_policy_request} type *)

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> get_logging_configuration_response
(** Create a {!type-get_logging_configuration_response} type *)

val make_get_logging_configuration_request : resource_arn:string -> unit
-> get_logging_configuration_request
(** Create a {!type-get_logging_configuration_request} type *)

val make_get_ip_set_response : ?ip_set:ip_set -> unit
-> get_ip_set_response
(** Create a {!type-get_ip_set_response} type *)

val make_get_ip_set_request : ip_set_id:string -> unit
-> get_ip_set_request
(** Create a {!type-get_ip_set_request} type *)

val make_geo_match_set :
  ?name:string ->
  geo_match_constraints:geo_match_constraint list ->
  geo_match_set_id:string ->
  unit
-> geo_match_set
(** Create a {!type-geo_match_set} type *)

val make_get_geo_match_set_response : ?geo_match_set:geo_match_set -> unit
-> get_geo_match_set_response
(** Create a {!type-get_geo_match_set_response} type *)

val make_get_geo_match_set_request : geo_match_set_id:string -> unit
-> get_geo_match_set_request
(** Create a {!type-get_geo_match_set_request} type *)

val make_get_change_token_status_response :
  ?change_token_status:change_token_status -> unit
-> get_change_token_status_response
(** Create a {!type-get_change_token_status_response} type *)

val make_get_change_token_status_request : change_token:string -> unit
-> get_change_token_status_request
(** Create a {!type-get_change_token_status_request} type *)

val make_get_change_token_response : ?change_token:string -> unit
-> get_change_token_response
(** Create a {!type-get_change_token_response} type *)

val make_get_change_token_request : unit
-> get_change_token_request
(** Create a {!type-get_change_token_request} type *)

val make_byte_match_set :
  ?name:string ->
  byte_match_tuples:byte_match_tuple list ->
  byte_match_set_id:string ->
  unit
-> byte_match_set
(** Create a {!type-byte_match_set} type *)

val make_get_byte_match_set_response : ?byte_match_set:byte_match_set -> unit
-> get_byte_match_set_response
(** Create a {!type-get_byte_match_set_response} type *)

val make_get_byte_match_set_request : byte_match_set_id:string -> unit
-> get_byte_match_set_request
(** Create a {!type-get_byte_match_set_request} type *)

val make_delete_xss_match_set_response : ?change_token:string -> unit
-> delete_xss_match_set_response
(** Create a {!type-delete_xss_match_set_response} type *)

val make_delete_xss_match_set_request :
  change_token:string -> xss_match_set_id:string -> unit
-> delete_xss_match_set_request
(** Create a {!type-delete_xss_match_set_request} type *)

val make_delete_web_acl_response : ?change_token:string -> unit
-> delete_web_acl_response
(** Create a {!type-delete_web_acl_response} type *)

val make_delete_web_acl_request :
  change_token:string -> web_acl_id:string -> unit
-> delete_web_acl_request
(** Create a {!type-delete_web_acl_request} type *)

val make_delete_sql_injection_match_set_response :
  ?change_token:string -> unit
-> delete_sql_injection_match_set_response
(** Create a {!type-delete_sql_injection_match_set_response} type *)

val make_delete_sql_injection_match_set_request :
  change_token:string -> sql_injection_match_set_id:string -> unit
-> delete_sql_injection_match_set_request
(** Create a {!type-delete_sql_injection_match_set_request} type *)

val make_delete_size_constraint_set_response : ?change_token:string -> unit
-> delete_size_constraint_set_response
(** Create a {!type-delete_size_constraint_set_response} type *)

val make_delete_size_constraint_set_request :
  change_token:string -> size_constraint_set_id:string -> unit
-> delete_size_constraint_set_request
(** Create a {!type-delete_size_constraint_set_request} type *)

val make_delete_rule_response : ?change_token:string -> unit
-> delete_rule_response
(** Create a {!type-delete_rule_response} type *)

val make_delete_rule_request : change_token:string -> rule_id:string -> unit
-> delete_rule_request
(** Create a {!type-delete_rule_request} type *)

val make_delete_rule_group_response : ?change_token:string -> unit
-> delete_rule_group_response
(** Create a {!type-delete_rule_group_response} type *)

val make_delete_rule_group_request :
  change_token:string -> rule_group_id:string -> unit
-> delete_rule_group_request
(** Create a {!type-delete_rule_group_request} type *)

val make_delete_regex_pattern_set_response : ?change_token:string -> unit
-> delete_regex_pattern_set_response
(** Create a {!type-delete_regex_pattern_set_response} type *)

val make_delete_regex_pattern_set_request :
  change_token:string -> regex_pattern_set_id:string -> unit
-> delete_regex_pattern_set_request
(** Create a {!type-delete_regex_pattern_set_request} type *)

val make_delete_regex_match_set_response : ?change_token:string -> unit
-> delete_regex_match_set_response
(** Create a {!type-delete_regex_match_set_response} type *)

val make_delete_regex_match_set_request :
  change_token:string -> regex_match_set_id:string -> unit
-> delete_regex_match_set_request
(** Create a {!type-delete_regex_match_set_request} type *)

val make_delete_rate_based_rule_response : ?change_token:string -> unit
-> delete_rate_based_rule_response
(** Create a {!type-delete_rate_based_rule_response} type *)

val make_delete_rate_based_rule_request :
  change_token:string -> rule_id:string -> unit
-> delete_rate_based_rule_request
(** Create a {!type-delete_rate_based_rule_request} type *)

val make_delete_permission_policy_response : unit
-> delete_permission_policy_response
(** Create a {!type-delete_permission_policy_response} type *)

val make_delete_permission_policy_request : resource_arn:string -> unit
-> delete_permission_policy_request
(** Create a {!type-delete_permission_policy_request} type *)

val make_delete_logging_configuration_response : unit
-> delete_logging_configuration_response
(** Create a {!type-delete_logging_configuration_response} type *)

val make_delete_logging_configuration_request : resource_arn:string -> unit
-> delete_logging_configuration_request
(** Create a {!type-delete_logging_configuration_request} type *)

val make_delete_ip_set_response : ?change_token:string -> unit
-> delete_ip_set_response
(** Create a {!type-delete_ip_set_response} type *)

val make_delete_ip_set_request :
  change_token:string -> ip_set_id:string -> unit
-> delete_ip_set_request
(** Create a {!type-delete_ip_set_request} type *)

val make_delete_geo_match_set_response : ?change_token:string -> unit
-> delete_geo_match_set_response
(** Create a {!type-delete_geo_match_set_response} type *)

val make_delete_geo_match_set_request :
  change_token:string -> geo_match_set_id:string -> unit
-> delete_geo_match_set_request
(** Create a {!type-delete_geo_match_set_request} type *)

val make_delete_byte_match_set_response : ?change_token:string -> unit
-> delete_byte_match_set_response
(** Create a {!type-delete_byte_match_set_response} type *)

val make_delete_byte_match_set_request :
  change_token:string -> byte_match_set_id:string -> unit
-> delete_byte_match_set_request
(** Create a {!type-delete_byte_match_set_request} type *)

val make_create_xss_match_set_response :
  ?change_token:string -> ?xss_match_set:xss_match_set -> unit
-> create_xss_match_set_response
(** Create a {!type-create_xss_match_set_response} type *)

val make_create_xss_match_set_request :
  change_token:string -> name:string -> unit
-> create_xss_match_set_request
(** Create a {!type-create_xss_match_set_request} type *)

val make_create_web_acl_response :
  ?change_token:string -> ?web_ac_l:web_ac_l -> unit
-> create_web_acl_response
(** Create a {!type-create_web_acl_response} type *)

val make_create_web_acl_request :
  ?tags:tag list ->
  change_token:string ->
  default_action:waf_action ->
  metric_name:string ->
  name:string ->
  unit
-> create_web_acl_request
(** Create a {!type-create_web_acl_request} type *)

val make_create_web_acl_migration_stack_response :
  s3_object_url:string -> unit
-> create_web_acl_migration_stack_response
(** Create a {!type-create_web_acl_migration_stack_response} type *)

val make_create_web_acl_migration_stack_request :
  ignore_unsupported_type:bool ->
  s3_bucket_name:string ->
  web_acl_id:string ->
  unit
-> create_web_acl_migration_stack_request
(** Create a {!type-create_web_acl_migration_stack_request} type *)

val make_create_sql_injection_match_set_response :
  ?change_token:string ->
  ?sql_injection_match_set:sql_injection_match_set ->
  unit
-> create_sql_injection_match_set_response
(** Create a {!type-create_sql_injection_match_set_response} type *)

val make_create_sql_injection_match_set_request :
  change_token:string -> name:string -> unit
-> create_sql_injection_match_set_request
(** Create a {!type-create_sql_injection_match_set_request} type *)

val make_create_size_constraint_set_response :
  ?change_token:string -> ?size_constraint_set:size_constraint_set -> unit
-> create_size_constraint_set_response
(** Create a {!type-create_size_constraint_set_response} type *)

val make_create_size_constraint_set_request :
  change_token:string -> name:string -> unit
-> create_size_constraint_set_request
(** Create a {!type-create_size_constraint_set_request} type *)

val make_create_rule_response : ?change_token:string -> ?rule:rule -> unit
-> create_rule_response
(** Create a {!type-create_rule_response} type *)

val make_create_rule_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit
-> create_rule_request
(** Create a {!type-create_rule_request} type *)

val make_create_rule_group_response :
  ?change_token:string -> ?rule_group:rule_group -> unit
-> create_rule_group_response
(** Create a {!type-create_rule_group_response} type *)

val make_create_rule_group_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit
-> create_rule_group_request
(** Create a {!type-create_rule_group_request} type *)

val make_create_regex_pattern_set_response :
  ?change_token:string -> ?regex_pattern_set:regex_pattern_set -> unit
-> create_regex_pattern_set_response
(** Create a {!type-create_regex_pattern_set_response} type *)

val make_create_regex_pattern_set_request :
  change_token:string -> name:string -> unit
-> create_regex_pattern_set_request
(** Create a {!type-create_regex_pattern_set_request} type *)

val make_create_regex_match_set_response :
  ?change_token:string -> ?regex_match_set:regex_match_set -> unit
-> create_regex_match_set_response
(** Create a {!type-create_regex_match_set_response} type *)

val make_create_regex_match_set_request :
  change_token:string -> name:string -> unit
-> create_regex_match_set_request
(** Create a {!type-create_regex_match_set_request} type *)

val make_create_rate_based_rule_response :
  ?change_token:string -> ?rule:rate_based_rule -> unit
-> create_rate_based_rule_response
(** Create a {!type-create_rate_based_rule_response} type *)

val make_create_rate_based_rule_request :
  ?tags:tag list ->
  change_token:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  metric_name:string ->
  name:string ->
  unit
-> create_rate_based_rule_request
(** Create a {!type-create_rate_based_rule_request} type *)

val make_create_ip_set_response :
  ?change_token:string -> ?ip_set:ip_set -> unit
-> create_ip_set_response
(** Create a {!type-create_ip_set_response} type *)

val make_create_ip_set_request : change_token:string -> name:string -> unit
-> create_ip_set_request
(** Create a {!type-create_ip_set_request} type *)

val make_create_geo_match_set_response :
  ?change_token:string -> ?geo_match_set:geo_match_set -> unit
-> create_geo_match_set_response
(** Create a {!type-create_geo_match_set_response} type *)

val make_create_geo_match_set_request :
  change_token:string -> name:string -> unit
-> create_geo_match_set_request
(** Create a {!type-create_geo_match_set_request} type *)

val make_create_byte_match_set_response :
  ?change_token:string -> ?byte_match_set:byte_match_set -> unit
-> create_byte_match_set_response
(** Create a {!type-create_byte_match_set_response} type *)

val make_create_byte_match_set_request :
  change_token:string -> name:string -> unit
-> create_byte_match_set_request
(** Create a {!type-create_byte_match_set_request} type *)

(** {1:operations Operations} *)

module CreateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_byte_match_set_request ->
        (create_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [ByteMatchSet]. You then use [UpdateByteMatchSet] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the [User-Agent] header or the query string. For example, you can create a [ByteMatchSet] that matches any requests with [User-Agent] headers that contain the string [BadBot]. You can then configure AWS WAF to reject those requests.
      
       To create and configure a [ByteMatchSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateByteMatchSet] request.
                
                }
              {- Submit a [CreateByteMatchSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateByteMatchSet] request.
                 
                 }
              {- Submit an [UpdateByteMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_geo_match_set_request ->
        (create_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates an [GeoMatchSet], which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an [GeoMatchSet] that contains those countries and then configure AWS WAF to block the requests.
      
       To create and configure a [GeoMatchSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateGeoMatchSet] request.
                
                }
              {- Submit a [CreateGeoMatchSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateGeoMatchSet] request.
                 
                 }
              {- Submit an [UpdateGeoMatchSetSet] request to specify the countries that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates an [IPSet], which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an [IPSet] that contains those IP addresses and then configure AWS WAF to block the requests.
      
       To create and configure an [IPSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateIPSet] request.
                
                }
              {- Submit a [CreateIPSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
                 
                 }
              {- Submit an [UpdateIPSet] request to specify the IP addresses that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rate_based_rule_request ->
        (create_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [RateBasedRule]. The [RateBasedRule] contains a [RateLimit], which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The [RateBasedRule] also contains the [IPSet] objects, [ByteMatchSet] objects, and other predicates that identify the requests that you want to count or block if these requests exceed the [RateLimit].
      
       If you add more than one predicate to a [RateBasedRule], a request not only must exceed the [RateLimit], but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a [RateBasedRule]:
       
        {ul
             {- An [IPSet] that matches the IP address [192.0.2.44/32]
                
                }
              {- A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
                 
                 }
             
      }
       Further, you specify a [RateLimit] of 1,000.
       
        You then add the [RateBasedRule] to a [WebACL] and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot]. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.
        
         As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a [RateBasedRule]:
         
          {ul
               {- A [ByteMatchSet] with [FieldToMatch] of [URI]
                  
                  }
                {- A [PositionalConstraint] of [STARTS_WITH]
                   
                   }
                {- A [TargetString] of [login]
                   
                   }
               
      }
       Further, you specify a [RateLimit] of 1,000.
       
        By adding this [RateBasedRule] to a [WebACL], you could limit requests to your login page without affecting the rest of your site.
        
         To create and configure a [RateBasedRule], perform the following steps:
         
          {ol
               {- Create and update the predicates that you want to include in the rule. For more information, see [CreateByteMatchSet], [CreateIPSet], and [CreateSqlInjectionMatchSet].
                  
                  }
                {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRule] request.
                   
                   }
                {- Submit a [CreateRateBasedRule] request.
                   
                   }
                {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
                   
                   }
                {- Submit an [UpdateRateBasedRule] request to specify the predicates that you want to include in the rule.
                   
                   }
                {- Create and update a [WebACL] that contains the [RateBasedRule]. For more information, see [CreateWebACL].
                   
                   }
               
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_match_set_request ->
        (create_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [RegexMatchSet]. You then use [UpdateRegexMatchSet] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the [User-Agent] header or the query string. For example, you can create a [RegexMatchSet] that contains a [RegexMatchTuple] that looks for any requests with [User-Agent] headers that match a [RegexPatternSet] with pattern [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
      
       To create and configure a [RegexMatchSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRegexMatchSet] request.
                
                }
              {- Submit a [CreateRegexMatchSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexMatchSet] request.
                 
                 }
              {- Submit an [UpdateRegexMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a [RegexPatternSet], that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [RegexPatternSet]. You then use [UpdateRegexPatternSet] to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
      
       To create and configure a [RegexPatternSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRegexPatternSet] request.
                
                }
              {- Submit a [CreateRegexPatternSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexPatternSet] request.
                 
                 }
              {- Submit an [UpdateRegexPatternSet] request to specify the string that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_request ->
        (create_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [Rule], which contains the [IPSet] objects, [ByteMatchSet] objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a [Rule], a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a [Rule]:
      
       {ul
            {- An [IPSet] that matches the IP address [192.0.2.44/32]
               
               }
             {- A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
                
                }
            
      }
       You then add the [Rule] to a [WebACL] and specify that you want to blocks requests that satisfy the [Rule]. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot].
       
        To create and configure a [Rule], perform the following steps:
        
         {ol
              {- Create and update the predicates that you want to include in the [Rule]. For more information, see [CreateByteMatchSet], [CreateIPSet], and [CreateSqlInjectionMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateRule] request.
                  
                  }
               {- Submit a [CreateRule] request.
                  
                  }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
                  
                  }
               {- Submit an [UpdateRule] request to specify the predicates that you want to include in the [Rule].
                  
                  }
               {- Create and update a [WebACL] that contains the [Rule]. For more information, see [CreateWebACL].
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [RuleGroup]. A rule group is a collection of predefined rules that you add to a web ACL. You use [UpdateRuleGroup] to add rules to the rule group.
      
       Rule groups are subject to the following limits:
       
        {ul
             {- Three rule groups per account. You can request an increase to this limit by contacting customer support.
                
                }
              {- One rule group per web ACL.
                 
                 }
              {- Ten rules per rule group.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_size_constraint_set_request ->
        (create_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [SizeConstraintSet]. You then use [UpdateSizeConstraintSet] to identify the part of a web request that you want AWS WAF to check for length, such as the length of the [User-Agent] header or the length of the query string. For example, you can create a [SizeConstraintSet] that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.
      
       To create and configure a [SizeConstraintSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateSizeConstraintSet] request.
                
                }
              {- Submit a [CreateSizeConstraintSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSizeConstraintSet] request.
                 
                 }
              {- Submit an [UpdateSizeConstraintSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sql_injection_match_set_request ->
        (create_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [SqlInjectionMatchSet], which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.
      
       To create and configure a [SqlInjectionMatchSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateSqlInjectionMatchSet] request.
                
                }
              {- Submit a [CreateSqlInjectionMatchSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSqlInjectionMatchSet] request.
                 
                 }
              {- Submit an [UpdateSqlInjectionMatchSet] request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates a [WebACL], which contains the [Rules] that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates [Rules] in order based on the value of [Priority] for each [Rule].
      
       You also specify a default action, either [ALLOW] or [BLOCK]. If a web request doesn't match any of the [Rules] in a [WebACL], AWS WAF responds to the request with the default action.
       
        To create and configure a [WebACL], perform the following steps:
        
         {ol
              {- Create and update the [ByteMatchSet] objects and other predicates that you want to include in [Rules]. For more information, see [CreateByteMatchSet], [UpdateByteMatchSet], [CreateIPSet], [UpdateIPSet], [CreateSqlInjectionMatchSet], and [UpdateSqlInjectionMatchSet].
                 
                 }
               {- Create and update the [Rules] that you want to include in the [WebACL]. For more information, see [CreateRule] and [UpdateRule].
                  
                  }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateWebACL] request.
                  
                  }
               {- Submit a [CreateWebACL] request.
                  
                  }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateWebACL] request.
                  
                  }
               {- Submit an [UpdateWebACL] request to specify the [Rules] that you want to include in the [WebACL], to specify the default action, and to associate the [WebACL] with a CloudFront distribution.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module CreateWebACLMigrationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_migration_stack_request ->
        (create_web_acl_migration_stack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFEntityMigrationException of waf_entity_migration_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.
    
     This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html}Migrating your AWS WAF Classic resources to AWS WAF} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}.
      *)

  
end

module CreateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_xss_match_set_request ->
        (create_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Creates an [XssMatchSet], which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.
      
       To create and configure an [XssMatchSet], perform the following steps:
       
        {ol
             {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [CreateXssMatchSet] request.
                
                }
              {- Submit a [CreateXssMatchSet] request.
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateXssMatchSet] request.
                 
                 }
              {- Submit an [UpdateXssMatchSet] request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module DeleteByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_byte_match_set_request ->
        (delete_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [ByteMatchSet]. You can't delete a [ByteMatchSet] if it's still used in any [Rules] or if it still includes any [ByteMatchTuple] objects (any filters).
      
       If you just want to remove a [ByteMatchSet] from a [Rule], use [UpdateRule].
       
        To permanently delete a [ByteMatchSet], perform the following steps:
        
         {ol
              {- Update the [ByteMatchSet] to remove filters, if any. For more information, see [UpdateByteMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteByteMatchSet] request.
                  
                  }
               {- Submit a [DeleteByteMatchSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_geo_match_set_request ->
        (delete_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [GeoMatchSet]. You can't delete a [GeoMatchSet] if it's still used in any [Rules] or if it still includes any countries.
      
       If you just want to remove a [GeoMatchSet] from a [Rule], use [UpdateRule].
       
        To permanently delete a [GeoMatchSet] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [GeoMatchSet] to remove any countries. For more information, see [UpdateGeoMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteGeoMatchSet] request.
                  
                  }
               {- Submit a [DeleteGeoMatchSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes an [IPSet]. You can't delete an [IPSet] if it's still used in any [Rules] or if it still includes any IP addresses.
      
       If you just want to remove an [IPSet] from a [Rule], use [UpdateRule].
       
        To permanently delete an [IPSet] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [IPSet] to remove IP address ranges, if any. For more information, see [UpdateIPSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteIPSet] request.
                  
                  }
               {- Submit a [DeleteIPSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (delete_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes the [LoggingConfiguration] from the specified web ACL.
       *)

  
end

module DeletePermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (delete_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes an IAM policy from the specified RuleGroup.
      
       The user making the request must be the owner of the RuleGroup.
        *)

  
end

module DeleteRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rate_based_rule_request ->
        (delete_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [RateBasedRule]. You can't delete a rule if it's still used in any [WebACL] objects or if it still includes any predicates, such as [ByteMatchSet] objects.
      
       If you just want to remove a rule from a [WebACL], use [UpdateWebACL].
       
        To permanently delete a [RateBasedRule] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [RateBasedRule] to remove predicates, if any. For more information, see [UpdateRateBasedRule].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRateBasedRule] request.
                  
                  }
               {- Submit a [DeleteRateBasedRule] request.
                  
                  }
              
      }
       *)

  
end

module DeleteRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_match_set_request ->
        (delete_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [RegexMatchSet]. You can't delete a [RegexMatchSet] if it's still used in any [Rules] or if it still includes any [RegexMatchTuples] objects (any filters).
      
       If you just want to remove a [RegexMatchSet] from a [Rule], use [UpdateRule].
       
        To permanently delete a [RegexMatchSet], perform the following steps:
        
         {ol
              {- Update the [RegexMatchSet] to remove filters, if any. For more information, see [UpdateRegexMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRegexMatchSet] request.
                  
                  }
               {- Submit a [DeleteRegexMatchSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (delete_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [RegexPatternSet]. You can't delete a [RegexPatternSet] if it's still used in any [RegexMatchSet] or if the [RegexPatternSet] is not empty.
       *)

  
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (delete_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [Rule]. You can't delete a [Rule] if it's still used in any [WebACL] objects or if it still includes any predicates, such as [ByteMatchSet] objects.
      
       If you just want to remove a [Rule] from a [WebACL], use [UpdateWebACL].
       
        To permanently delete a [Rule] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [Rule] to remove predicates, if any. For more information, see [UpdateRule].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRule] request.
                  
                  }
               {- Submit a [DeleteRule] request.
                  
                  }
              
      }
       *)

  
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [RuleGroup]. You can't delete a [RuleGroup] if it's still used in any [WebACL] objects or if it still includes any rules.
      
       If you just want to remove a [RuleGroup] from a [WebACL], use [UpdateWebACL].
       
        To permanently delete a [RuleGroup] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [RuleGroup] to remove rules, if any. For more information, see [UpdateRuleGroup].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteRuleGroup] request.
                  
                  }
               {- Submit a [DeleteRuleGroup] request.
                  
                  }
              
      }
       *)

  
end

module DeleteSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_size_constraint_set_request ->
        (delete_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [SizeConstraintSet]. You can't delete a [SizeConstraintSet] if it's still used in any [Rules] or if it still includes any [SizeConstraint] objects (any filters).
      
       If you just want to remove a [SizeConstraintSet] from a [Rule], use [UpdateRule].
       
        To permanently delete a [SizeConstraintSet], perform the following steps:
        
         {ol
              {- Update the [SizeConstraintSet] to remove filters, if any. For more information, see [UpdateSizeConstraintSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteSizeConstraintSet] request.
                  
                  }
               {- Submit a [DeleteSizeConstraintSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sql_injection_match_set_request ->
        (delete_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [SqlInjectionMatchSet]. You can't delete a [SqlInjectionMatchSet] if it's still used in any [Rules] or if it still contains any [SqlInjectionMatchTuple] objects.
      
       If you just want to remove a [SqlInjectionMatchSet] from a [Rule], use [UpdateRule].
       
        To permanently delete a [SqlInjectionMatchSet] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [SqlInjectionMatchSet] to remove filters, if any. For more information, see [UpdateSqlInjectionMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteSqlInjectionMatchSet] request.
                  
                  }
               {- Submit a [DeleteSqlInjectionMatchSet] request.
                  
                  }
              
      }
       *)

  
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes a [WebACL]. You can't delete a [WebACL] if it still contains any [Rules].
      
       To delete a [WebACL], perform the following steps:
       
        {ol
             {- Update the [WebACL] to remove [Rules], if any. For more information, see [UpdateWebACL].
                
                }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteWebACL] request.
                 
                 }
              {- Submit a [DeleteWebACL] request.
                 
                 }
             
      }
       *)

  
end

module DeleteXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_xss_match_set_request ->
        (delete_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Permanently deletes an [XssMatchSet]. You can't delete an [XssMatchSet] if it's still used in any [Rules] or if it still contains any [XssMatchTuple] objects.
      
       If you just want to remove an [XssMatchSet] from a [Rule], use [UpdateRule].
       
        To permanently delete an [XssMatchSet] from AWS WAF, perform the following steps:
        
         {ol
              {- Update the [XssMatchSet] to remove filters, if any. For more information, see [UpdateXssMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of a [DeleteXssMatchSet] request.
                  
                  }
               {- Submit a [DeleteXssMatchSet] request.
                  
                  }
              
      }
       *)

  
end

module GetByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_byte_match_set_request ->
        (get_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [ByteMatchSet] specified by [ByteMatchSetId].
       *)

  
end

module GetChangeToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_request ->
        (get_change_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.
      
       Each create, update, or delete request must use a unique change token. If your application submits a [GetChangeToken] request and then submits a second [GetChangeToken] request before submitting a create, update, or delete request, the second [GetChangeToken] request returns the same value as the first [GetChangeToken] request.
       
        When you use a change token in a create, update, or delete request, the status of the change token changes to [PENDING], which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use [GetChangeTokenStatus] to determine the status of your change token.
         *)

  
end

module GetChangeTokenStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_status_request ->
        (get_change_token_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the status of a [ChangeToken] that you got by calling [GetChangeToken]. [ChangeTokenStatus] is one of the following values:
      
       {ul
            {- [PROVISIONED]: You requested the change token by calling [GetChangeToken], but you haven't used it yet in a call to create, update, or delete an AWS WAF object.
               
               }
             {- [PENDING]: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.
                
                }
             {- [INSYNC]: Propagation is complete.
                
                }
            
      }
       *)

  
end

module GetGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_geo_match_set_request ->
        (get_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [GeoMatchSet] that is specified by [GeoMatchSetId].
       *)

  
end

module GetIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [IPSet] that is specified by [IPSetId].
       *)

  
end

module GetLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [LoggingConfiguration] for the specified web ACL.
       *)

  
end

module GetPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the IAM policy attached to the RuleGroup.
       *)

  
end

module GetRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_request ->
        (get_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [RateBasedRule] that is specified by the [RuleId] that you included in the [GetRateBasedRule] request.
       *)

  
end

module GetRateBasedRuleManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_managed_keys_request ->
        (get_rate_based_rule_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of IP addresses currently being blocked by the [RateBasedRule] that is specified by the [RuleId]. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.
       *)

  
end

module GetRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_match_set_request ->
        (get_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [RegexMatchSet] specified by [RegexMatchSetId].
       *)

  
end

module GetRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [RegexPatternSet] specified by [RegexPatternSetId].
       *)

  
end

module GetRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_request ->
        (get_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [Rule] that is specified by the [RuleId] that you included in the [GetRule] request.
       *)

  
end

module GetRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [RuleGroup] that is specified by the [RuleGroupId] that you included in the [GetRuleGroup] request.
      
       To view the rules in a rule group, use [ListActivatedRulesInRuleGroup].
        *)

  
end

module GetSampledRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.
      
       [GetSampledRequests] returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, [GetSampledRequests] returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.
        *)

  
end

module GetSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_size_constraint_set_request ->
        (get_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [SizeConstraintSet] specified by [SizeConstraintSetId].
       *)

  
end

module GetSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sql_injection_match_set_request ->
        (get_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [SqlInjectionMatchSet] that is specified by [SqlInjectionMatchSetId].
       *)

  
end

module GetWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [WebACL] that is specified by [WebACLId].
       *)

  
end

module GetXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_xss_match_set_request ->
        (get_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns the [XssMatchSet] that is specified by [XssMatchSetId].
       *)

  
end

module ListActivatedRulesInRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activated_rules_in_rule_group_request ->
        (list_activated_rules_in_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [ActivatedRule] objects.
       *)

  
end

module ListByteMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_byte_match_sets_request ->
        (list_byte_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [ByteMatchSetSummary] objects.
       *)

  
end

module ListGeoMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_geo_match_sets_request ->
        (list_geo_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [GeoMatchSetSummary] objects in the response.
       *)

  
end

module ListIPSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [IPSetSummary] objects in the response.
       *)

  
end

module ListLoggingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [LoggingConfiguration] objects.
       *)

  
end

module ListRateBasedRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rate_based_rules_request ->
        (list_rate_based_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RuleSummary] objects.
       *)

  
end

module ListRegexMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_match_sets_request ->
        (list_regex_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RegexMatchSetSummary] objects.
       *)

  
end

module ListRegexPatternSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RegexPatternSetSummary] objects.
       *)

  
end

module ListRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RuleGroup] objects.
       *)

  
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RuleSummary] objects.
       *)

  
end

module ListSizeConstraintSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_size_constraint_sets_request ->
        (list_size_constraint_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [SizeConstraintSetSummary] objects.
       *)

  
end

module ListSqlInjectionMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sql_injection_match_sets_request ->
        (list_sql_injection_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [SqlInjectionMatchSet] objects.
       *)

  
end

module ListSubscribedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_subscribed_rule_groups_request ->
        (list_subscribed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [RuleGroup] objects that you are subscribed to.
       *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
      
       Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
        |}]

  
end

module ListWebACLs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [WebACLSummary] objects in the response.
       *)

  
end

module ListXssMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_xss_match_sets_request ->
        (list_xss_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Returns an array of [XssMatchSet] objects.
       *)

  
end

module PutLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Associates a [LoggingConfiguration] with a specified web ACL.
      
       You can access information about all traffic that AWS WAF inspects using the following steps:
       
        {ol
             {- Create an Amazon Kinesis Data Firehose.
                
                 Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia).
                 
                  Do not create the data firehose using a [Kinesis stream] as your source.
                  
                  }
              {- Associate that firehose to your web ACL using a [PutLoggingConfiguration] request.
                 
                 }
             
      }
       When you successfully enable logging using a [PutLoggingConfiguration] request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging Web ACL Traffic Information} in the {i AWS WAF Developer Guide}.
        *)

  
end

module PutPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (put_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.
      
       The [PutPermissionPolicy] is subject to the following restrictions:
       
        {ul
             {- You can attach only one policy with each [PutPermissionPolicy] request.
                
                }
              {- The policy must include an [Effect], [Action] and [Principal].
                 
                 }
              {- [Effect] must specify [Allow].
                 
                 }
              {- The [Action] in the policy must be [waf:UpdateWebACL], [waf-regional:UpdateWebACL], [waf:GetRuleGroup] and [waf-regional:GetRuleGroup] . Any extra or wildcard actions in the policy will be rejected.
                 
                 }
              {- The policy cannot include a [Resource] parameter.
                 
                 }
              {- The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.
                 
                 }
              {- The user making the request must be the owner of the RuleGroup.
                 
                 }
              {- Your policy must be composed using IAM Policy version 2012-10-17.
                 
                 }
             
      }
       For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}.
       
        An example of a valid policy parameter is shown in the Examples section below.
         *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
      
       Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
        |}]

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      
       *)

  
end

module UpdateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_byte_match_set_request ->
        (update_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [ByteMatchTuple] objects (filters) in a [ByteMatchSet]. For each [ByteMatchTuple] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the object from the array. If you want to change a [ByteMatchSetUpdate] object, you delete the existing object and add a new one.
               
               }
             {- The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the [User-Agent] header.
                
                }
             {- The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see [TargetString] in the [ByteMatchTuple] data type.
                
                }
             {- Where to look, such as at the beginning or the end of a query string.
                
                }
             {- Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
                
                }
            
      }
       For example, you can add a [ByteMatchSetUpdate] object that matches web requests in which [User-Agent] headers contain the string [BadBot]. You can then configure AWS WAF to block those requests.
       
        To create and configure a [ByteMatchSet], perform the following steps:
        
         {ol
              {- Create a [ByteMatchSet.] For more information, see [CreateByteMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateByteMatchSet] request.
                  
                  }
               {- Submit an [UpdateByteMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module UpdateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_geo_match_set_request ->
        (update_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [GeoMatchConstraint] objects in an [GeoMatchSet]. For each [GeoMatchConstraint] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the object from the array. If you want to change an [GeoMatchConstraint] object, you delete the existing object and add a new one.
               
               }
             {- The [Type]. The only valid value for [Type] is [Country].
                
                }
             {- The [Value], which is a two character code for the country to add to the [GeoMatchConstraint] object. Valid codes are listed in [GeoMatchConstraint$Value].
                
                }
            
      }
       To create and configure an [GeoMatchSet], perform the following steps:
       
        {ol
             {- Submit a [CreateGeoMatchSet] request.
                
                }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateGeoMatchSet] request.
                 
                 }
              {- Submit an [UpdateGeoMatchSet] request to specify the country that you want AWS WAF to watch for.
                 
                 }
             
      }
       When you update an [GeoMatchSet], you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.
       
        For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
         *)

  
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [IPSetDescriptor] objects in an [IPSet]. For each [IPSetDescriptor] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the object from the array. If you want to change an [IPSetDescriptor] object, you delete the existing object and add a new one.
               
               }
             {- The IP address version, [IPv4] or [IPv6].
                
                }
             {- The IP address in CIDR notation, for example, [192.0.2.0/24] (for the range of IP addresses from [192.0.2.0] to [192.0.2.255]) or [192.0.2.44/32] (for the individual IP address [192.0.2.44]).
                
                }
            
      }
       AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.
       
        IPv6 addresses can be represented using any of the following formats:
        
         {ul
              {- 1111:0000:0000:0000:0000:0000:0000:0111/128
                 
                 }
               {- 1111:0:0:0:0:0:0:0111/128
                  
                  }
               {- 1111::0111/128
                  
                  }
               {- 1111::111/128
                  
                  }
              
      }
       You use an [IPSet] to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an [IPSet] that specifies those IP addresses, and then configure AWS WAF to block the requests.
       
        To create and configure an [IPSet], perform the following steps:
        
         {ol
              {- Submit a [CreateIPSet] request.
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
                  
                  }
               {- Submit an [UpdateIPSet] request to specify the IP addresses that you want AWS WAF to watch for.
                  
                  }
              
      }
       When you update an [IPSet], you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.
       
        You can insert a maximum of 1000 addresses in a single request.
        
         For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
          *)

  
end

module UpdateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rate_based_rule_request ->
        (update_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [Predicate] objects in a rule and updates the [RateLimit] in the rule.
      
       Each [Predicate] object identifies a predicate, such as a [ByteMatchSet] or an [IPSet], that specifies the web requests that you want to block or count. The [RateLimit] specifies the number of requests every five minutes that triggers the rule.
       
        If you add more than one predicate to a [RateBasedRule], a request must match all the predicates and exceed the [RateLimit] to be counted or blocked. For example, suppose you add the following to a [RateBasedRule]:
        
         {ul
              {- An [IPSet] that matches the IP address [192.0.2.44/32]
                 
                 }
               {- A [ByteMatchSet] that matches [BadBot] in the [User-Agent] header
                  
                  }
              
      }
       Further, you specify a [RateLimit] of 1,000.
       
        You then add the [RateBasedRule] to a [WebACL] and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 {i and} the [User-Agent] header in the request must contain the value [BadBot]. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.
        
         As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a [RateBasedRule]:
         
          {ul
               {- A [ByteMatchSet] with [FieldToMatch] of [URI]
                  
                  }
                {- A [PositionalConstraint] of [STARTS_WITH]
                   
                   }
                {- A [TargetString] of [login]
                   
                   }
               
      }
       Further, you specify a [RateLimit] of 1,000.
       
        By adding this [RateBasedRule] to a [WebACL], you could limit requests to your login page without affecting the rest of your site.
         *)

  
end

module UpdateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_match_set_request ->
        (update_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [RegexMatchTuple] objects (filters) in a [RegexMatchSet]. For each [RegexMatchSetUpdate] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the object from the array. If you want to change a [RegexMatchSetUpdate] object, you delete the existing object and add a new one.
               
               }
             {- The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the [User-Agent] header.
                
                }
             {- The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see [RegexPatternSet].
                
                }
             {- Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.
                
                }
            
      }
       For example, you can create a [RegexPatternSet] that matches any requests with [User-Agent] headers that contain the string [B\[a@\]dB\[o0\]t]. You can then configure AWS WAF to reject those requests.
       
        To create and configure a [RegexMatchSet], perform the following steps:
        
         {ol
              {- Create a [RegexMatchSet.] For more information, see [CreateRegexMatchSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexMatchSet] request.
                  
                  }
               {- Submit an [UpdateRegexMatchSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the [RegexPatternSet] that contain the regular expression patters you want AWS WAF to watch for.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidRegexPatternException of waf_invalid_regex_pattern_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [RegexPatternString] objects in a [RegexPatternSet]. For each [RegexPatternString] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the [RegexPatternString].
               
               }
             {- The regular expression pattern that you want to insert or delete. For more information, see [RegexPatternSet].
                
                }
            
      }
       For example, you can create a [RegexPatternString] such as [B\[a@\]dB\[o0\]t]. AWS WAF will match this [RegexPatternString] to:
       
        {ul
             {- BadBot
                
                }
              {- BadB0t
                 
                 }
              {- B\@dBot
                 
                 }
              {- B\@dB0t
                 
                 }
             
      }
       To create and configure a [RegexPatternSet], perform the following steps:
       
        {ol
             {- Create a [RegexPatternSet.] For more information, see [CreateRegexPatternSet].
                
                }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRegexPatternSet] request.
                 
                 }
              {- Submit an [UpdateRegexPatternSet] request to specify the regular expression pattern that you want AWS WAF to watch for.
                 
                 }
             
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module UpdateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_request ->
        (update_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [Predicate] objects in a [Rule]. Each [Predicate] object identifies a predicate, such as a [ByteMatchSet] or an [IPSet], that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a [Rule], a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a [Rule]:
      
       {ul
            {- A [ByteMatchSet] that matches the value [BadBot] in the [User-Agent] header
               
               }
             {- An [IPSet] that matches the IP address [192.0.2.44]
                
                }
            
      }
       You then add the [Rule] to a [WebACL] and specify that you want to block requests that satisfy the [Rule]. For a request to be blocked, the [User-Agent] header in the request must contain the value [BadBot] {i and} the request must originate from the IP address 192.0.2.44.
       
        To create and configure a [Rule], perform the following steps:
        
         {ol
              {- Create and update the predicates that you want to include in the [Rule].
                 
                 }
               {- Create the [Rule]. See [CreateRule].
                  
                  }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRule] request.
                  
                  }
               {- Submit an [UpdateRule] request to add predicates to the [Rule].
                  
                  }
               {- Create and update a [WebACL] that contains the [Rule]. See [CreateWebACL].
                  
                  }
              
      }
       If you want to replace one [ByteMatchSet] or [IPSet] with another, you delete the existing one and add the new one.
       
        For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
         *)

  
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [ActivatedRule] objects in a [RuleGroup].
      
       You can only insert [REGULAR] rules into a rule group.
       
        You can have a maximum of ten rules per rule group.
        
         To create and configure a [RuleGroup], perform the following steps:
         
          {ol
               {- Create and update the [Rules] that you want to include in the [RuleGroup]. See [CreateRule].
                  
                  }
                {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateRuleGroup] request.
                   
                   }
                {- Submit an [UpdateRuleGroup] request to add [Rules] to the [RuleGroup].
                   
                   }
                {- Create and update a [WebACL] that contains the [RuleGroup]. See [CreateWebACL].
                   
                   }
               
      }
       If you want to replace one [Rule] with another, you delete the existing one and add the new one.
       
        For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
         *)

  
end

module UpdateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_size_constraint_set_request ->
        (update_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [SizeConstraint] objects (filters) in a [SizeConstraintSet]. For each [SizeConstraint] object, you specify the following values:
      
       {ul
            {- Whether to insert or delete the object from the array. If you want to change a [SizeConstraintSetUpdate] object, you delete the existing object and add a new one.
               
               }
             {- The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the [User-Agent] header.
                
                }
             {- Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first [8192] bytes of your request to AWS WAF.
                
                 You can only specify a single type of TextTransformation.
                 
                 }
             {- A [ComparisonOperator] used for evaluating the selected part of the request against the specified [Size], such as equals, greater than, less than, and so on.
                
                }
             {- The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.
                
                }
            
      }
       For example, you can add a [SizeConstraintSetUpdate] object that matches web requests in which the length of the [User-Agent] header is greater than 100 bytes. You can then configure AWS WAF to block those requests.
       
        To create and configure a [SizeConstraintSet], perform the following steps:
        
         {ol
              {- Create a [SizeConstraintSet.] For more information, see [CreateSizeConstraintSet].
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateSizeConstraintSet] request.
                  
                  }
               {- Submit an [UpdateSizeConstraintSet] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module UpdateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sql_injection_match_set_request ->
        (update_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [SqlInjectionMatchTuple] objects (filters) in a [SqlInjectionMatchSet]. For each [SqlInjectionMatchTuple] object, you specify the following values:
      
       {ul
            {- [Action]: Whether to insert the object into or delete the object from the array. To change a [SqlInjectionMatchTuple], you delete the existing object and add a new one.
               
               }
             {- [FieldToMatch]: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.
                
                }
             {- [TextTransformation]: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.
                
                 You can only specify a single type of TextTransformation.
                 
                 }
            
      }
       You use [SqlInjectionMatchSet] objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a [SqlInjectionMatchSet] with the applicable settings, and then configure AWS WAF to block the requests.
       
        To create and configure a [SqlInjectionMatchSet], perform the following steps:
        
         {ol
              {- Submit a [CreateSqlInjectionMatchSet] request.
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
                  
                  }
               {- Submit an [UpdateSqlInjectionMatchSet] request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [ActivatedRule] objects in a [WebACL]. Each [Rule] identifies web requests that you want to allow, block, or count. When you update a [WebACL], you specify the following values:
      
       {ul
            {- A default action for the [WebACL], either [ALLOW] or [BLOCK]. AWS WAF performs the default action if a request doesn't match the criteria in any of the [Rules] in a [WebACL].
               
               }
             {- The [Rules] that you want to add or delete. If you want to replace one [Rule] with another, you delete the existing [Rule] and add the new one.
                
                }
             {- For each [Rule], whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the [Rule].
                
                }
             {- The order in which you want AWS WAF to evaluate the [Rules] in a [WebACL]. If you add more than one [Rule] to a [WebACL], AWS WAF evaluates each request against the [Rules] in order based on the value of [Priority]. (The [Rule] that has the lowest value for [Priority] is evaluated first.) When a web request matches all the predicates (such as [ByteMatchSets] and [IPSets]) in a [Rule], AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining [Rules] in the [WebACL], if any.
                
                }
            
      }
       To create and configure a [WebACL], perform the following steps:
       
        {ol
             {- Create and update the predicates that you want to include in [Rules]. For more information, see [CreateByteMatchSet], [UpdateByteMatchSet], [CreateIPSet], [UpdateIPSet], [CreateSqlInjectionMatchSet], and [UpdateSqlInjectionMatchSet].
                
                }
              {- Create and update the [Rules] that you want to include in the [WebACL]. For more information, see [CreateRule] and [UpdateRule].
                 
                 }
              {- Create a [WebACL]. See [CreateWebACL].
                 
                 }
              {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateWebACL] request.
                 
                 }
              {- Submit an [UpdateWebACL] request to specify the [Rules] that you want to include in the [WebACL], to specify the default action, and to associate the [WebACL] with a CloudFront distribution.
                 
                  The [ActivatedRule] can be a rule group. If you specify a rule group as your [ActivatedRule] , you can exclude specific rules from that rule group.
                  
                   If you already have a rule group associated with a web ACL and want to submit an [UpdateWebACL] request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see [ActivatedRule$ExcludedRules] .
                   
                   }
             
      }
       Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the [UpdateWebACL] request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist.
       
        For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
         *)

  
end

module UpdateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_xss_match_set_request ->
        (update_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
  (** 
    This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.
    
     {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use.
     
      Inserts or deletes [XssMatchTuple] objects (filters) in an [XssMatchSet]. For each [XssMatchTuple] object, you specify the following values:
      
       {ul
            {- [Action]: Whether to insert the object into or delete the object from the array. To change an [XssMatchTuple], you delete the existing object and add a new one.
               
               }
             {- [FieldToMatch]: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.
                
                }
             {- [TextTransformation]: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.
                
                 You can only specify a single type of TextTransformation.
                 
                 }
            
      }
       You use [XssMatchSet] objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an [XssMatchSet] with the applicable settings, and then configure AWS WAF to block the requests.
       
        To create and configure an [XssMatchSet], perform the following steps:
        
         {ol
              {- Submit a [CreateXssMatchSet] request.
                 
                 }
               {- Use [GetChangeToken] to get the change token that you provide in the [ChangeToken] parameter of an [UpdateIPSet] request.
                  
                  }
               {- Submit an [UpdateXssMatchSet] request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.
                  
                  }
              
      }
       For more information about how to use the AWS WAF API to allow or block HTTP requests, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}AWS WAF Developer Guide}.
        *)

  
end

