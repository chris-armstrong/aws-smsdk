(** 
    Marketplace Agreement client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(**{|
    Defines the conditions that will keep an agreement created from this
    offer valid.|}*)
type validity_term = {
  agreement_end_date: float option;
   (**{|
    Defines the date when the agreement ends. The agreement ends at
    23:59:59.999 UTC on the date provided. If [AgreementEndDate] isn’t
    provided, the agreement end date is determined by the validity of
    individual terms.|}*)

  agreement_start_date: float option;
   (**{|
    Defines the date when agreement starts. The agreement starts at
    00:00:00.000 UTC on the date provided. If [AgreementStartDate] isn’t
    provided, the agreement start date is determined based on agreement
    signature time.|}*)

  agreement_duration: string option;
   (**{|
    Defines the duration that the agreement remains active. If
    [AgreementStartDate] isn’t provided, the agreement duration is relative
    to the agreement signature time. The duration is represented in the
    ISO_8601 format.|}*)

  type_: string option;
   (**{|
    Category of the term being updated.|}*)

}

type validation_exception_reason = | OTHER
  | UNSUPPORTED_FILTERS
  | INVALID_MAX_RESULTS
  | INVALID_NEXT_TOKEN
  | INVALID_SORT_ORDER
  | INVALID_SORT_BY
  | INVALID_FILTER_VALUES
  | INVALID_FILTER_NAME
  | INVALID_CATALOG
  | MISSING_AGREEMENT_ID
  | INVALID_AGREEMENT_ID

(**{|
    The input fails to satisfy the constraints specified by the service.|}*)
type validation_exception_field = {
  message: string;
   (**{|
    See applicable actions.|}*)

  name: string;
   (**{|
    The name of the field associated with the error.|}*)

}

(**{|
    The input fails to satisfy the constraints specified by the service.|}*)
type validation_exception = {
  fields: validation_exception_field list option;
   (**{|
    The fields associated with the error.|}*)

  reason: validation_exception_reason option;
   (**{|
    The reason associated with the error.|}*)

  message: string option;
  
  request_id: string option;
   (**{|
    The unique identifier associated with the error.|}*)

}

(**{|
    Defines the per unit rates for each individual product dimension.|}*)
type rate_card_item = {
  price: string option;
   (**{|
    Per unit price for the product dimension that’s used for calculating
    the amount to be charged.|}*)

  dimension_key: string option;
   (**{|
    Dimension for which the given entitlement applies. Dimensions represent
    categories of capacity in a product and are specified when the product is
    listed in AWS Marketplace.|}*)

}

(**{|
    Within the pay-as-you-go model defined under [UsageBasedPricingTerm], the
    [UsageBasedRateCardItem] defines an individual rate for a product
    dimension.|}*)
type usage_based_rate_card_item = {
  rate_card: rate_card_item list option;
   (**{|
    Defines the per unit rates for product dimensions.|}*)

}

(**{|
    Defines a usage-based pricing model (typically, pay-as-you-go pricing),
    where the customers are charged based on product usage.|}*)
type usage_based_pricing_term = {
  rate_cards: usage_based_rate_card_item list option;
   (**{|
    List of rate cards.|}*)

  currency_code: string option;
   (**{|
    Defines the currency for the prices mentioned in the term.|}*)

  type_: string option;
   (**{|
    Category of the term.|}*)

}

(**{|
    Request was denied due to request throttling.|}*)
type throttling_exception = {
  message: string option;
  
  request_id: string option;
   (**{|
    The unique identifier for the error.|}*)

}

(**{|
    Defines the customer support available for the acceptors when they
    purchase the software.|}*)
type support_term = {
  refund_policy: string option;
   (**{|
    Free-text field about the refund policy description that will be shown to
    customers as is on the website and console.|}*)

  type_: string option;
   (**{|
    Category of the term being updated.|}*)

}

type sort_order = | DESCENDING
  | ASCENDING

(**{|
    An object that contains the [SortBy] and [SortOrder] attributes.|}*)
type sort = {
  sort_order: sort_order option;
   (**{|
    The sorting order, which can be [ASCENDING] or [DESCENDING]. The default
    value is [DESCENDING].|}*)

  sort_by: string option;
   (**{|
    The attribute on which the data is grouped, which can be by [StartTime]
    and [EndTime]. The default value is [EndTime].|}*)

}

(**{|
    Differentiates between the mutually exclusive rate cards in the same
    pricing term to be selected by the buyer.|}*)
type selector = {
  value: string option;
   (**{|
    Contract duration. This field supports the ISO 8601 format.|}*)

  type_: string option;
   (**{|
    Category of selector.|}*)

}

(**{|
    The details of the party accepting the agreement terms. This is commonly
    the buyer for [PurchaseAgreement].|}*)
type acceptor = {
  account_id: string option;
   (**{|
    The AWS account ID of the acceptor.|}*)

}

(**{|
    Details of the party proposing the agreement terms,. This is commonly the
    seller for [PurchaseAgreement].|}*)
type proposer = {
  account_id: string option;
   (**{|
    The AWS account ID of the proposer.|}*)

}

(**{|
    The list of resources involved in the agreement.|}*)
type resource = {
  type_: string option;
   (**{|
    Type of the resource, which is the product. Values include [SaaSProduct]
    or [AmiProduct].|}*)

  id: string option;
   (**{|
    The unique identifier of the resource.
    
    We mention the term resource, which is most commonly a product, so a
    [resourceId] is also a [productId].
    |}*)

}

(**{|
    A summary of the proposal received from the proposer.|}*)
type proposal_summary = {
  offer_id: string option;
   (**{|
    The unique identifier of the offer in AWS Marketplace.|}*)

  resources: resource list option;
   (**{|
    The list of resources involved in the agreement.|}*)

}

type agreement_status = | TERMINATED
  | SUPERSEDED
  | ROLLED_BACK
  | REPLACED
  | RENEWED
  | EXPIRED
  | CANCELLED
  | ARCHIVED
  | ACTIVE

(**{|
    A summary of the agreement, including top-level attributes (for example,
    the agreement ID, version, proposer, and acceptor).|}*)
type agreement_view_summary = {
  status: agreement_status option;
   (**{|
    The current status of the agreement.|}*)

  proposal_summary: proposal_summary option;
   (**{|
    A summary of the proposal|}*)

  proposer: proposer option;
   (**{|
    Details of the party proposing the agreement terms, most commonly the
    seller for [PurchaseAgreement].|}*)

  acceptor: acceptor option;
   (**{|
    Details of the party accepting the agreement terms. This is commonly the
    buyer for [PurchaseAgreement.]|}*)

  agreement_type: string option;
   (**{|
    The type of agreement. Values are [PurchaseAgreement] or
    [VendorInsightsAgreement].|}*)

  end_time: float option;
   (**{|
    The date and time when the agreement ends. The field is [null] for
    pay-as-you-go agreements, which don’t have end dates.|}*)

  start_time: float option;
   (**{|
    The date and time when the agreement starts.|}*)

  acceptance_time: float option;
   (**{|
    The date and time that the agreement was accepted.|}*)

  agreement_id: string option;
   (**{|
    The unique identifier of the agreement.|}*)

}

type search_agreements_output = {
  next_token: string option;
   (**{|
    The token used for pagination. The field is [null] if there are no more
    results.|}*)

  agreement_view_summaries: agreement_view_summary list option;
   (**{|
    A summary of the agreement, including top-level attributes (for example,
    the agreement ID, version, proposer, and acceptor).|}*)

}

(**{|
    The filter name and value pair that is used to return a more specific
    list of results. Filters can be used to match a set of resources by
    various criteria, such as [offerId] or [productId].|}*)
type filter = {
  values: string list option;
   (**{|
    The filter value.|}*)

  name: string option;
   (**{|
    The name of the filter.|}*)

}

type search_agreements_input = {
  next_token: string option;
   (**{|
    A token to specify where to start pagination.|}*)

  max_results: int option;
   (**{|
    The maximum number of agreements to return in the response.|}*)

  sort: sort option;
   (**{|
    An object that contains the [SortBy] and [SortOrder] attributes.|}*)

  filters: filter list option;
   (**{|
    The filter name and value pair used to return a specific list of results.
    
    The following filters are supported:
    
    {ol 
          {- [ResourceIdentifier] – The unique identifier of the resource.
             }
          
          {- [ResourceType] – Type of the resource, which is the product
             ([AmiProduct], [ContainerProduct], or [SaaSProduct]).
             }
          
          {- [PartyType] – The party type (either [Acceptor] or [Proposer])
             of the caller. For agreements where the caller is the proposer,
             use the [Proposer] filter. For agreements where the caller is
             the acceptor, use the [Acceptor] filter.
             }
          
          {- [AcceptorAccountId] – The AWS account ID of the party
             accepting the agreement terms.
             }
          
          {- [OfferId] – The unique identifier of the offer in which the
             terms are registered in the agreement token.
             }
          
          {- [Status] – The current status of the agreement. Values include
             [ACTIVE], [ARCHIVED], [CANCELLED], [EXPIRED], [RENEWED],
             [REPLACED], and [TERMINATED].
             }
          
          {- [BeforeEndTime] – A date used to filter agreements with a date
             before the [endTime] of an agreement.
             }
          
          {- [AfterEndTime] – A date used to filter agreements with a date
             after the [endTime] of an agreement.
             }
          
          {- [AgreementType] – The type of agreement. Values include
             [PurchaseAgreement] or [VendorInsightsAgreement].
             }
          
    }
    |}*)

  catalog: string option;
   (**{|
    The catalog in which the agreement was created.|}*)

}

(**{|
    Unexpected error during processing of request.|}*)
type internal_server_exception = {
  message: string option;
  
  request_id: string option;
   (**{|
    The unique identifier for the error.|}*)

}

(**{|
    User does not have sufficient access to perform this action.|}*)
type access_denied_exception = {
  message: string option;
  
  request_id: string option;
   (**{|
    The unique identifier for the error.|}*)

}

(**{|
    An individual installment of the payment that includes the date and
    amount of the charge.|}*)
type schedule_item = {
  charge_amount: string option;
   (**{|
    The price that the customer would pay on the scheduled date (chargeDate).|}*)

  charge_date: float option;
   (**{|
    The date that the customer would pay the price defined in this payment
    schedule term. Invoices are generated on the date provided.|}*)

}

type resource_type = | AGREEMENT

(**{|
    Request references a resource which does not exist.|}*)
type resource_not_found_exception = {
  resource_type: resource_type option;
   (**{|
    The type of resource.|}*)

  resource_id: string option;
   (**{|
    The unique identifier for the resource.|}*)

  message: string option;
  
  request_id: string option;
   (**{|
    The unique identifier for the error.|}*)

}

(**{|
    Additional parameters specified by the acceptor while accepting the term.|}*)
type renewal_term_configuration = {
  enable_auto_renew: bool;
   (**{|
    Defines whether the acceptor has chosen to auto-renew the agreement at
    the end of its lifecycle. Can be set to [True] or [False].|}*)

}

(**{|
    Defines that on graceful expiration of the agreement (when the agreement
    ends on its pre-defined end date), a new agreement will be created using
    the accepted terms on the existing agreement. In other words, the
    agreement will be renewed. The presence of [RenewalTerm] in the offer
    document means that auto-renewal is allowed. Buyers will have the option
    to accept or decline auto-renewal at the offer acceptance/agreement
    creation. Buyers can also change this flag from [True] to [False] or
    [False] to [True] at anytime during the agreement's lifecycle.|}*)
type renewal_term = {
  configuration: renewal_term_configuration option;
   (**{|
    Additional parameters specified by the acceptor while accepting the term.|}*)

  type_: string option;
   (**{|
    Category of the term being updated.|}*)

}

(**{|
    Defines a pricing model where customers are charged a fixed recurring
    price at the end of each billing period.|}*)
type recurring_payment_term = {
  price: string option;
   (**{|
    Amount charged to the buyer every billing period.|}*)

  billing_period: string option;
   (**{|
    Defines the recurrence at which buyers are charged.|}*)

  currency_code: string option;
   (**{|
    Defines the currency for the prices mentioned in this term.|}*)

  type_: string option;
   (**{|
    Type of the term being updated.|}*)

}

(**{|
    Defines an installment-based pricing model where customers are charged a
    fixed price on different dates during the agreement validity period. This
    is used most commonly for flexible payment schedule pricing.|}*)
type payment_schedule_term = {
  schedule: schedule_item list option;
   (**{|
    List of the payment schedule where each element defines one installment
    of payment. It contains the information necessary for calculating the
    price.|}*)

  currency_code: string option;
   (**{|
    Defines the currency for the prices mentioned in the term.|}*)

  type_: string option;
   (**{|
    Type of the term.|}*)

}

(**{|
    Includes the list of references to legal resources proposed by the
    proposer to the acceptor. Each [DocumentItem] refers to an individual
    reference.|}*)
type document_item = {
  version: string option;
   (**{|
    Version of standard contracts provided by AWS Marketplace. Required when
    Type is [StandardEula] or [StandardDsa].|}*)

  url: string option;
   (**{|
    A URL to the legal document for buyers to read. Required when [Type] is
    [CustomEula].|}*)

  type_: string option;
   (**{|
    Category of the document. Document types include:
    
    {ol 
          {- [CustomEula] – A custom EULA provided by you as seller. A URL
             for a EULA stored in an accessible Amazon S3 bucket is required
             for this document type.
             }
          
          {- [CustomDsa] – A custom Data Subscription Agreement (DSA)
             provided by you as seller. A URL for a DSA stored in an
             accessible Amazon S3 bucket is required for this document type.
             }
          
          {- [StandardEula] – The Standard Contract for AWS Marketplace
             (SCMP). For more information about SCMP, see the AWS Marketplace
             Seller Guide. You don’t provide a URL for this type because
             it’s managed by AWS Marketplace.
             }
          
          {- [StandardDsa] – DSA for AWS Marketplace. For more information
             about the DSA, see the AWS Data Exchange User Guide. You don’t
             provide a URL for this type because it’s managed by AWS
             Marketplace.
             }
          
    }
    |}*)

}

(**{|
    Defines the list of text agreements proposed to the acceptors. An example
    is the end user license agreement (EULA).|}*)
type legal_term = {
  documents: document_item list option;
   (**{|
    List of references to legal resources proposed to the buyers. An example
    is the EULA.|}*)

  type_: string option;
   (**{|
    Category of the term being updated.|}*)

}

(**{|
    Entitlements granted to the acceptor of fixed upfront as part of
    agreement execution.|}*)
type grant_item = {
  max_quantity: int option;
   (**{|
    Maximum amount of capacity that the buyer can be entitled to the given
    dimension of the product. If [MaxQuantity] is not provided, the buyer
    will be able to use an unlimited amount of the given dimension.|}*)

  dimension_key: string option;
   (**{|
    Unique dimension key defined in the product document. Dimensions
    represent categories of capacity in a product and are specified when the
    product is listed in AWS Marketplace.|}*)

}

(**{|
    Defines limits on how the term can be configured by acceptors.|}*)
type constraints = {
  quantity_configuration: string option;
   (**{|
    Determines if acceptors are allowed to configure quantity for each
    dimension in rate card. The possible values are [Allowed] and
    [Disallowed]. The default value is [Allowed].|}*)

  multiple_dimension_selection: string option;
   (**{|
    Determines if buyers are allowed to select multiple dimensions in the
    rate card. The possible values are [Allowed] and [Disallowed]. The
    default value is [Allowed].|}*)

}

(**{|
    Within the prepaid payment model defined under
    [ConfigurableUpfrontPricingTerm], the [RateCardItem] defines all the
    various rate cards (including pricing and dimensions) that have been
    proposed.|}*)
type configurable_upfront_rate_card_item = {
  rate_card: rate_card_item list option;
   (**{|
    Defines the per unit rates for product dimensions.|}*)

  constraints: constraints option;
   (**{|
    Defines limits on how the term can be configured by acceptors.|}*)

  selector: selector option;
   (**{|
    Differentiates between the mutually exclusive rate cards in the same
    pricing term to be selected by the buyer.|}*)

}

(**{|
    Defines the dimensions that the acceptor has purchased from the overall
    set of dimensions presented in the rate card.|}*)
type dimension = {
  dimension_value: int;
   (**{|
    The number of units of the dimension the acceptor has purchased.
    
    For Agreements with [ConfigurableUpfrontPricingTerm], the [RateCard]
    section will define the prices and dimensions defined by the seller
    (proposer), whereas the [Configuration] section will define the actual
    dimensions, prices, and units the buyer has chosen to accept.
    |}*)

  dimension_key: string;
   (**{|
    The name of key value of the dimension.|}*)

}

(**{|
    Defines a prepaid payment model that allows buyers to configure the
    entitlements they want to purchase and the duration.|}*)
type configurable_upfront_pricing_term_configuration = {
  dimensions: dimension list;
   (**{|
    Defines the dimensions that the acceptor has purchased from the overall
    set of dimensions presented in the rate card.|}*)

  selector_value: string;
   (**{|
    Defines the length of time for which the particular pricing/dimension is
    being purchased by the acceptor.|}*)

}

(**{|
    Defines a prepaid payment model that allows buyers to configure the
    entitlements they want to purchase and the duration.|}*)
type configurable_upfront_pricing_term = {
  configuration: configurable_upfront_pricing_term_configuration option;
   (**{|
    Additional parameters specified by the acceptor while accepting the term.|}*)

  rate_cards: configurable_upfront_rate_card_item list option;
   (**{|
    A rate card defines the per unit rates for product dimensions.|}*)

  currency_code: string option;
   (**{|
    Defines the currency for the prices mentioned in the term.|}*)

  type_: string option;
   (**{|
    Category of selector.|}*)

}

(**{|
    Enables you and your customers to move your existing agreements to AWS
    Marketplace. The customer won't be charged for product usage in AWS
    Marketplace because they already paid for the product outside of AWS
    Marketplace.|}*)
type byol_pricing_term = {
  type_: string option;
   (**{|
    Type of the term being updated.|}*)

}

(**{|
    Defines a short-term free pricing model where the buyers aren’t charged
    anything within a specified limit.|}*)
type free_trial_pricing_term = {
  grants: grant_item list option;
   (**{|
    Entitlements granted to the acceptor of a free trial as part of an
    agreement execution.|}*)

  duration: string option;
   (**{|
    Duration of the free trial period (5–31 days).|}*)

  type_: string option;
   (**{|
    Category of the term.|}*)

}

(**{|
    Defines a prepaid pricing model where the customers are charged a fixed
    upfront amount.|}*)
type fixed_upfront_pricing_term = {
  grants: grant_item list option;
   (**{|
    Entitlements granted to the acceptor of fixed upfront as part of
    agreement execution.|}*)

  price: string option;
   (**{|
    Fixed amount to be charged to the customer when this term is accepted.|}*)

  duration: string option;
   (**{|
    Contract duration for the terms.|}*)

  currency_code: string option;
   (**{|
    Defines the currency for the prices mentioned in this term.|}*)

  type_: string option;
   (**{|
    Category of the term being updated.|}*)

}

(**{|
    A subset of terms proposed by the proposer, which have been accepted by
    the acceptor as part of agreement creation.|}*)
type accepted_term = FixedUpfrontPricingTerm of fixed_upfront_pricing_term | FreeTrialPricingTerm of free_trial_pricing_term | PaymentScheduleTerm of payment_schedule_term | ValidityTerm of validity_term | RecurringPaymentTerm of recurring_payment_term | ByolPricingTerm of byol_pricing_term | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term | UsageBasedPricingTerm of usage_based_pricing_term | RenewalTerm of renewal_term | SupportTerm of support_term | LegalTerm of legal_term

type get_agreement_terms_output = {
  next_token: string option;
   (**{|
    A token to specify where to start pagination|}*)

  accepted_terms: accepted_term list option;
   (**{|
    A subset of terms proposed by the proposer that have been accepted by the
    acceptor as part of the agreement creation.|}*)

}

type get_agreement_terms_input = {
  next_token: string option;
   (**{|
    A token to specify where to start pagination|}*)

  max_results: int option;
   (**{|
    The maximum number of agreements to return in the response.|}*)

  agreement_id: string;
   (**{|
    The unique identifier of the agreement.|}*)

}

(**{|
    Estimated cost of the agreement.|}*)
type estimated_charges = {
  agreement_value: string option;
   (**{|
    The total known amount customer has to pay across the lifecycle of the
    agreement.
    
    This is the total contract value if accepted terms contain
    [ConfigurableUpfrontPricingTerm] or [FixedUpfrontPricingTerm]. In the
    case of pure contract pricing, this will be the total value of the
    contract. In the case of contracts with consumption pricing, this will
    only include the committed value and not include any overages that occur.
    
    If the accepted terms contain [PaymentScheduleTerm], it will be the total
    payment schedule amount. This occurs when flexible payment schedule is
    used, and is the sum of all invoice charges in the payment schedule.
    
    In case a customer has amended an agreement, by purchasing more units of
    any dimension, this will include both the original cost as well as the
    added cost incurred due to addition of new units.
    
    This is [0] if the accepted terms contain [UsageBasedPricingTerm] without
    [ConfigurableUpfrontPricingTerm] or [RecurringPaymentTerm]. This occurs
    for usage-based pricing (such as SaaS metered or AMI/container hourly or
    monthly), because the exact usage is not known upfront.
    |}*)

  currency_code: string option;
   (**{|
    Defines the currency code for the charge.|}*)

}

type describe_agreement_output = {
  status: agreement_status option;
   (**{|
    The current status of the agreement.
    
    Statuses include:
    
    {ol 
          {- [ACTIVE] – The terms of the agreement are active.
             }
          
          {- [ARCHIVED] – The agreement ended without a specified reason.
             }
          
          {- [CANCELLED] – The acceptor ended the agreement before the
             defined end date.
             }
          
          {- [EXPIRED] – The agreement ended on the defined end date.
             }
          
          {- [RENEWED] – The agreement was renewed into a new agreement
             (for example, an auto-renewal).
             }
          
          {- [REPLACED] – The agreement was replaced using an agreement
             replacement offer.
             }
          
          {- [ROLLED_BACK] (Only applicable to inactive agreement revisions)
             – The agreement revision has been rolled back because of an
             error. An earlier revision is now active.
             }
          
          {- [SUPERCEDED] (Only applicable to inactive agreement revisions)
             – The agreement revision is no longer active and another
             agreement revision is now active.
             }
          
          {- [TERMINATED] – The agreement ended before the defined end date
             because of an AWS termination (for example, a payment failure).
             }
          
    }
    |}*)

  proposal_summary: proposal_summary option;
   (**{|
    A summary of the proposal received from the proposer.|}*)

  estimated_charges: estimated_charges option;
   (**{|
    The estimated cost of the agreement.|}*)

  agreement_type: string option;
   (**{|
    The type of agreement. Values are [PurchaseAgreement] or
    [VendorInsightsAgreement].|}*)

  acceptance_time: float option;
   (**{|
    The date and time the offer was accepted or the agreement was created.
    
    [AcceptanceTime] and [StartTime] can differ for future dated agreements
    (FDAs).
    |}*)

  end_time: float option;
   (**{|
    The date and time when the agreement ends. The field is [null] for
    pay-as-you-go agreements, which don’t have end dates.|}*)

  start_time: float option;
   (**{|
    The date and time when the agreement starts.|}*)

  proposer: proposer option;
   (**{|
    The details of the party proposing the agreement terms. This is commonly
    the seller for [PurchaseAgreement].|}*)

  acceptor: acceptor option;
   (**{|
    The details of the party accepting the agreement terms. This is commonly
    the buyer for [PurchaseAgreement].|}*)

  agreement_id: string option;
   (**{|
    The unique identifier of the agreement.|}*)

}

type describe_agreement_input = {
  agreement_id: string;
   (**{|
    The unique identifier of the agreement.|}*)

}

(**{|
    AWS Marketplace is a curated digital catalog that customers can use to
    find, buy, deploy, and manage third-party software, data, and services to
    build solutions and run their businesses. The AWS Marketplace Agreement
    Service provides an API interface that helps AWS Marketplace sellers
    manage their product-related agreements, including listing, searching,
    and filtering agreements.
    
    To manage agreements in AWS Marketplace, you must ensure that your AWS
    Identity and Access Management (IAM) policies and roles are set up. The
    user must have the required policies/permissions that allow them to carry
    out the actions in AWS:
    
    {ol 
          {- [DescribeAgreement] – Grants permission to users to obtain
             detailed meta data about any of their agreements.
             }
          
          {- [GetAgreementTerms] – Grants permission to users to obtain
             details about the terms of an agreement.
             }
          
          {- [SearchAgreements] – Grants permission to users to search
             through all their agreements.
             }
          
    }
    |}*)


type base_document = Json.t

(** {1:builders Builders} *)

val make_validity_term :
  ?agreement_end_date:float ->
  ?agreement_start_date:float ->
  ?agreement_duration:string ->
  ?type_:string ->
  unit -> validity_term

val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field

val make_rate_card_item : ?price:string -> ?dimension_key:string -> unit
-> rate_card_item

val make_usage_based_rate_card_item : ?rate_card:rate_card_item list -> unit
-> usage_based_rate_card_item

val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> usage_based_pricing_term

val make_support_term : ?refund_policy:string -> ?type_:string -> unit
-> support_term

val make_sort : ?sort_order:sort_order -> ?sort_by:string -> unit
-> sort

val make_selector : ?value:string -> ?type_:string -> unit
-> selector

val make_acceptor : ?account_id:string -> unit -> acceptor

val make_proposer : ?account_id:string -> unit -> proposer

val make_resource : ?type_:string -> ?id:string -> unit
-> resource

val make_proposal_summary :
  ?offer_id:string -> ?resources:resource list -> unit
-> proposal_summary

val make_agreement_view_summary :
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_type:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?acceptance_time:float ->
  ?agreement_id:string ->
  unit -> agreement_view_summary

val make_search_agreements_output :
  ?next_token:string ->
  ?agreement_view_summaries:agreement_view_summary list ->
  unit -> search_agreements_output

val make_filter : ?values:string list -> ?name:string -> unit
-> filter

val make_search_agreements_input :
  ?next_token:string ->
  ?max_results:int ->
  ?sort:sort ->
  ?filters:filter list ->
  ?catalog:string ->
  unit -> search_agreements_input

val make_schedule_item : ?charge_amount:string -> ?charge_date:float -> unit
-> schedule_item

val make_renewal_term_configuration : enable_auto_renew:bool -> unit
-> renewal_term_configuration

val make_renewal_term :
  ?configuration:renewal_term_configuration -> ?type_:string -> unit
-> renewal_term

val make_recurring_payment_term :
  ?price:string ->
  ?billing_period:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> recurring_payment_term

val make_payment_schedule_term :
  ?schedule:schedule_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> payment_schedule_term

val make_document_item :
  ?version:string -> ?url:string -> ?type_:string -> unit
-> document_item

val make_legal_term : ?documents:document_item list -> ?type_:string -> unit
-> legal_term

val make_grant_item : ?max_quantity:int -> ?dimension_key:string -> unit
-> grant_item

val make_constraints :
  ?quantity_configuration:string ->
  ?multiple_dimension_selection:string ->
  unit -> constraints

val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_item list ->
  ?constraints:constraints ->
  ?selector:selector ->
  unit -> configurable_upfront_rate_card_item

val make_dimension : dimension_value:int -> dimension_key:string -> unit
-> dimension

val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension list -> selector_value:string -> unit
-> configurable_upfront_pricing_term_configuration

val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
  ?rate_cards:configurable_upfront_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> configurable_upfront_pricing_term

val make_byol_pricing_term : ?type_:string -> unit
-> byol_pricing_term

val make_free_trial_pricing_term :
  ?grants:grant_item list -> ?duration:string -> ?type_:string -> unit
-> free_trial_pricing_term

val make_fixed_upfront_pricing_term :
  ?grants:grant_item list ->
  ?price:string ->
  ?duration:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> fixed_upfront_pricing_term

val make_get_agreement_terms_output :
  ?next_token:string -> ?accepted_terms:accepted_term list -> unit
-> get_agreement_terms_output

val make_get_agreement_terms_input :
  ?next_token:string -> ?max_results:int -> agreement_id:string -> unit
-> get_agreement_terms_input

val make_estimated_charges :
  ?agreement_value:string -> ?currency_code:string -> unit
-> estimated_charges

val make_describe_agreement_output :
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?estimated_charges:estimated_charges ->
  ?agreement_type:string ->
  ?acceptance_time:float ->
  ?end_time:float ->
  ?start_time:float ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_id:string ->
  unit -> describe_agreement_output

val make_describe_agreement_input : agreement_id:string -> unit
-> describe_agreement_input

(** {1:operations Operations} *)

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
end

