open Types 
module DescribeAgreement : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_agreement_input ->
        (describe_agreement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Provides details about an agreement, such as the proposer, acceptor, start date, and end date.
     *)

  
end

module GetAgreementTerms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_agreement_terms_input ->
        (get_agreement_terms_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Obtains details about the terms in an agreement that you participated in as proposer or acceptor.
    
     The details include:
     
      {ul
           {- [TermType] – The type of term, such as [LegalTerm], [RenewalTerm], or [ConfigurableUpfrontPricingTerm].
              
              }
            {- [TermID] – The ID of the particular term, which is common between offer and agreement.
               
               }
            {- [TermPayload] – The key information contained in the term, such as the EULA for [LegalTerm] or pricing and dimensions for various pricing terms, such as [ConfigurableUpfrontPricingTerm] or [UsageBasedPricingTerm].
               
               }
           
      }
       {ul
            {- [Configuration] – The buyer/acceptor's selection at the time of agreement creation, such as the number of units purchased for a dimension or setting the [EnableAutoRenew] flag.
               
               }
            
      }
       *)

  
end

module SearchAgreements : sig
  val request :
    Smaws_Lib.Context.t ->
      search_agreements_input ->
        (search_agreements_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Searches across all agreements that a proposer or an acceptor has in AWS Marketplace. The search returns a list of agreements with basic agreement information.
    
     The following filter combinations are supported:
     
      {ul
           {- [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier]
              
              }
            {- [PartyType] as [Proposer] + [AgreementType] + [OfferId]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [OfferId] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [ResourceType] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status]
               
               }
            {- [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType]
               
               }
           
      }
       *)

  
end

