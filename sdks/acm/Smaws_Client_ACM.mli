(** 
    ACM client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type validation_method = | DNS
  | EMAIL

(** 
    The supplied input failed to satisfy constraints of an Amazon Web Services service.
     *)
type validation_exception = {
  message: string option;
  
}

type certificate_transparency_logging_preference = | DISABLED
  | ENABLED

(** 
    Structure that contains options for your certificate. Currently, you can use this only to specify whether to opt in to or out of certificate transparency logging. Some browsers require that public certificates issued for your domain be recorded in a log. Certificates that are not logged typically generate a browser error. Transparency makes it possible for you to detect SSL/TLS certificates that have been mistakenly or maliciously issued for your domain. For general information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate Transparency Logging}.
     *)
type certificate_options = {
  certificate_transparency_logging_preference: certificate_transparency_logging_preference option;
  (** 
    You can opt out of certificate transparency logging by specifying the [DISABLED] option. Opt in by specifying [ENABLED].
     *)

}

type update_certificate_options_request = {
  options: certificate_options;
  (** 
    Use to update the options for your certificate. Currently, you can specify whether to add your certificate to a transparency log. Certificate transparency makes it possible to detect SSL/TLS certificates that have been mistakenly or maliciously issued. Certificates that have not been logged typically produce an error message in a browser.
     *)

  certificate_arn: string;
  (** 
    ARN of the requested certificate to update. This must be of the form:
    
     
     {[
     arn:aws:acm:us-east-1:{i account}:certificate/{i 12345678-1234-1234-1234-123456789012}
     ]}
     
      *)

}

(** 
    The specified certificate cannot be found in the caller's account or the caller's account cannot be found.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    An ACM quota has been exceeded.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

(** 
    Processing has reached an invalid state.
     *)
type invalid_state_exception = {
  message: string option;
  
}

(** 
    The requested Amazon Resource Name (ARN) does not refer to an existing resource.
     *)
type invalid_arn_exception = {
  message: string option;
  
}

(** 
    The request contains too many tags. Try the request again with fewer tags.
     *)
type too_many_tags_exception = {
  message: string option;
  
}

(** 
    The request was denied because it exceeded a quota.
     *)
type throttling_exception = {
  message: string option;
  
}

(** 
    A specified tag did not comply with an existing tag policy and was rejected.
     *)
type tag_policy_exception = {
  message: string option;
  
}

(** 
    A key-value pair that identifies or specifies metadata about an ACM resource.
     *)
type tag = {
  value: string option;
  (** 
    The value of the tag.
     *)

  key: string;
  (** 
    The key of the tag.
     *)

}

type sort_order = | DESCENDING
  | ASCENDING

type sort_by = | CREATED_AT

type revocation_reason = | A_A_COMPROMISE
  | PRIVILEGE_WITHDRAWN
  | REMOVE_FROM_CRL
  | CERTIFICATE_HOLD
  | CESSATION_OF_OPERATION
  | SUPERCEDED
  | AFFILIATION_CHANGED
  | CA_COMPROMISE
  | KEY_COMPROMISE
  | UNSPECIFIED

type record_type = | CNAME

(** 
    Contains a DNS record value that you can use to validate ownership or control of a domain. This is used by the [DescribeCertificate] action.
     *)
type resource_record = {
  value: string;
  (** 
    The value of the CNAME record to add to your DNS database. This is supplied by ACM.
     *)

  type_: record_type;
  (** 
    The type of DNS record. Currently this can be [CNAME].
     *)

  name: string;
  (** 
    The name of the DNS record to create in your domain. This is supplied by ACM.
     *)

}

(** 
    The certificate is in use by another Amazon Web Services service in the caller's account. Remove the association and try again.
     *)
type resource_in_use_exception = {
  message: string option;
  
}

type resend_validation_email_request = {
  validation_domain: string;
  (** 
    The base validation domain that will act as the suffix of the email addresses that are used to send the emails. This must be the same as the [Domain] value or a superdomain of the [Domain] value. For example, if you requested a certificate for [site.subdomain.example.com] and specify a {b ValidationDomain} of [subdomain.example.com], ACM sends email to the domain registrant, technical contact, and administrative contact in WHOIS and the following five addresses:
    
     {ul
          {- admin\@subdomain.example.com
             
             }
           {- administrator\@subdomain.example.com
              
              }
           {- hostmaster\@subdomain.example.com
              
              }
           {- postmaster\@subdomain.example.com
              
              }
           {- webmaster\@subdomain.example.com
              
              }
          
      }
       *)

  domain: string;
  (** 
    The fully qualified domain name (FQDN) of the certificate that needs to be validated.
     *)

  certificate_arn: string;
  (** 
    String that contains the ARN of the requested certificate. The certificate ARN is generated and returned by the [RequestCertificate] action as soon as the request is made. By default, using this parameter causes email to be sent to all top-level domains you specified in the certificate request. The ARN must be of the form:
    
     [arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012]
      *)

}

(** 
    One or more values in the [DomainValidationOption] structure is incorrect.
     *)
type invalid_domain_validation_options_exception = {
  message: string option;
  
}

(** 
    The certificate request is in process and the certificate in your account has not yet been issued.
     *)
type request_in_progress_exception = {
  message: string option;
  
}

type request_certificate_response = {
  certificate_arn: string option;
  (** 
    String that contains the ARN of the issued certificate. This must be of the form:
    
     [arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012]
      *)

}

(** 
    Contains information about the domain names that you want ACM to use to send you emails that enable you to validate domain ownership.
     *)
type domain_validation_option = {
  validation_domain: string;
  (** 
    The domain name that you want ACM to use to send you validation emails. This domain name is the suffix of the email addresses that you want ACM to use. This must be the same as the [DomainName] value or a superdomain of the [DomainName] value. For example, if you request a certificate for [testing.example.com], you can specify [example.com] for this value. In that case, ACM sends domain validation emails to the following five addresses:
    
     {ul
          {- admin\@example.com
             
             }
           {- administrator\@example.com
              
              }
           {- hostmaster\@example.com
              
              }
           {- postmaster\@example.com
              
              }
           {- webmaster\@example.com
              
              }
          
      }
       *)

  domain_name: string;
  (** 
    A fully qualified domain name (FQDN) in the certificate request.
     *)

}

type key_algorithm = | EC_secp521r1
  | EC_secp384r1
  | EC_prime256v1
  | RSA_4096
  | RSA_3072
  | RSA_2048
  | RSA_1024

type request_certificate_request = {
  key_algorithm: key_algorithm option;
  (** 
    Specifies the algorithm of the public and private key pair that your certificate uses to encrypt data. RSA is the default key algorithm for ACM certificates. Elliptic Curve Digital Signature Algorithm (ECDSA) keys are smaller, offering security comparable to RSA keys but with greater computing efficiency. However, ECDSA is not supported by all network clients. Some AWS services may require RSA keys, or only support ECDSA keys of a particular size, while others allow the use of either RSA and ECDSA keys to ensure that compatibility is not broken. Check the requirements for the AWS service where you plan to deploy your certificate.
    
     Default: RSA_2048
      *)

  tags: tag list option;
  (** 
    One or more resource tags to associate with the certificate.
     *)

  certificate_authority_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the private certificate authority (CA) that will be used to issue the certificate. If you do not provide an ARN and you are trying to request a private certificate, ACM will attempt to issue a public certificate. For more information about private CAs, see the {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html}Amazon Web Services Private Certificate Authority} user guide. The ARN must have the following form:
    
     [arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012]
      *)

  options: certificate_options option;
  (** 
    Currently, you can use this parameter to specify whether to add the certificate to a certificate transparency log. Certificate transparency makes it possible to detect SSL/TLS certificates that have been mistakenly or maliciously issued. Certificates that have not been logged typically produce an error message in a browser. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency}Opting Out of Certificate Transparency Logging}.
     *)

  domain_validation_options: domain_validation_option list option;
  (** 
    The domain name that you want ACM to use to send you emails so that you can validate domain ownership.
     *)

  idempotency_token: string option;
  (** 
    Customer chosen string that can be used to distinguish between calls to [RequestCertificate]. Idempotency tokens time out after one hour. Therefore, if you call [RequestCertificate] multiple times with the same idempotency token within one hour, ACM recognizes that you are requesting only one certificate and will issue only one. If you change the idempotency token for each call, ACM recognizes that you are requesting multiple certificates.
     *)

  subject_alternative_names: string list option;
  (** 
    Additional FQDNs to be included in the Subject Alternative Name extension of the ACM certificate. For example, add the name www.example.net to a certificate for which the [DomainName] field is www.example.com if users can reach your site by using either name. The maximum number of domain names that you can add to an ACM certificate is 100. However, the initial quota is 10 domain names. If you need more than 10 names, you must request a quota increase. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html}Quotas}.
    
     The maximum length of a SAN DNS name is 253 octets. The name is made up of multiple labels separated by periods. No label can be longer than 63 octets. Consider the following examples:
     
      {ul
           {- [(63 octets).(63 octets).(63 octets).(61 octets)] is legal because the total length is 253 octets (63+1+63+1+63+1+61) and no label exceeds 63 octets.
              
              }
            {- [(64 octets).(63 octets).(63 octets).(61 octets)] is not legal because the total length exceeds 253 octets (64+1+63+1+63+1+61) and the first label exceeds 63 octets.
               
               }
            {- [(63 octets).(63 octets).(63 octets).(62 octets)] is not legal because the total length of the DNS name (63+1+63+1+63+1+62) exceeds 253 octets.
               
               }
           
      }
       *)

  validation_method: validation_method option;
  (** 
    The method you want to use if you are requesting a public certificate to validate that you own or control domain. You can {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}validate with DNS} or {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}validate with email}. We recommend that you use DNS validation.
     *)

  domain_name: string;
  [@ocaml.doc {| 
    Fully qualified domain name (FQDN), such as www.example.com, that you want to secure with an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the same domain. For example, *.example.com protects www.example.com, site.example.com, and images.example.com.
    
     In compliance with {{:https://datatracker.ietf.org/doc/html/rfc5280}RFC 5280}, the length of the domain name (technically, the Common Name) that you provide cannot exceed 64 octets (characters), including periods. To add a longer domain name, specify it in the Subject Alternative Name field, which supports names up to 253 octets in length.
      |}]

}

(** 
    One or both of the values that make up the key-value pair is not valid. For example, you cannot specify a tag value that begins with [aws:].
     *)
type invalid_tag_exception = {
  message: string option;
  
}

(** 
    An input parameter was invalid.
     *)
type invalid_parameter_exception = {
  message: string option;
  
}

type renewal_status = | FAILED
  | SUCCESS
  | PENDING_VALIDATION
  | PENDING_AUTO_RENEWAL

type domain_status = | FAILED
  | SUCCESS
  | PENDING_VALIDATION

(** 
    Contains information about the validation of each domain name in the certificate.
     *)
type domain_validation = {
  validation_method: validation_method option;
  (** 
    Specifies the domain validation method.
     *)

  resource_record: resource_record option;
  [@ocaml.doc {| 
    Contains the CNAME record that you add to your DNS database for domain validation. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}Use DNS to Validate Domain Ownership}.
    
     Note: The CNAME information that you need does not include the name of your domain. If you include  your domain name in the DNS database CNAME record, validation fails.  For example, if the name is "_a79865eb4cd1a6ab990a45779b4e0b96.yourdomain.com", only "_a79865eb4cd1a6ab990a45779b4e0b96" must be used.
      |}]

  validation_status: domain_status option;
  (** 
    The validation status of the domain name. This can be one of the following values:
    
     {ul
          {- [PENDING_VALIDATION]
             
             }
           {- SUCCESS
              
              }
           {- FAILED
              
              }
          
      }
       *)

  validation_domain: string option;
  (** 
    The domain name that ACM used to send domain validation emails.
     *)

  validation_emails: string list option;
  (** 
    A list of email addresses that ACM used to send domain validation emails.
     *)

  domain_name: string;
  (** 
    A fully qualified domain name (FQDN) in the certificate. For example, [www.example.com] or [example.com].
     *)

}

type failure_reason = | OTHER
  | SLR_NOT_FOUND
  | PCA_ACCESS_DENIED
  | PCA_INVALID_DURATION
  | PCA_INVALID_ARGS
  | PCA_RESOURCE_NOT_FOUND
  | PCA_NAME_CONSTRAINTS_VALIDATION
  | PCA_REQUEST_FAILED
  | PCA_INVALID_STATE
  | PCA_INVALID_ARN
  | PCA_LIMIT_EXCEEDED
  | CAA_ERROR
  | DOMAIN_VALIDATION_DENIED
  | INVALID_PUBLIC_DOMAIN
  | DOMAIN_NOT_ALLOWED
  | ADDITIONAL_VERIFICATION_REQUIRED
  | NO_AVAILABLE_CONTACTS

(** 
    Contains information about the status of ACM's {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for the certificate. This structure exists only when the certificate type is [AMAZON_ISSUED].
     *)
type renewal_summary = {
  updated_at: float;
  (** 
    The time at which the renewal summary was last updated.
     *)

  renewal_status_reason: failure_reason option;
  (** 
    The reason that a renewal request was unsuccessful.
     *)

  domain_validation_options: domain_validation list;
  (** 
    Contains information about the validation of each domain name in the certificate, as it pertains to ACM's {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal}. This is different from the initial validation that occurs as a result of the [RequestCertificate] request. This field exists only when the certificate type is [AMAZON_ISSUED].
     *)

  renewal_status: renewal_status;
  (** 
    The status of ACM's {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} of the certificate.
     *)

}

type renewal_eligibility = | INELIGIBLE
  | ELIGIBLE

type renew_certificate_request = {
  certificate_arn: string;
  (** 
    String that contains the ARN of the ACM certificate to be renewed. This must be of the form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type remove_tags_from_certificate_request = {
  tags: tag list;
  (** 
    The key-value pair that defines the tag to remove.
     *)

  certificate_arn: string;
  (** 
    String that contains the ARN of the ACM Certificate with one or more tags that you want to remove. This must be of the form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

(** 
    Object containing expiration events options associated with an Amazon Web Services account.
     *)
type expiry_events_configuration = {
  days_before_expiry: int option;
  (** 
    Specifies the number of days prior to certificate expiration when ACM starts generating [EventBridge] events. ACM sends one event per day per certificate until the certificate expires. By default, accounts receive events starting 45 days before certificate expiration.
     *)

}

type put_account_configuration_request = {
  idempotency_token: string;
  (** 
    Customer-chosen string used to distinguish between calls to [PutAccountConfiguration]. Idempotency tokens time out after one hour. If you call [PutAccountConfiguration] multiple times with the same unexpired idempotency token, ACM treats it as the same request and returns the original result. If you change the idempotency token for each call, ACM treats each call as a new request.
     *)

  expiry_events: expiry_events_configuration option;
  (** 
    Specifies expiration events associated with an account.
     *)

}

(** 
    You are trying to update a resource or configuration that is already being created or updated. Wait for the previous operation to finish and try again.
     *)
type conflict_exception = {
  message: string option;
  
}

(** 
    You do not have access required to perform this action.
     *)
type access_denied_exception = {
  message: string option;
  
}

type list_tags_for_certificate_response = {
  tags: tag list option;
  (** 
    The key-value pairs that define the applied tags.
     *)

}

type list_tags_for_certificate_request = {
  certificate_arn: string;
  (** 
    String that contains the ARN of the ACM certificate for which you want to list the tags. This must have the following form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type certificate_status = | FAILED
  | REVOKED
  | VALIDATION_TIMED_OUT
  | EXPIRED
  | INACTIVE
  | ISSUED
  | PENDING_VALIDATION

type certificate_type = | PRIVATE
  | AMAZON_ISSUED
  | IMPORTED

type key_usage_name = | CUSTOM
  | ANY
  | DECIPHER_ONLY
  | ENCHIPER_ONLY
  | CRL_SIGNING
  | CERTIFICATE_SIGNING
  | KEY_AGREEMENT
  | DATA_ENCIPHERMENT
  | KEY_ENCIPHERMENT
  | NON_REPUDATION
  | DIGITAL_SIGNATURE

type extended_key_usage_name = | CUSTOM
  | NONE
  | ANY
  | IPSEC_USER
  | IPSEC_TUNNEL
  | IPSEC_END_SYSTEM
  | OCSP_SIGNING
  | TIME_STAMPING
  | EMAIL_PROTECTION
  | CODE_SIGNING
  | TLS_WEB_CLIENT_AUTHENTICATION
  | TLS_WEB_SERVER_AUTHENTICATION

(** 
    This structure is returned in the response object of [ListCertificates] action.
     *)
type certificate_summary = {
  revoked_at: float option;
  (** 
    The time at which the certificate was revoked. This value exists only when the certificate status is [REVOKED].
     *)

  imported_at: float option;
  (** 
    The date and time when the certificate was imported. This value exists only when the certificate type is [IMPORTED].
     *)

  issued_at: float option;
  (** 
    The time at which the certificate was issued. This value exists only when the certificate type is [AMAZON_ISSUED].
     *)

  created_at: float option;
  (** 
    The time at which the certificate was requested.
     *)

  not_after: float option;
  (** 
    The time after which the certificate is not valid.
     *)

  not_before: float option;
  (** 
    The time before which the certificate is not valid.
     *)

  renewal_eligibility: renewal_eligibility option;
  (** 
    Specifies whether the certificate is eligible for renewal. At this time, only exported private certificates can be renewed with the [RenewCertificate] command.
     *)

  exported: bool option;
  (** 
    Indicates whether the certificate has been exported. This value exists only when the certificate type is [PRIVATE].
     *)

  in_use: bool option;
  (** 
    Indicates whether the certificate is currently in use by any Amazon Web Services resources.
     *)

  extended_key_usages: extended_key_usage_name list option;
  (** 
    Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a purpose for which the certificate public key can be used and consists of a name and an object identifier (OID).
     *)

  key_usages: key_usage_name list option;
  (** 
    A list of Key Usage X.509 v3 extension objects. Each object is a string value that identifies the purpose of the public key contained in the certificate. Possible extension values include DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
     *)

  key_algorithm: key_algorithm option;
  (** 
    The algorithm that was used to generate the public-private key pair.
     *)

  type_: certificate_type option;
  (** 
    The source of the certificate. For certificates provided by ACM, this value is [AMAZON_ISSUED]. For certificates that you imported with [ImportCertificate], this value is [IMPORTED]. ACM does not provide {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for imported certificates. For more information about the differences between certificates that you import and those that ACM provides, see {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing Certificates} in the {i Certificate Manager User Guide}.
     *)

  status: certificate_status option;
  (** 
    The status of the certificate.
    
     A certificate enters status PENDING_VALIDATION upon being requested, unless it fails for any of the reasons given in the troubleshooting topic {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html}Certificate request fails}. ACM makes repeated attempts to validate a certificate for 72 hours and then times out. If a certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the request, correct the issue with {{:https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html}DNS validation} or {{:https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html}Email validation}, and try again. If validation succeeds, the certificate enters status ISSUED.
      *)

  has_additional_subject_alternative_names: bool option;
  (** 
    When called by {{:https://docs.aws.amazon.com/acm/latestAPIReference/API_ListCertificates.html}ListCertificates}, indicates whether the full list of subject alternative names has been included in the response. If false, the response includes all of the subject alternative names included in the certificate. If true, the response only includes the first 100 subject alternative names included in the certificate. To display the full list of subject alternative names, use {{:https://docs.aws.amazon.com/acm/latestAPIReference/API_DescribeCertificate.html}DescribeCertificate}.
     *)

  subject_alternative_name_summaries: string list option;
  (** 
    One or more domain names (subject alternative names) included in the certificate. This list contains the domain names that are bound to the public key that is contained in the certificate. The subject alternative names include the canonical domain name (CN) of the certificate and additional domain names that can be used to connect to the website.
    
     When called by {{:https://docs.aws.amazon.com/acm/latestAPIReference/API_ListCertificates.html}ListCertificates}, this parameter will only return the first 100 subject alternative names included in the certificate. To display the full list of subject alternative names, use {{:https://docs.aws.amazon.com/acm/latestAPIReference/API_DescribeCertificate.html}DescribeCertificate}.
      *)

  domain_name: string option;
  (** 
    Fully qualified domain name (FQDN), such as www.example.com or example.com, for the certificate.
     *)

  certificate_arn: string option;
  (** 
    Amazon Resource Name (ARN) of the certificate. This is of the form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type list_certificates_response = {
  certificate_summary_list: certificate_summary list option;
  (** 
    A list of ACM certificates.
     *)

  next_token: string option;
  (** 
    When the list is truncated, this value is present and contains the value to use for the [NextToken] parameter in a subsequent pagination request.
     *)

}

(** 
    This structure can be used in the [ListCertificates] action to filter the output of the certificate list.
     *)
type filters = {
  key_types: key_algorithm list option;
  [@ocaml.doc {| 
    Specify one or more algorithms that can be used to generate key pairs.
    
     Default filtering returns only [RSA_1024] and [RSA_2048] certificates that have at least one domain. To return other certificate types, provide the desired type signatures in a comma-separated list. For example, ["keyTypes":
        \["RSA_2048","RSA_4096"\]] returns both [RSA_2048] and [RSA_4096] certificates.
      |}]

  key_usage: key_usage_name list option;
  (** 
    Specify one or more [KeyUsage] extension values.
     *)

  extended_key_usage: extended_key_usage_name list option;
  (** 
    Specify one or more [ExtendedKeyUsage] extension values.
     *)

}

type list_certificates_request = {
  sort_order: sort_order option;
  (** 
    Specifies the order of sorted results. If you specify [SortOrder], you must also specify [SortBy].
     *)

  sort_by: sort_by option;
  (** 
    Specifies the field to sort results by. If you specify [SortBy], you must also specify [SortOrder].
     *)

  max_items: int option;
  (** 
    Use this parameter when paginating results to specify the maximum number of items to return in the response. If additional items exist beyond the number you specify, the [NextToken] element is sent in the response. Use this [NextToken] value in a subsequent request to retrieve additional items.
     *)

  next_token: string option;
  (** 
    Use this parameter only when paginating results and only in a subsequent request after you receive a response with truncated results. Set it to the value of [NextToken] from the response you just received.
     *)

  includes: filters option;
  (** 
    Filter the certificate list. For more information, see the [Filters] structure.
     *)

  certificate_statuses: certificate_status list option;
  (** 
    Filter the certificate list by status value.
     *)

}

(** 
    One or more of of request parameters specified is not valid.
     *)
type invalid_args_exception = {
  message: string option;
  
}

(** 
    The Key Usage X.509 v3 extension defines the purpose of the public key contained in the certificate.
     *)
type key_usage = {
  name: key_usage_name option;
  (** 
    A string value that contains a Key Usage extension name.
     *)

}

type import_certificate_response = {
  certificate_arn: string option;
  (** 
    The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of the imported certificate.
     *)

}

type import_certificate_request = {
  tags: tag list option;
  (** 
    One or more resource tags to associate with the imported certificate.
    
     Note: You cannot apply tags when reimporting a certificate.
      *)

  certificate_chain: bytes option;
  (** 
    The PEM encoded certificate chain.
     *)

  private_key: bytes;
  (** 
    The private key that matches the public key in the certificate.
     *)

  certificate: bytes;
  (** 
    The certificate to import.
     *)

  certificate_arn: string option;
  (** 
    The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an imported certificate to replace. To import a new certificate, omit this field.
     *)

}

type get_certificate_response = {
  certificate_chain: string option;
  (** 
    Certificates forming the requested certificate's chain of trust. The chain consists of the certificate of the issuing CA and the intermediate certificates of any other subordinate CAs.
     *)

  certificate: string option;
  (** 
    The ACM-issued certificate corresponding to the ARN specified as input.
     *)

}

type get_certificate_request = {
  certificate_arn: string;
  (** 
    String that contains a certificate ARN in the following format:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type get_account_configuration_response = {
  expiry_events: expiry_events_configuration option;
  (** 
    Expiration events configuration options associated with the Amazon Web Services account.
     *)

}

(** 
    The Extended Key Usage X.509 v3 extension defines one or more purposes for which the public key can be used. This is in addition to or in place of the basic purposes specified by the Key Usage extension.
     *)
type extended_key_usage = {
  oi_d: string option;
  (** 
    An object identifier (OID) for the extension value. OIDs are strings of numbers separated by periods. The following OIDs are defined in RFC 3280 and RFC 5280.
    
     {ul
          {- [1.3.6.1.5.5.7.3.1 (TLS_WEB_SERVER_AUTHENTICATION)]
             
             }
           {- [1.3.6.1.5.5.7.3.2 (TLS_WEB_CLIENT_AUTHENTICATION)]
              
              }
           {- [1.3.6.1.5.5.7.3.3 (CODE_SIGNING)]
              
              }
           {- [1.3.6.1.5.5.7.3.4 (EMAIL_PROTECTION)]
              
              }
           {- [1.3.6.1.5.5.7.3.8 (TIME_STAMPING)]
              
              }
           {- [1.3.6.1.5.5.7.3.9 (OCSP_SIGNING)]
              
              }
           {- [1.3.6.1.5.5.7.3.5 (IPSEC_END_SYSTEM)]
              
              }
           {- [1.3.6.1.5.5.7.3.6 (IPSEC_TUNNEL)]
              
              }
           {- [1.3.6.1.5.5.7.3.7 (IPSEC_USER)]
              
              }
          
      }
       *)

  name: extended_key_usage_name option;
  (** 
    The name of an Extended Key Usage value.
     *)

}

type export_certificate_response = {
  private_key: string option;
  (** 
    The encrypted private key associated with the public key in the certificate. The key is output in PKCS #8 format and is base64 PEM-encoded.
     *)

  certificate_chain: string option;
  (** 
    The base64 PEM-encoded certificate chain. This does not include the certificate that you are exporting.
     *)

  certificate: string option;
  (** 
    The base64 PEM-encoded certificate.
     *)

}

type export_certificate_request = {
  passphrase: bytes;
  (** 
    Passphrase to associate with the encrypted exported private key.
    
     When creating your passphrase, you can use any ASCII character except #, $, or %.
     
      If you want to later decrypt the private key, you must have the passphrase. You can use the following OpenSSL command to decrypt a private key. After entering the command, you are prompted for the passphrase.
      
       [openssl rsa -in encrypted_key.pem -out decrypted_key.pem]
        *)

  certificate_arn: string;
  (** 
    An Amazon Resource Name (ARN) of the issued certificate. This must be of the form:
    
     [arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012]
      *)

}

(** 
    Contains metadata about an ACM certificate. This structure is returned in the response to a [DescribeCertificate] request.
     *)
type certificate_detail = {
  options: certificate_options option;
  (** 
    Value that specifies whether to add the certificate to a transparency log. Certificate transparency makes it possible to detect SSL certificates that have been mistakenly or maliciously issued. A browser might respond to certificate that has not been logged by showing an error message. The logs are cryptographically secure.
     *)

  renewal_eligibility: renewal_eligibility option;
  (** 
    Specifies whether the certificate is eligible for renewal. At this time, only exported private certificates can be renewed with the [RenewCertificate] command.
     *)

  certificate_authority_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the private certificate authority (CA) that issued the certificate. This has the following format:
    
     [arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012]
      *)

  extended_key_usages: extended_key_usage list option;
  (** 
    Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a purpose for which the certificate public key can be used and consists of a name and an object identifier (OID).
     *)

  key_usages: key_usage list option;
  (** 
    A list of Key Usage X.509 v3 extension objects. Each object is a string value that identifies the purpose of the public key contained in the certificate. Possible extension values include DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
     *)

  renewal_summary: renewal_summary option;
  (** 
    Contains information about the status of ACM's {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for the certificate. This field exists only when the certificate type is [AMAZON_ISSUED].
     *)

  type_: certificate_type option;
  (** 
    The source of the certificate. For certificates provided by ACM, this value is [AMAZON_ISSUED]. For certificates that you imported with [ImportCertificate], this value is [IMPORTED]. ACM does not provide {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for imported certificates. For more information about the differences between certificates that you import and those that ACM provides, see {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing Certificates} in the {i Certificate Manager User Guide}.
     *)

  failure_reason: failure_reason option;
  (** 
    The reason the certificate request failed. This value exists only when the certificate status is [FAILED]. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting.html#troubleshooting-failed}Certificate Request Failed} in the {i Certificate Manager User Guide}.
     *)

  in_use_by: string list option;
  (** 
    A list of ARNs for the Amazon Web Services resources that are using the certificate. A certificate can be used by multiple Amazon Web Services resources.
     *)

  signature_algorithm: string option;
  (** 
    The algorithm that was used to sign the certificate.
     *)

  key_algorithm: key_algorithm option;
  (** 
    The algorithm that was used to generate the public-private key pair.
     *)

  not_after: float option;
  (** 
    The time after which the certificate is not valid.
     *)

  not_before: float option;
  (** 
    The time before which the certificate is not valid.
     *)

  revocation_reason: revocation_reason option;
  (** 
    The reason the certificate was revoked. This value exists only when the certificate status is [REVOKED].
     *)

  revoked_at: float option;
  (** 
    The time at which the certificate was revoked. This value exists only when the certificate status is [REVOKED].
     *)

  status: certificate_status option;
  (** 
    The status of the certificate.
    
     A certificate enters status PENDING_VALIDATION upon being requested, unless it fails for any of the reasons given in the troubleshooting topic {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html}Certificate request fails}. ACM makes repeated attempts to validate a certificate for 72 hours and then times out. If a certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the request, correct the issue with {{:https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html}DNS validation} or {{:https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html}Email validation}, and try again. If validation succeeds, the certificate enters status ISSUED.
      *)

  imported_at: float option;
  (** 
    The date and time when the certificate was imported. This value exists only when the certificate type is [IMPORTED].
     *)

  issued_at: float option;
  (** 
    The time at which the certificate was issued. This value exists only when the certificate type is [AMAZON_ISSUED].
     *)

  created_at: float option;
  (** 
    The time at which the certificate was requested.
     *)

  issuer: string option;
  (** 
    The name of the certificate authority that issued and signed the certificate.
     *)

  subject: string option;
  (** 
    The name of the entity that is associated with the public key contained in the certificate.
     *)

  serial: string option;
  (** 
    The serial number of the certificate.
     *)

  domain_validation_options: domain_validation list option;
  (** 
    Contains information about the initial validation of each domain name that occurs as a result of the [RequestCertificate] request. This field exists only when the certificate type is [AMAZON_ISSUED].
     *)

  subject_alternative_names: string list option;
  (** 
    One or more domain names (subject alternative names) included in the certificate. This list contains the domain names that are bound to the public key that is contained in the certificate. The subject alternative names include the canonical domain name (CN) of the certificate and additional domain names that can be used to connect to the website.
     *)

  domain_name: string option;
  (** 
    The fully qualified domain name for the certificate, such as www.example.com or example.com.
     *)

  certificate_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the certificate. For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.
     *)

}

type describe_certificate_response = {
  certificate: certificate_detail option;
  (** 
    Metadata about an ACM certificate.
     *)

}

type describe_certificate_request = {
  certificate_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the ACM certificate. The ARN must have the following form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type delete_certificate_request = {
  certificate_arn: string;
  (** 
    String that contains the ARN of the ACM certificate to be deleted. This must be of the form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

type add_tags_to_certificate_request = {
  tags: tag list;
  (** 
    The key-value pair that defines the tag. The tag value is optional.
     *)

  certificate_arn: string;
  (** 
    String that contains the ARN of the ACM certificate to which the tag is to be applied. This must be of the form:
    
     [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012]
     
      For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)}.
       *)

}

(** 
    Certificate Manager You can use Certificate Manager (ACM) to manage SSL/TLS certificates for your Amazon Web Services-based websites and applications. For more information about using ACM, see the {{:https://docs.aws.amazon.com/acm/latest/userguide/}Certificate Manager User Guide}.
                         *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  unit
-> certificate_options
(** Create a {!type-certificate_options} type *)

val make_update_certificate_options_request :
  options:certificate_options -> certificate_arn:string -> unit
-> update_certificate_options_request
(** Create a {!type-update_certificate_options_request} type *)

val make_tag : ?value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_resource_record :
  value:string -> type_:record_type -> name:string -> unit
-> resource_record
(** Create a {!type-resource_record} type *)

val make_resend_validation_email_request :
  validation_domain:string -> domain:string -> certificate_arn:string -> unit
-> resend_validation_email_request
(** Create a {!type-resend_validation_email_request} type *)

val make_request_certificate_response : ?certificate_arn:string -> unit
-> request_certificate_response
(** Create a {!type-request_certificate_response} type *)

val make_domain_validation_option :
  validation_domain:string -> domain_name:string -> unit
-> domain_validation_option
(** Create a {!type-domain_validation_option} type *)

val make_request_certificate_request :
  ?key_algorithm:key_algorithm ->
  ?tags:tag list ->
  ?certificate_authority_arn:string ->
  ?options:certificate_options ->
  ?domain_validation_options:domain_validation_option list ->
  ?idempotency_token:string ->
  ?subject_alternative_names:string list ->
  ?validation_method:validation_method ->
  domain_name:string ->
  unit
-> request_certificate_request
(** Create a {!type-request_certificate_request} type *)

val make_domain_validation :
  ?validation_method:validation_method ->
  ?resource_record:resource_record ->
  ?validation_status:domain_status ->
  ?validation_domain:string ->
  ?validation_emails:string list ->
  domain_name:string ->
  unit
-> domain_validation
(** Create a {!type-domain_validation} type *)

val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
  updated_at:float ->
  domain_validation_options:domain_validation list ->
  renewal_status:renewal_status ->
  unit
-> renewal_summary
(** Create a {!type-renewal_summary} type *)

val make_renew_certificate_request : certificate_arn:string -> unit
-> renew_certificate_request
(** Create a {!type-renew_certificate_request} type *)

val make_remove_tags_from_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> remove_tags_from_certificate_request
(** Create a {!type-remove_tags_from_certificate_request} type *)

val make_expiry_events_configuration : ?days_before_expiry:int -> unit
-> expiry_events_configuration
(** Create a {!type-expiry_events_configuration} type *)

val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
  idempotency_token:string ->
  unit
-> put_account_configuration_request
(** Create a {!type-put_account_configuration_request} type *)

val make_list_tags_for_certificate_response : ?tags:tag list -> unit
-> list_tags_for_certificate_response
(** Create a {!type-list_tags_for_certificate_response} type *)

val make_list_tags_for_certificate_request : certificate_arn:string -> unit
-> list_tags_for_certificate_request
(** Create a {!type-list_tags_for_certificate_request} type *)

val make_certificate_summary :
  ?revoked_at:float ->
  ?imported_at:float ->
  ?issued_at:float ->
  ?created_at:float ->
  ?not_after:float ->
  ?not_before:float ->
  ?renewal_eligibility:renewal_eligibility ->
  ?exported:bool ->
  ?in_use:bool ->
  ?extended_key_usages:extended_key_usage_name list ->
  ?key_usages:key_usage_name list ->
  ?key_algorithm:key_algorithm ->
  ?type_:certificate_type ->
  ?status:certificate_status ->
  ?has_additional_subject_alternative_names:bool ->
  ?subject_alternative_name_summaries:string list ->
  ?domain_name:string ->
  ?certificate_arn:string ->
  unit
-> certificate_summary
(** Create a {!type-certificate_summary} type *)

val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary list ->
  ?next_token:string ->
  unit
-> list_certificates_response
(** Create a {!type-list_certificates_response} type *)

val make_filters :
  ?key_types:key_algorithm list ->
  ?key_usage:key_usage_name list ->
  ?extended_key_usage:extended_key_usage_name list ->
  unit
-> filters
(** Create a {!type-filters} type *)

val make_list_certificates_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?max_items:int ->
  ?next_token:string ->
  ?includes:filters ->
  ?certificate_statuses:certificate_status list ->
  unit
-> list_certificates_request
(** Create a {!type-list_certificates_request} type *)

val make_key_usage : ?name:key_usage_name -> unit
-> key_usage
(** Create a {!type-key_usage} type *)

val make_import_certificate_response : ?certificate_arn:string -> unit
-> import_certificate_response
(** Create a {!type-import_certificate_response} type *)

val make_import_certificate_request :
  ?tags:tag list ->
  ?certificate_chain:bytes ->
  ?certificate_arn:string ->
  private_key:bytes ->
  certificate:bytes ->
  unit
-> import_certificate_request
(** Create a {!type-import_certificate_request} type *)

val make_get_certificate_response :
  ?certificate_chain:string -> ?certificate:string -> unit
-> get_certificate_response
(** Create a {!type-get_certificate_response} type *)

val make_get_certificate_request : certificate_arn:string -> unit
-> get_certificate_request
(** Create a {!type-get_certificate_request} type *)

val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration -> unit
-> get_account_configuration_response
(** Create a {!type-get_account_configuration_response} type *)

val make_extended_key_usage :
  ?oi_d:string -> ?name:extended_key_usage_name -> unit
-> extended_key_usage
(** Create a {!type-extended_key_usage} type *)

val make_export_certificate_response :
  ?private_key:string ->
  ?certificate_chain:string ->
  ?certificate:string ->
  unit
-> export_certificate_response
(** Create a {!type-export_certificate_response} type *)

val make_export_certificate_request :
  passphrase:bytes -> certificate_arn:string -> unit
-> export_certificate_request
(** Create a {!type-export_certificate_request} type *)

val make_certificate_detail :
  ?options:certificate_options ->
  ?renewal_eligibility:renewal_eligibility ->
  ?certificate_authority_arn:string ->
  ?extended_key_usages:extended_key_usage list ->
  ?key_usages:key_usage list ->
  ?renewal_summary:renewal_summary ->
  ?type_:certificate_type ->
  ?failure_reason:failure_reason ->
  ?in_use_by:string list ->
  ?signature_algorithm:string ->
  ?key_algorithm:key_algorithm ->
  ?not_after:float ->
  ?not_before:float ->
  ?revocation_reason:revocation_reason ->
  ?revoked_at:float ->
  ?status:certificate_status ->
  ?imported_at:float ->
  ?issued_at:float ->
  ?created_at:float ->
  ?issuer:string ->
  ?subject:string ->
  ?serial:string ->
  ?domain_validation_options:domain_validation list ->
  ?subject_alternative_names:string list ->
  ?domain_name:string ->
  ?certificate_arn:string ->
  unit
-> certificate_detail
(** Create a {!type-certificate_detail} type *)

val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit
-> describe_certificate_response
(** Create a {!type-describe_certificate_response} type *)

val make_describe_certificate_request : certificate_arn:string -> unit
-> describe_certificate_request
(** Create a {!type-describe_certificate_request} type *)

val make_delete_certificate_request : certificate_arn:string -> unit
-> delete_certificate_request
(** Create a {!type-delete_certificate_request} type *)

val make_add_tags_to_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> add_tags_to_certificate_request
(** Create a {!type-add_tags_to_certificate_request} type *)

(** {1:operations Operations} *)

module AddTagsToCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to an ACM certificate. Tags are labels that you can use to identify and organize your Amazon Web Services resources. Each tag consists of a [key] and an optional [value]. You specify the certificate on input by its Amazon Resource Name (ARN). You specify the tag by using a key-value pair.
    
     You can apply a tag to just one certificate if you want to identify a specific characteristic of that certificate, or you can apply the same tag to multiple certificates if you want to filter for a common relationship among those certificates. Similarly, you can apply the same tag to multiple resources if you want to specify a relationship among those resources. For example, you can add the same tag to an ACM certificate and an Elastic Load Balancing load balancer to indicate that they are both used by the same website. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/tags.html}Tagging ACM certificates}.
     
      To remove one or more tags, use the [RemoveTagsFromCertificate] action. To view all of the tags that have been applied to the certificate, use the [ListTagsForCertificate] action.
       *)

  
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InvalidArnException of invalid_arn_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Deletes a certificate and its associated private key. If this action succeeds, the certificate no longer appears in the list that can be displayed by calling the [ListCertificates] action or be retrieved by calling the [GetCertificate] action. The certificate will not be available for use by Amazon Web Services services integrated with ACM.
    
     You cannot delete an ACM certificate that is being used by another Amazon Web Services service. To delete a certificate that is in use, the certificate association must first be removed.
     
      *)

  
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns detailed metadata about the specified ACM certificate.
    
     If you have just created a certificate using the [RequestCertificate] action, there is a delay of several seconds before you can retrieve information about it.
      *)

  
end

module ExportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      export_certificate_request ->
        (export_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Exports a private certificate issued by a private certificate authority (CA) for use anywhere. The exported file contains the certificate, the certificate chain, and the encrypted private 2048-bit RSA key associated with the public key that is embedded in the certificate. For security, you must assign a passphrase for the private key when exporting it.
    
     For information about exporting and formatting a certificate using the ACM console or CLI, see {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-export-private.html}Export a Private Certificate}.
      *)

  
end

module GetAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_account_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Returns the account configuration options associated with an Amazon Web Services account.
     *)

  
end

module GetCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificate_request ->
        (get_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves an Amazon-issued certificate and its certificate chain. The chain consists of the certificate of the issuing CA and the intermediate certificates of any other subordinate CAs. All of the certificates are base64 encoded. You can use {{:https://wiki.openssl.org/index.php/Command_Line_Utilities}OpenSSL} to decode the certificates and inspect individual fields.
     *)

  
end

module ImportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      import_certificate_request ->
        (import_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Imports a certificate into Certificate Manager (ACM) to use with services that are integrated with ACM. Note that {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html}integrated services} allow only certificate types and keys they support to be associated with their resources. Further, their support differs depending on whether the certificate is imported into IAM or into ACM. For more information, see the documentation for each service. For more information about importing certificates into ACM, see {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing Certificates} in the {i Certificate Manager User Guide}.
    
     ACM does not provide {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for certificates that you import.
     
      Note the following guidelines when importing third party certificates:
      
       {ul
            {- You must enter the private key that matches the certificate you are importing.
               
               }
             {- The private key must be unencrypted. You cannot import a private key that is protected by a password or a passphrase.
                
                }
             {- The private key must be no larger than 5 KB (5,120 bytes).
                
                }
             {- If the certificate you are importing is not self-signed, you must enter its certificate chain.
                
                }
             {- If a certificate chain is included, the issuer must be the subject of one of the certificates in the chain.
                
                }
             {- The certificate, private key, and certificate chain must be PEM-encoded.
                
                }
             {- The current time must be between the [Not Before] and [Not
            After] certificate fields.
                
                }
             {- The [Issuer] field must not be empty.
                
                }
             {- The OCSP authority URL, if present, must not exceed 1000 characters.
                
                }
             {- To import a new certificate, omit the [CertificateArn] argument. Include this argument only when you want to replace a previously imported certificate.
                
                }
             {- When you import a certificate by using the CLI, you must specify the certificate, the certificate chain, and the private key by their file names preceded by [fileb://]. For example, you can specify a certificate saved in the [C:\temp] folder as [fileb://C:\temp\certificate_to_import.pem]. If you are making an HTTP or HTTPS Query request, include these arguments as BLOBs.
                
                }
             {- When you import a certificate by using an SDK, you must specify the certificate, the certificate chain, and the private key files in the manner required by the programming language you're using.
                
                }
             {- The cryptographic algorithm of an imported certificate must match the algorithm of the signing CA. For example, if the signing CA key type is RSA, then the certificate key type must also be RSA.
                
                }
            
      }
       This operation returns the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of the imported certificate.
        *)

  
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgsException of invalid_args_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Retrieves a list of certificate ARNs and domain names. You can request that only certificates that match a specific status be listed. You can also filter by specific attributes of the certificate. Default filtering returns only [RSA_2048] certificates. For more information, see [Filters].
     *)

  
end

module ListTagsForCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_certificate_request ->
        (list_tags_for_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the tags that have been applied to the ACM certificate. Use the certificate's Amazon Resource Name (ARN) to specify the certificate. To add a tag to an ACM certificate, use the [AddTagsToCertificate] action. To delete a tag, use the [RemoveTagsFromCertificate] action.
     *)

  
end

module PutAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_account_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Adds or modifies account-level configurations in ACM.
    
     The supported configuration option is [DaysBeforeExpiry]. This option specifies the number of days prior to certificate expiration when ACM starts generating [EventBridge] events. ACM sends one event per day per certificate until the certificate expires. By default, accounts receive events starting 45 days before certificate expiration.
      *)

  
end

module RemoveTagsFromCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If you do not specify the value portion of the tag when calling this function, the tag will be removed regardless of value. If you specify a value, the tag is removed only if it is associated with the specified value.
    
     To add tags to a certificate, use the [AddTagsToCertificate] action. To view all of the tags that have been applied to a specific ACM certificate, use the [ListTagsForCertificate] action.
      *)

  
end

module RenewCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      renew_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Renews an eligible ACM certificate. At this time, only exported private certificates can be renewed with this operation. In order to renew your Amazon Web Services Private CA certificates with ACM, you must first {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaPermissions.html}grant the ACM service principal permission to do so}. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html}Testing Managed Renewal} in the ACM User Guide.
     *)

  
end

module RequestCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      request_certificate_request ->
        (request_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM certificate, you must specify a fully qualified domain name (FQDN) in the [DomainName] parameter. You can also specify additional FQDNs in the [SubjectAlternativeNames] parameter.
    
     If you are requesting a private certificate, domain validation is not required. If you are requesting a public certificate, each domain name that you specify must be validated to verify that you own or control the domain. You can use {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}DNS validation} or {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}email validation}. We recommend that you use DNS validation. ACM issues public certificates after receiving approval from the domain owner.
     
      ACM behavior differs from the {{:https://datatracker.ietf.org/doc/html/rfc6125#appendix-B.2}RFC 6125} specification of the certificate validation process. ACM first checks for a Subject Alternative Name, and, if it finds one, ignores the common name (CN).
      
       After successful completion of the [RequestCertificate] action, there is a delay of several seconds before you can retrieve information about the new certificate.
        *)

  
end

module ResendValidationEmail : sig
  val request :
    Smaws_Lib.Context.t ->
      resend_validation_email_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Resends the email that requests domain ownership validation. The domain owner or an authorized representative must approve the ACM certificate before it can be issued. The certificate can be approved by clicking a link in the mail to navigate to the Amazon certificate approval website and then clicking {b I Approve}. However, the validation email can be blocked by spam filters. Therefore, if you do not receive the original mail, you can request that the mail be resent within 72 hours of requesting the ACM certificate. If more than 72 hours have elapsed since your original request or since your last attempt to resend validation mail, you must request a new certificate. For more information about setting up your contact email addresses, see {{:https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html}Configure Email for your Domain}.
     *)

  
end

module UpdateCertificateOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_certificate_options_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates a certificate. Currently, you can use this function to specify whether to opt in to or out of recording your certificate in a certificate transparency log. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency}Opting Out of Certificate Transparency Logging}.
     *)

  
end

