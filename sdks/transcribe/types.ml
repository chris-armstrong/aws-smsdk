open Smaws_Lib
let service =
  Service.{
    namespace = "transcribe";
    endpointPrefix = "transcribe";
    version = "2017-10-26";
    protocol = AwsJson_1_1
  };

type vocabulary_state = | FAILED
  | READY
  | PENDING

type language_code = | ZU_ZA
  | WO_SN
  | UZ_UZ
  | UK_UA
  | UG_CN
  | TT_RU
  | TL_PH
  | SW_UG
  | SW_TZ
  | SW_RW
  | SW_KE
  | SW_BI
  | SU_ID
  | SR_RS
  | SO_SO
  | SL_SI
  | SK_SK
  | SI_LK
  | RW_RW
  | RO_RO
  | PS_AF
  | PL_PL
  | PA_IN
  | OR_IN
  | NO_NO
  | MT_MT
  | MR_IN
  | MN_MN
  | ML_IN
  | MK_MK
  | MI_NZ
  | MHR_RU
  | LV_LV
  | LT_LT
  | LG_IN
  | KY_KG
  | KN_IN
  | KK_KZ
  | KAB_DZ
  | KA_GE
  | IS_IS
  | HY_AM
  | HU_HU
  | HR_HR
  | HA_NG
  | GU_IN
  | GL_ES
  | FI_FI
  | EU_ES
  | ET_ET
  | EL_GR
  | CY_WL
  | CS_CZ
  | CKB_IR
  | CKB_IQ
  | CA_ES
  | BS_BA
  | BN_IN
  | BG_BG
  | BE_BY
  | BA_RU
  | AZ_AZ
  | AST_ES
  | AB_GE
  | SV_SE
  | VI_VN
  | EN_NZ
  | EN_ZA
  | TH_TH
  | ZH_TW
  | ZH_CN
  | TR_TR
  | TE_IN
  | TA_IN
  | RU_RU
  | PT_PT
  | PT_BR
  | NL_NL
  | MS_MY
  | KO_KR
  | JA_JP
  | IT_IT
  | ID_ID
  | HI_IN
  | HE_IL
  | FR_FR
  | FR_CA
  | FA_IR
  | ES_US
  | ES_ES
  | EN_WL
  | EN_US
  | EN_IN
  | EN_IE
  | EN_GB
  | EN_AU
  | EN_AB
  | DE_DE
  | DE_CH
  | DA_DK
  | AR_SA
  | AR_AE
  | AF_ZA

(**{|
    Provides information about a custom vocabulary, including the language of
    the custom vocabulary, when it was last modified, its name, and the
    processing state.|}*)
type vocabulary_info = {
  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom vocabulary. If the state is [READY],
    you can use the custom vocabulary in a [StartTranscriptionJob] request.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary was last modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your custom vocabulary. Each custom
    vocabulary must contain terms in only one language.
    
    A custom vocabulary can only be used to transcribe files in the same
    language as the custom vocabulary. For example, if you create a custom
    vocabulary using US English ([en-US]), you can only apply this custom
    vocabulary to files that contain English audio.|}*)

  vocabulary_name: string option;
   (**{|
    A unique name, chosen by you, for your custom vocabulary. This name is
    case sensitive, cannot contain spaces, and must be unique within an
    Amazon Web Services account.|}*)

}

(**{|
    Provides information about a custom vocabulary filter, including the
    language of the filter, when it was last modified, and its name.|}*)
type vocabulary_filter_info = {
  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary filter was last
    modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code that represents the language of the entries in your
    vocabulary filter. Each custom vocabulary filter must contain terms in
    only one language.
    
    A custom vocabulary filter can only be used to transcribe files in the
    same language as the filter. For example, if you create a custom
    vocabulary filter using US English ([en-US]), you can only apply this
    filter to files that contain English audio.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.|}*)

  vocabulary_filter_name: string option;
   (**{|
    A unique name, chosen by you, for your custom vocabulary filter. This
    name is case sensitive, cannot contain spaces, and must be unique within
    an Amazon Web Services account.|}*)

}

type vocabulary_filter_method = | TAG
  | MASK
  | REMOVE

type update_vocabulary_response = {
  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom vocabulary. If the state is [READY],
    you can use the custom vocabulary in a [StartTranscriptionJob] request.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary was last updated.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary.|}*)

  vocabulary_name: string option;
   (**{|
    The name of the updated custom vocabulary.|}*)

}

type update_vocabulary_request = {
  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files (in this case,
    your custom vocabulary). If the role that you specify doesn’t have the
    appropriate permissions to access the specified Amazon S3 location, your
    request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  vocabulary_file_uri: string option;
   (**{|
    The Amazon S3 location of the text file that contains your custom
    vocabulary. The URI must be located in the same Amazon Web Services
    Region as the resource you're calling.
    
    Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt]
    
    Note that if you include [VocabularyFileUri] in your request, you cannot
    use the [Phrases] flag; you must choose one or the other.|}*)

  phrases: string list option;
   (**{|
    Use this parameter if you want to update your custom vocabulary by
    including all desired terms, as comma-separated values, within your
    request. The other option for updating your custom vocabulary is to save
    your entries in a text file and upload them to an Amazon S3 bucket, then
    specify the location of your file using the [VocabularyFileUri]
    parameter.
    
    Note that if you include [Phrases] in your request, you cannot use
    [VocabularyFileUri]; you must choose one or the other.
    
    Each language has a character set that contains all allowed characters
    for that specific language. If you use unsupported characters, your
    custom vocabulary filter request fails. Refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html }Character
    Sets for Custom Vocabularies} to get the character set for your language.|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language of the entries in the
    custom vocabulary you want to update. Each custom vocabulary must contain
    terms in only one language.
    
    A custom vocabulary can only be used to transcribe files in the same
    language as the custom vocabulary. For example, if you create a custom
    vocabulary using US English ([en-US]), you can only apply this custom
    vocabulary to files that contain English audio.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.|}*)

  vocabulary_name: string;
   (**{|
    The name of the custom vocabulary you want to update. Custom vocabulary
    names are case sensitive.|}*)

}

type update_vocabulary_filter_response = {
  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary filter was last updated.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary filter.|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the updated custom vocabulary filter.|}*)

}

type update_vocabulary_filter_request = {
  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files (in this case,
    your custom vocabulary filter). If the role that you specify doesn’t
    have the appropriate permissions to access the specified Amazon S3
    location, your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  vocabulary_filter_file_uri: string option;
   (**{|
    The Amazon S3 location of the text file that contains your custom
    vocabulary filter terms. The URI must be located in the same Amazon Web
    Services Region as the resource you're calling.
    
    Here's an example URI path:
    [s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt]
    
    Note that if you include [VocabularyFilterFileUri] in your request, you
    cannot use [Words]; you must choose one or the other.|}*)

  words: string list option;
   (**{|
    Use this parameter if you want to update your custom vocabulary filter by
    including all desired terms, as comma-separated values, within your
    request. The other option for updating your vocabulary filter is to save
    your entries in a text file and upload them to an Amazon S3 bucket, then
    specify the location of your file using the [VocabularyFilterFileUri]
    parameter.
    
    Note that if you include [Words] in your request, you cannot use
    [VocabularyFilterFileUri]; you must choose one or the other.
    
    Each language has a character set that contains all allowed characters
    for that specific language. If you use unsupported characters, your
    custom vocabulary filter request fails. Refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html }Character
    Sets for Custom Vocabularies} to get the character set for your language.|}*)

  vocabulary_filter_name: string;
   (**{|
    The name of the custom vocabulary filter you want to update. Custom
    vocabulary filter names are case sensitive.|}*)

}

(**{|
    We can't find the requested resource. Check that the specified name is
    correct and try your request again.|}*)
type not_found_exception = {
  message: string option;
  
}

(**{|
    You've either sent too many requests or your input file is too long. Wait
    before retrying your request, or use a smaller file and try your request
    again.|}*)
type limit_exceeded_exception = {
  message: string option;
  
}

(**{|
    There was an internal error. Check the error message, correct the issue,
    and try your request again.|}*)
type internal_failure_exception = {
  message: string option;
  
}

(**{|
    Your request didn't pass one or more validation tests. This can occur
    when the entity you're trying to delete doesn't exist or if it's in a
    non-terminal state (such as [IN PROGRESS]). See the exception message
    field for more information.|}*)
type bad_request_exception = {
  message: string option;
  
}

(**{|
    A resource already exists with this name. Resource names must be unique
    within an Amazon Web Services account.|}*)
type conflict_exception = {
  message: string option;
  
}

type update_medical_vocabulary_response = {
  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom medical vocabulary. If the state is
    [READY], you can use the custom vocabulary in a
    [StartMedicalTranscriptionJob] request.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom medical vocabulary was last
    updated.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom medical vocabulary. US
    English ([en-US]) is the only language supported with Amazon Transcribe
    Medical.|}*)

  vocabulary_name: string option;
   (**{|
    The name of the updated custom medical vocabulary.|}*)

}

type update_medical_vocabulary_request = {
  vocabulary_file_uri: string;
   (**{|
    The Amazon S3 location of the text file that contains your custom medical
    vocabulary. The URI must be located in the same Amazon Web Services
    Region as the resource you're calling.
    
    Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt]|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language of the entries in the
    custom vocabulary you want to update. US English ([en-US]) is the only
    language supported with Amazon Transcribe Medical.|}*)

  vocabulary_name: string;
   (**{|
    The name of the custom medical vocabulary you want to update. Custom
    medical vocabulary names are case sensitive.|}*)

}

(**{|
    A time range, in milliseconds, between two points in your media file.
    
    You can use [StartTime] and [EndTime] to search a custom segment. For
    example, setting [StartTime] to 10000 and [EndTime] to 50000 only
    searches for your specified criteria in the audio contained between the
    10,000 millisecond mark and the 50,000 millisecond mark of your media
    file. You must use [StartTime] and [EndTime] as a set; that is, if you
    include one, you must include both.
    
    You can use also [First] to search from the start of the audio until the
    time that you specify, or [Last] to search from the time that you specify
    until the end of the audio. For example, setting [First] to 50000 only
    searches for your specified criteria in the audio contained between the
    start of the media file to the 50,000 millisecond mark. You can use
    [First] and [Last] independently of each other.
    
    If you prefer to use percentage instead of milliseconds, see .|}*)
type absolute_time_range = {
  last: int option;
   (**{|
    The time, in milliseconds, from the specified value until the end of your
    media file. Amazon Transcribe searches for your specified criteria in
    this time segment.|}*)

  first: int option;
   (**{|
    The time, in milliseconds, from the start of your media file until the
    specified value. Amazon Transcribe searches for your specified criteria
    in this time segment.|}*)

  end_time: int option;
   (**{|
    The time, in milliseconds, when Amazon Transcribe stops searching for the
    specified criteria in your audio. If you include [EndTime] in your
    request, you must also include [StartTime].|}*)

  start_time: int option;
   (**{|
    The time, in milliseconds, when Amazon Transcribe starts searching for
    the specified criteria in your audio. If you include [StartTime] in your
    request, you must also include [EndTime].|}*)

}

(**{|
    A time range, in percentage, between two points in your media file.
    
    You can use [StartPercentage] and [EndPercentage] to search a custom
    segment. For example, setting [StartPercentage] to 10 and [EndPercentage]
    to 50 only searches for your specified criteria in the audio contained
    between the 10 percent mark and the 50 percent mark of your media file.
    
    You can use also [First] to search from the start of the media file until
    the time that you specify. Or use [Last] to search from the time that you
    specify until the end of the media file. For example, setting [First] to
    10 only searches for your specified criteria in the audio contained in
    the first 10 percent of the media file.
    
    If you prefer to use milliseconds instead of percentage, see .|}*)
type relative_time_range = {
  last: int option;
   (**{|
    The time, in percentage, from the specified value until the end of your
    media file. Amazon Transcribe searches for your specified criteria in
    this time segment.|}*)

  first: int option;
   (**{|
    The time, in percentage, from the start of your media file until the
    specified value. Amazon Transcribe searches for your specified criteria
    in this time segment.|}*)

  end_percentage: int option;
   (**{|
    The time, in percentage, when Amazon Transcribe stops searching for the
    specified criteria in your media file. If you include [EndPercentage] in
    your request, you must also include [StartPercentage].|}*)

  start_percentage: int option;
   (**{|
    The time, in percentage, when Amazon Transcribe starts searching for the
    specified criteria in your media file. If you include [StartPercentage]
    in your request, you must also include [EndPercentage].|}*)

}

(**{|
    Flag the presence or absence of periods of silence in your Call Analytics
    transcription output.
    
    Rules using [NonTalkTimeFilter] are designed to match:
    
    {ol 
          {- The presence of silence at specified periods throughout the call
             }
          
          {- The presence of speech at specified periods throughout the call
             }
          
    }
    
    See
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch }Rule
    criteria for post-call categories} for usage examples.|}*)
type non_talk_time_filter = {
  negate: bool option;
   (**{|
    Set to [TRUE] to flag periods of speech. Set to [FALSE] to flag periods
    of silence|}*)

  relative_time_range: relative_time_range option;
   (**{|
    Makes it possible to specify a time range (in percentage) in your media
    file, during which you want to search for a period of silence. See for
    more detail.|}*)

  absolute_time_range: absolute_time_range option;
   (**{|
    Makes it possible to specify a time range (in milliseconds) in your
    audio, during which you want to search for a period of silence. See for
    more detail.|}*)

  threshold: int option;
   (**{|
    Specify the duration, in milliseconds, of the period of silence that you
    want to flag. For example, you can flag a silent period that lasts 30,000
    milliseconds.|}*)

}

type participant_role = | CUSTOMER
  | AGENT

(**{|
    Flag the presence or absence of interruptions in your Call Analytics
    transcription output.
    
    Rules using [InterruptionFilter] are designed to match:
    
    {ol 
          {- Instances where an agent interrupts a customer
             }
          
          {- Instances where a customer interrupts an agent
             }
          
          {- Either participant interrupting the other
             }
          
          {- A lack of interruptions
             }
          
    }
    
    See
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch }Rule
    criteria for post-call categories} for usage examples.|}*)
type interruption_filter = {
  negate: bool option;
   (**{|
    Set to [TRUE] to flag speech that does not contain interruptions. Set to
    [FALSE] to flag speech that contains interruptions.|}*)

  relative_time_range: relative_time_range option;
   (**{|
    Makes it possible to specify a time range (in percentage) in your media
    file, during which you want to search for an interruption. See for more
    detail.|}*)

  absolute_time_range: absolute_time_range option;
   (**{|
    Makes it possible to specify a time range (in milliseconds) in your
    audio, during which you want to search for an interruption. See for more
    detail.|}*)

  participant_role: participant_role option;
   (**{|
    Specify the interrupter that you want to flag. Omitting this parameter is
    equivalent to specifying both participants.|}*)

  threshold: int option;
   (**{|
    Specify the duration of the interruptions in milliseconds. For example,
    you can flag speech that contains more than 10,000 milliseconds of
    interruptions.|}*)

}

type transcript_filter_type = | EXACT

(**{|
    Flag the presence or absence of specific words or phrases detected in
    your Call Analytics transcription output.
    
    Rules using [TranscriptFilter] are designed to match:
    
    {ol 
          {- Custom words or phrases spoken by the agent, the customer, or
             both
             }
          
          {- Custom words or phrases {b not} spoken by the agent, the
             customer, or either
             }
          
          {- Custom words or phrases that occur at a specific time frame
             }
          
    }
    
    See
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch }Rule
    criteria for post-call categories} and
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html#tca-rules-stream }Rule
    criteria for streaming categories} for usage examples.|}*)
type transcript_filter = {
  targets: string list;
   (**{|
    Specify the phrases that you want to flag.|}*)

  negate: bool option;
   (**{|
    Set to [TRUE] to flag the absence of the phrase that you specified in
    your request. Set to [FALSE] to flag the presence of the phrase that you
    specified in your request.|}*)

  participant_role: participant_role option;
   (**{|
    Specify the participant that you want to flag. Omitting this parameter is
    equivalent to specifying both participants.|}*)

  relative_time_range: relative_time_range option;
   (**{|
    Makes it possible to specify a time range (in percentage) in your media
    file, during which you want to search for the specified key words or
    phrases. See for more detail.|}*)

  absolute_time_range: absolute_time_range option;
   (**{|
    Makes it possible to specify a time range (in milliseconds) in your
    audio, during which you want to search for the specified key words or
    phrases. See for more detail.|}*)

  transcript_filter_type: transcript_filter_type;
   (**{|
    Flag the presence or absence of an exact match to the phrases that you
    specify. For example, if you specify the phrase "speak to a manager" as
    your [Targets] value, only that exact phrase is flagged.
    
    Note that semantic matching is not supported. For example, if your
    customer says "speak to {i the} manager", instead of "speak to {i a}
    manager", your content is not flagged.|}*)

}

type sentiment_value = | MIXED
  | NEUTRAL
  | NEGATIVE
  | POSITIVE

(**{|
    Flag the presence or absence of specific sentiments detected in your Call
    Analytics transcription output.
    
    Rules using [SentimentFilter] are designed to match:
    
    {ol 
          {- The presence or absence of a positive sentiment felt by the
             customer, agent, or both at specified points in the call
             }
          
          {- The presence or absence of a negative sentiment felt by the
             customer, agent, or both at specified points in the call
             }
          
          {- The presence or absence of a neutral sentiment felt by the
             customer, agent, or both at specified points in the call
             }
          
          {- The presence or absence of a mixed sentiment felt by the
             customer, the agent, or both at specified points in the call
             }
          
    }
    
    See
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch }Rule
    criteria for post-call categories} for usage examples.|}*)
type sentiment_filter = {
  negate: bool option;
   (**{|
    Set to [TRUE] to flag the sentiments that you didn't include in your
    request. Set to [FALSE] to flag the sentiments that you specified in your
    request.|}*)

  participant_role: participant_role option;
   (**{|
    Specify the participant that you want to flag. Omitting this parameter is
    equivalent to specifying both participants.|}*)

  relative_time_range: relative_time_range option;
   (**{|
    Makes it possible to specify a time range (in percentage) in your media
    file, during which you want to search for the specified sentiments. See
    for more detail.|}*)

  absolute_time_range: absolute_time_range option;
   (**{|
    Makes it possible to specify a time range (in milliseconds) in your
    audio, during which you want to search for the specified sentiments. See
    for more detail.|}*)

  sentiments: sentiment_value list;
   (**{|
    Specify the sentiments that you want to flag.|}*)

}

(**{|
    A rule is a set of criteria that you can specify to flag an attribute in
    your Call Analytics output. Rules define a Call Analytics category.
    
    Rules can include these parameters: , , , and .
    
    To learn more about Call Analytics rules and categories, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html }Creating
    categories for post-call transcriptions} and
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html }Creating
    categories for real-time transcriptions}.
    
    To learn more about Call Analytics, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html }Analyzing
    call center audio with Call Analytics}.|}*)
type rule = SentimentFilter of sentiment_filter | TranscriptFilter of transcript_filter | InterruptionFilter of interruption_filter | NonTalkTimeFilter of non_talk_time_filter

type input_type = | POST_CALL
  | REAL_TIME

(**{|
    Provides you with the properties of the Call Analytics category you
    specified in your request. This includes the list of rules that define
    the specified category.|}*)
type category_properties = {
  input_type: input_type option;
   (**{|
    The input type associated with the specified category. [POST_CALL] refers
    to a category that is applied to batch transcriptions; [REAL_TIME] refers
    to a category that is applied to streaming transcriptions.|}*)

  last_update_time: float option;
   (**{|
    The date and time the specified Call Analytics category was last updated.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-05T12:45:32.691000-07:00] represents 12:45 PM UTC-7 on
    May 5, 2022.|}*)

  create_time: float option;
   (**{|
    The date and time the specified Call Analytics category was created.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  rules: rule list option;
   (**{|
    The rules used to define a Call Analytics category. Each category can
    have between 1 and 20 rules.|}*)

  category_name: string option;
   (**{|
    The name of the Call Analytics category. Category names are case
    sensitive and must be unique within an Amazon Web Services account.|}*)

}

type update_call_analytics_category_response = {
  category_properties: category_properties option;
   (**{|
    Provides you with the properties of the Call Analytics category you
    specified in your [UpdateCallAnalyticsCategory] request.|}*)

}

type update_call_analytics_category_request = {
  input_type: input_type option;
   (**{|
    Choose whether you want to update a real-time or a post-call category.
    The input type you specify must match the input type specified when the
    category was created. For example, if you created a category with the
    [POST_CALL] input type, you must use [POST_CALL] as the input type when
    updating this category.|}*)

  rules: rule list;
   (**{|
    The rules used for the updated Call Analytics category. The rules you
    provide in this field replace the ones that are currently being used in
    the specified category.|}*)

  category_name: string;
   (**{|
    The name of the Call Analytics category you want to update. Category
    names are case sensitive.|}*)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    Removes the specified tag keys from the specified Amazon Transcribe
    resource.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want
    to remove tags from. ARNs have the format
    [arn:partition:service:region:account-id:resource-type/resource-id].
    
    For example,
    [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].
    
    
    Valid values for [resource-type] are: [transcription-job],
    [medical-transcription-job], [vocabulary], [medical-vocabulary],
    [vocabulary-filter], and [language-model].|}*)

}

type type_ = | DICTATION
  | CONVERSATION

type transcription_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type output_location_type = | SERVICE_BUCKET
  | CUSTOMER_BUCKET

type redaction_type = | PII

type redaction_output = | REDACTED_AND_UNREDACTED
  | REDACTED

type pii_entity_type = | ALL
  | SSN
  | PHONE
  | NAME
  | ADDRESS
  | EMAIL
  | PIN
  | CREDIT_DEBIT_EXPIRY
  | CREDIT_DEBIT_CVV
  | CREDIT_DEBIT_NUMBER
  | BANK_ROUTING
  | BANK_ACCOUNT_NUMBER

(**{|
    Makes it possible to redact or flag specified personally identifiable
    information (PII) in your transcript. If you use [ContentRedaction], you
    must also include the sub-parameters: [RedactionOutput] and
    [RedactionType]. You can optionally include [PiiEntityTypes] to choose
    which types of PII you want to redact.|}*)
type content_redaction = {
  pii_entity_types: pii_entity_type list option;
   (**{|
    Specify which types of personally identifiable information (PII) you want
    to redact in your transcript. You can include as many types as you'd
    like, or you can select [ALL]. If you do not include [PiiEntityTypes] in
    your request, all PII is redacted.|}*)

  redaction_output: redaction_output;
   (**{|
    Specify if you want only a redacted transcript, or if you want a redacted
    and an unredacted transcript.
    
    When you choose [redacted] Amazon Transcribe creates only a redacted
    transcript.
    
    When you choose [redacted_and_unredacted] Amazon Transcribe creates a
    redacted and an unredacted transcript (as two separate files).|}*)

  redaction_type: redaction_type;
   (**{|
    Specify the category of information you want to redact; [PII] (personally
    identifiable information) is the only valid value. You can use
    [PiiEntityTypes] to choose which types of PII you want to redact. If you
    do not include [PiiEntityTypes] in your request, all PII is redacted.|}*)

}

(**{|
    Provides the name of the custom language model that was included in the
    specified transcription job.
    
    Only use [ModelSettings] with the [LanguageModelName] sub-parameter if
    you're {b not} using automatic language identification ([]). If using
    [LanguageIdSettings] in your request, this parameter contains a
    [LanguageModelName] sub-parameter.|}*)
type model_settings = {
  language_model_name: string option;
   (**{|
    The name of the custom language model you want to use when processing
    your transcription job. Note that custom language model names are case
    sensitive.
    
    The language of the specified custom language model must match the
    language code that you specify in your transcription request. If the
    languages do not match, the custom language model isn't applied. There
    are no errors or warnings associated with a language mismatch.|}*)

}

(**{|
    Provides information on the speech contained in a discreet utterance when
    multi-language identification is enabled in your request. This utterance
    represents a block of speech consisting of one language, preceded or
    followed by a block of speech in a different language.|}*)
type language_code_item = {
  duration_in_seconds: float option;
   (**{|
    Provides the total time, in seconds, each identified language is spoken
    in your media.|}*)

  language_code: language_code option;
   (**{|
    Provides the language code for each language identified in your media.|}*)

}

type toxicity_category = | ALL

(**{|
    Contains [ToxicityCategories], which is a required parameter if you want
    to enable toxicity detection ([ToxicityDetection]) in your transcription
    request.|}*)
type toxicity_detection_settings = {
  toxicity_categories: toxicity_category list;
   (**{|
    If you include [ToxicityDetection] in your transcription request, you
    must also include [ToxicityCategories]. The only accepted value for this
    parameter is [ALL].|}*)

}

(**{|
    Provides detailed information about a specific transcription job.|}*)
type transcription_job_summary = {
  toxicity_detection: toxicity_detection_settings list option;
   (**{|
    Indicates whether toxicity detection was enabled for the specified
    transcription job.|}*)

  language_codes: language_code_item list option;
   (**{|
    The language codes used to create your transcription job. This parameter
    is used with multi-language identification. For single-language
    identification, the singular version of this parameter, [LanguageCode],
    is present.|}*)

  identified_language_score: float option;
   (**{|
    The confidence score associated with the language identified in your
    media file.
    
    Confidence scores are values between 0 and 1; a larger value indicates a
    higher probability that the identified language correctly matches the
    language spoken in your media.|}*)

  identify_multiple_languages: bool option;
   (**{|
    Indicates whether automatic multi-language identification was enabled
    ([TRUE]) for the specified transcription job.|}*)

  identify_language: bool option;
   (**{|
    Indicates whether automatic language identification was enabled ([TRUE])
    for the specified transcription job.|}*)

  model_settings: model_settings option;
  
  content_redaction: content_redaction option;
   (**{|
    The content redaction settings of the transcription job.|}*)

  output_location_type: output_location_type option;
   (**{|
    Indicates where the specified transcription output is stored.
    
    If the value is [CUSTOMER_BUCKET], the location is the Amazon S3 bucket
    you specified using the [OutputBucketName] parameter in your request. If
    you also included [OutputKey] in your request, your output is located in
    the path you specified in your request.
    
    If the value is [SERVICE_BUCKET], the location is a service-managed
    Amazon S3 bucket. To access a transcript stored in a service-managed
    bucket, use the URI shown in the [TranscriptFileUri] or
    [RedactedTranscriptFileUri] field.|}*)

  failure_reason: string option;
   (**{|
    If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  transcription_job_status: transcription_job_status option;
   (**{|
    Provides the status of your transcription job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri] (or
    [RedactedTranscriptFileUri], if you requested transcript redaction). If
    the status is [FAILED], [FailureReason] provides details on why your
    transcription job failed.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your transcription.|}*)

  completion_time: float option;
   (**{|
    The date and time the specified transcription job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time your transcription job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified transcription job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  transcription_job_name: string option;
   (**{|
    The name of the transcription job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type media_format = | M4A
  | WEBM
  | AMR
  | OGG
  | FLAC
  | WAV
  | MP4
  | MP3

(**{|
    Describes the Amazon S3 location of the media file you want to use in
    your request.
    
    For information on supported media formats, refer to the [MediaFormat]
    parameter or the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio }Media
    formats} section in the Amazon S3 Developer Guide.|}*)
type media = {
  redacted_media_file_uri: string option;
   (**{|
    The Amazon S3 location of the media file you want to redact. For example:
    
    {ol 
          {- [s3://DOC-EXAMPLE-BUCKET/my-media-file.flac]
             }
          
          {- [s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac]
             }
          
    }
    
    Note that the Amazon S3 bucket that contains your input media must be
    located in the same Amazon Web Services Region where you're making your
    transcription request.
    
    [RedactedMediaFileUri] produces a redacted audio file in addition to a
    redacted transcript. It is only supported for Call Analytics
    ([StartCallAnalyticsJob]) transcription requests.
    |}*)

  media_file_uri: string option;
   (**{|
    The Amazon S3 location of the media file you want to transcribe. For
    example:
    
    {ol 
          {- [s3://DOC-EXAMPLE-BUCKET/my-media-file.flac]
             }
          
          {- [s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac]
             }
          
    }
    
    Note that the Amazon S3 bucket that contains your input media must be
    located in the same Amazon Web Services Region where you're making your
    transcription request.|}*)

}

(**{|
    Provides you with the Amazon S3 URI you can use to access your transcript.|}*)
type transcript = {
  redacted_transcript_file_uri: string option;
   (**{|
    The Amazon S3 location of your redacted transcript. You can use this URI
    to access or download your transcript.
    
    If you included [OutputBucketName] in your transcription job request,
    this is the URI of that bucket. If you also included [OutputKey] in your
    request, your output is located in the path you specified in your
    request.
    
    If you didn't include [OutputBucketName] in your transcription job
    request, your transcript is stored in a service-managed bucket, and
    [RedactedTranscriptFileUri] provides you with a temporary URI you can use
    for secure access to your transcript.
    
    Temporary URIs for service-managed Amazon S3 buckets are only valid for
    15 minutes. If you get an [AccesDenied] error, you can get a new
    temporary URI by running a [GetTranscriptionJob] or
    [ListTranscriptionJob] request.
    |}*)

  transcript_file_uri: string option;
   (**{|
    The Amazon S3 location of your transcript. You can use this URI to access
    or download your transcript.
    
    If you included [OutputBucketName] in your transcription job request,
    this is the URI of that bucket. If you also included [OutputKey] in your
    request, your output is located in the path you specified in your
    request.
    
    If you didn't include [OutputBucketName] in your transcription job
    request, your transcript is stored in a service-managed bucket, and
    [TranscriptFileUri] provides you with a temporary URI you can use for
    secure access to your transcript.
    
    Temporary URIs for service-managed Amazon S3 buckets are only valid for
    15 minutes. If you get an [AccesDenied] error, you can get a new
    temporary URI by running a [GetTranscriptionJob] or
    [ListTranscriptionJob] request.
    |}*)

}

(**{|
    Allows additional optional settings in your request, including channel
    identification, alternative transcriptions, and speaker partitioning. You
    can use that to apply custom vocabularies to your transcription job.|}*)
type settings = {
  vocabulary_filter_method: vocabulary_filter_method option;
   (**{|
    Specify how you want your custom vocabulary filter applied to your
    transcript.
    
    To replace words with [***], choose [mask].
    
    To delete words, choose [remove].
    
    To flag words without changing them, choose [tag].|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the custom vocabulary filter you want to use in your
    transcription job request. This name is case sensitive, cannot contain
    spaces, and must be unique within an Amazon Web Services account.
    
    Note that if you include [VocabularyFilterName] in your request, you must
    also include [VocabularyFilterMethod].|}*)

  max_alternatives: int option;
   (**{|
    Indicate the maximum number of alternative transcriptions you want Amazon
    Transcribe to include in your transcript.
    
    If you select a number greater than the number of alternative
    transcriptions generated by Amazon Transcribe, only the actual number of
    alternative transcriptions are included.
    
    If you include [MaxAlternatives] in your request, you must also include
    [ShowAlternatives] with a value of [true].
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html }Alternative
    transcriptions}.|}*)

  show_alternatives: bool option;
   (**{|
    To include alternative transcriptions within your transcription output,
    include [ShowAlternatives] in your transcription request.
    
    If you have multi-channel audio and do not enable channel identification,
    your audio is transcribed in a continuous manner and your transcript does
    not separate the speech by channel.
    
    If you include [ShowAlternatives], you must also include
    [MaxAlternatives], which is the maximum number of alternative
    transcriptions you want Amazon Transcribe to generate.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html }Alternative
    transcriptions}.|}*)

  channel_identification: bool option;
   (**{|
    Enables channel identification in multi-channel audio.
    
    Channel identification transcribes the audio on each channel
    independently, then appends the output for each channel into one
    transcript.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html }Transcribing
    multi-channel audio}.|}*)

  max_speaker_labels: int option;
   (**{|
    Specify the maximum number of speakers you want to partition in your
    media.
    
    Note that if your media contains more speakers than the specified number,
    multiple speakers are treated as a single speaker.
    
    If you specify the [MaxSpeakerLabels] field, you must set the
    [ShowSpeakerLabels] field to true.|}*)

  show_speaker_labels: bool option;
   (**{|
    Enables speaker partitioning (diarization) in your transcription output.
    Speaker partitioning labels the speech from individual speakers in your
    media file.
    
    If you enable [ShowSpeakerLabels] in your request, you must also include
    [MaxSpeakerLabels].
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html }Partitioning
    speakers (diarization)}.|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you want to use in your transcription
    job request. This name is case sensitive, cannot contain spaces, and must
    be unique within an Amazon Web Services account.|}*)

}

(**{|
    Makes it possible to control how your transcription job is processed.
    Currently, the only [JobExecutionSettings] modification you can choose is
    enabling job queueing using the [AllowDeferredExecution] sub-parameter.
    
    If you include [JobExecutionSettings] in your request, you must also
    include the sub-parameters: [AllowDeferredExecution] and
    [DataAccessRoleArn].|}*)
type job_execution_settings = {
  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files. If the role
    that you specify doesn’t have the appropriate permissions to access the
    specified Amazon S3 location, your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin]. For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.
    
    Note that if you include [DataAccessRoleArn] in your request, you must
    also include [AllowDeferredExecution].|}*)

  allow_deferred_execution: bool option;
   (**{|
    Makes it possible to enable job queuing when your concurrent request
    limit is exceeded. When [AllowDeferredExecution] is set to [true],
    transcription job requests are placed in a queue until the number of jobs
    falls below the concurrent request limit. If [AllowDeferredExecution] is
    set to [false] and the number of transcription job requests exceed the
    concurrent request limit, you get a [LimitExceededException] error.
    
    If you include [AllowDeferredExecution] in your request, you must also
    include [DataAccessRoleArn].|}*)

}

(**{|
    Adds metadata, in the form of a key:value pair, to the specified resource.
    
    For example, you could add the tag [Department:Sales] to a resource to
    indicate that it pertains to your organization's sales department. You
    can also use tags for tag-based access control.
    
    To learn more about tagging, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)
type tag = {
  value: string;
   (**{|
    The second part of a key:value pair that forms a tag associated with a
    given resource. For example, in the tag [Department:Sales], the value is
    'Sales'.
    
    Note that you can set the value of a tag to an empty string, but you
    can't set the value of a tag to null. Omitting the tag value is the same
    as using an empty string.|}*)

  key: string;
   (**{|
    The first part of a key:value pair that forms a tag associated with a
    given resource. For example, in the tag [Department:Sales], the key is
    'Department'.|}*)

}

type subtitle_format = | SRT
  | VTT

(**{|
    Provides information about your subtitle file, including format, start
    index, and Amazon S3 location.|}*)
type subtitles_output = {
  output_start_index: int option;
   (**{|
    Provides the start index value for your subtitle files. If you did not
    specify a value in your request, the default value of [0] is used.|}*)

  subtitle_file_uris: string list option;
   (**{|
    The Amazon S3 location of your transcript. You can use this URI to access
    or download your subtitle file. Your subtitle file is stored in the same
    location as your transcript. If you specified both WebVTT and SubRip
    subtitle formats, two URIs are provided.
    
    If you included [OutputBucketName] in your transcription job request,
    this is the URI of that bucket. If you also included [OutputKey] in your
    request, your output is located in the path you specified in your
    request.
    
    If you didn't include [OutputBucketName] in your transcription job
    request, your subtitle file is stored in a service-managed bucket, and
    [TranscriptFileUri] provides you with a temporary URI you can use for
    secure access to your subtitle file.
    
    Temporary URIs for service-managed Amazon S3 buckets are only valid for
    15 minutes. If you get an [AccesDenied] error, you can get a new
    temporary URI by running a [GetTranscriptionJob] or
    [ListTranscriptionJob] request.
    |}*)

  formats: subtitle_format list option;
   (**{|
    Provides the format of your subtitle files. If your request included both
    WebVTT ([vtt]) and SubRip ([srt]) formats, both formats are shown.|}*)

}

(**{|
    If using automatic language identification in your request and you want
    to apply a custom language model, a custom vocabulary, or a custom
    vocabulary filter, include [LanguageIdSettings] with the relevant
    sub-parameters ([VocabularyName], [LanguageModelName], and
    [VocabularyFilterName]). Note that multi-language identification
    ([IdentifyMultipleLanguages]) doesn't support custom language models.
    
    [LanguageIdSettings] supports two to five language codes. Each language
    code you include can have an associated custom language model, custom
    vocabulary, and custom vocabulary filter. The language codes that you
    specify must match the languages of the associated custom language
    models, custom vocabularies, and custom vocabulary filters.
    
    It's recommended that you include [LanguageOptions] when using
    [LanguageIdSettings] to ensure that the correct language dialect is
    identified. For example, if you specify a custom vocabulary that is in
    [en-US] but Amazon Transcribe determines that the language spoken in your
    media is [en-AU], your custom vocabulary {i is not} applied to your
    transcription. If you include [LanguageOptions] and include [en-US] as
    the only English language dialect, your custom vocabulary {i is} applied
    to your transcription.
    
    If you want to include a custom language model with your request but
    {b do not} want to use automatic language identification, use instead the
    [] parameter with the [LanguageModelName] sub-parameter. If you want to
    include a custom vocabulary or a custom vocabulary filter (or both) with
    your request but {b do not} want to use automatic language
    identification, use instead the [] parameter with the [VocabularyName] or
    [VocabularyFilterName] (or both) sub-parameter.|}*)
type language_id_settings = {
  language_model_name: string option;
   (**{|
    The name of the custom language model you want to use when processing
    your transcription job. Note that custom language model names are case
    sensitive.
    
    The language of the specified custom language model must match the
    language code that you specify in your transcription request. If the
    languages do not match, the custom language model isn't applied. There
    are no errors or warnings associated with a language mismatch.|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the custom vocabulary filter you want to use when processing
    your transcription job. Custom vocabulary filter names are case
    sensitive.
    
    The language of the specified custom vocabulary filter must match the
    language code that you specify in your transcription request. If the
    languages do not match, the custom vocabulary filter isn't applied. There
    are no errors or warnings associated with a language mismatch.
    
    Note that if you include [VocabularyFilterName] in your request, you must
    also include [VocabularyFilterMethod].|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you want to use when processing your
    transcription job. Custom vocabulary names are case sensitive.
    
    The language of the specified custom vocabulary must match the language
    code that you specify in your transcription request. If the languages do
    not match, the custom vocabulary isn't applied. There are no errors or
    warnings associated with a language mismatch.|}*)

}

(**{|
    Provides detailed information about a transcription job.
    
    To view the status of the specified transcription job, check the
    [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is
    finished and you can find the results at the location specified in
    [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides
    details on why your transcription job failed.
    
    If you enabled content redaction, the redacted transcript can be found at
    the location specified in [RedactedTranscriptFileUri].|}*)
type transcription_job = {
  toxicity_detection: toxicity_detection_settings list option;
   (**{|
    Provides information about the toxicity detection settings applied to
    your transcription.|}*)

  language_id_settings: (string * language_id_settings) list option;
   (**{|
    Provides the name and language of all custom language models, custom
    vocabularies, and custom vocabulary filters that you included in your
    request.|}*)

  subtitles: subtitles_output option;
   (**{|
    Indicates whether subtitles were generated with your transcription.|}*)

  tags: tag list option;
   (**{|
    The tags, each in the form of a key:value pair, assigned to the specified
    transcription job.|}*)

  language_codes: language_code_item list option;
   (**{|
    The language codes used to create your transcription job. This parameter
    is used with multi-language identification. For single-language
    identification requests, refer to the singular version of this parameter,
    [LanguageCode].|}*)

  identified_language_score: float option;
   (**{|
    The confidence score associated with the language identified in your
    media file.
    
    Confidence scores are values between 0 and 1; a larger value indicates a
    higher probability that the identified language correctly matches the
    language spoken in your media.|}*)

  language_options: language_code list option;
   (**{|
    Provides the language codes you specified in your request.|}*)

  identify_multiple_languages: bool option;
   (**{|
    Indicates whether automatic multi-language identification was enabled
    ([TRUE]) for the specified transcription job.|}*)

  identify_language: bool option;
   (**{|
    Indicates whether automatic language identification was enabled ([TRUE])
    for the specified transcription job.|}*)

  content_redaction: content_redaction option;
   (**{|
    Indicates whether redaction was enabled in your transcript.|}*)

  job_execution_settings: job_execution_settings option;
   (**{|
    Provides information about how your transcription job was processed. This
    parameter shows if your request was queued and what data access role was
    used.|}*)

  model_settings: model_settings option;
   (**{|
    Provides information on the custom language model you included in your
    request.|}*)

  settings: settings option;
   (**{|
    Provides information on any additional settings that were included in
    your request. Additional settings include channel identification,
    alternative transcriptions, speaker partitioning, custom vocabularies,
    and custom vocabulary filters.|}*)

  failure_reason: string option;
   (**{|
    If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job request failed.
    
    The [FailureReason] field contains one of the following values:
    
    {ol 
          {- [Unsupported media format].
             
          The media format specified in [MediaFormat] isn't valid. Refer to
          refer to the [MediaFormat] parameter for a list of supported
          formats.
          }
          
          {- [The media format provided does not match the detected media
             format].
             
          The media format specified in [MediaFormat] doesn't match the
          format of the input file. Check the media format of your media file
          and correct the specified value.
          }
          
          {- [Invalid sample rate for audio file].
             
          The sample rate specified in [MediaSampleRateHertz] isn't valid.
          The sample rate must be between 8,000 and 48,000 hertz.
          }
          
          {- [The sample rate provided does not match the detected sample
             rate].
             
          The sample rate specified in [MediaSampleRateHertz] doesn't match
          the sample rate detected in your input media file. Check the sample
          rate of your media file and correct the specified value.
          }
          
          {- [Invalid file size: file size too large].
             
          The size of your media file is larger than what Amazon Transcribe
          can process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
          {- [Invalid number of channels: number of channels too large].
             
          Your audio contains more channels than Amazon Transcribe is able to
          process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
    }
    |}*)

  completion_time: float option;
   (**{|
    The date and time the specified transcription job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified transcription job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time the specified transcription job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  transcript: transcript option;
   (**{|
    Provides you with the Amazon S3 URI you can use to access your transcript.|}*)

  media: media option;
   (**{|
    Provides the Amazon S3 location of the media file you used in your
    request.|}*)

  media_format: media_format option;
   (**{|
    The format of the input media file.|}*)

  media_sample_rate_hertz: int option;
   (**{|
    The sample rate, in hertz, of the audio track in your input media file.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your transcription job. This parameter
    is used with single-language identification. For multi-language
    identification requests, refer to the plural version of this parameter,
    [LanguageCodes].|}*)

  transcription_job_status: transcription_job_status option;
   (**{|
    Provides the status of the specified transcription job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri] (or
    [RedactedTranscriptFileUri], if you requested transcript redaction). If
    the status is [FAILED], [FailureReason] provides details on why your
    transcription job failed.|}*)

  transcription_job_name: string option;
   (**{|
    The name of the transcription job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to
    the specified resource.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource you want to tag. ARNs have
    the format
    [arn:partition:service:region:account-id:resource-type/resource-id].
    
    For example,
    [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].
    
    
    Valid values for [resource-type] are: [transcription-job],
    [medical-transcription-job], [vocabulary], [medical-vocabulary],
    [vocabulary-filter], and [language-model].|}*)

}

type start_transcription_job_response = {
  transcription_job: transcription_job option;
   (**{|
    Provides detailed information about the current transcription job,
    including job status and, if applicable, failure reason.|}*)

}

(**{|
    Generate subtitles for your media file with your transcription request.
    
    You can choose a start index of 0 or 1, and you can specify either WebVTT
    or SubRip (or both) as your output format.
    
    Note that your subtitle files are placed in the same location as your
    transcription output.|}*)
type subtitles = {
  output_start_index: int option;
   (**{|
    Specify the starting value that is assigned to the first subtitle segment.
    
    The default start index for Amazon Transcribe is [0], which differs from
    the more widely used standard of [1]. If you're uncertain which value to
    use, we recommend choosing [1], as this may improve compatibility with
    other services.|}*)

  formats: subtitle_format list option;
   (**{|
    Specify the output format for your subtitle file; if you select both
    WebVTT ([vtt]) and SubRip ([srt]) formats, two output files are
    generated.|}*)

}

type start_transcription_job_request = {
  toxicity_detection: toxicity_detection_settings list option;
   (**{|
    Enables toxic speech detection in your transcript. If you include
    [ToxicityDetection] in your request, you must also include
    [ToxicityCategories].
    
    For information on the types of toxic speech Amazon Transcribe can
    detect, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/toxic-language.html }Detecting
    toxic speech}.|}*)

  language_id_settings: (string * language_id_settings) list option;
   (**{|
    If using automatic language identification in your request and you want
    to apply a custom language model, a custom vocabulary, or a custom
    vocabulary filter, include [LanguageIdSettings] with the relevant
    sub-parameters ([VocabularyName], [LanguageModelName], and
    [VocabularyFilterName]). Note that multi-language identification
    ([IdentifyMultipleLanguages]) doesn't support custom language models.
    
    [LanguageIdSettings] supports two to five language codes. Each language
    code you include can have an associated custom language model, custom
    vocabulary, and custom vocabulary filter. The language codes that you
    specify must match the languages of the associated custom language
    models, custom vocabularies, and custom vocabulary filters.
    
    It's recommended that you include [LanguageOptions] when using
    [LanguageIdSettings] to ensure that the correct language dialect is
    identified. For example, if you specify a custom vocabulary that is in
    [en-US] but Amazon Transcribe determines that the language spoken in your
    media is [en-AU], your custom vocabulary {i is not} applied to your
    transcription. If you include [LanguageOptions] and include [en-US] as
    the only English language dialect, your custom vocabulary {i is} applied
    to your transcription.
    
    If you want to include a custom language model with your request but
    {b do not} want to use automatic language identification, use instead the
    [] parameter with the [LanguageModelName] sub-parameter. If you want to
    include a custom vocabulary or a custom vocabulary filter (or both) with
    your request but {b do not} want to use automatic language
    identification, use instead the [] parameter with the [VocabularyName] or
    [VocabularyFilterName] (or both) sub-parameter.|}*)

  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new transcription job at the time you start this new job.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  subtitles: subtitles option;
   (**{|
    Produces subtitle files for your input media. You can specify WebVTT
    (*.vtt) and SubRip (*.srt) formats.|}*)

  language_options: language_code list option;
   (**{|
    You can specify two or more language codes that represent the languages
    you think may be present in your media. Including more than five is not
    recommended. If you're unsure what languages are present, do not include
    this parameter.
    
    If you include [LanguageOptions] in your request, you must also include
    [IdentifyLanguage].
    
    For more information, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages}.
    
    To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file
    must be encoded at a sample rate of 16,000 Hz or higher.|}*)

  identify_multiple_languages: bool option;
   (**{|
    Enables automatic multi-language identification in your transcription job
    request. Use this parameter if your media file contains more than one
    language. If your media contains only one language, use
    [IdentifyLanguage] instead.
    
    If you include [IdentifyMultipleLanguages], you can optionally include a
    list of language codes, using [LanguageOptions], that you think may be
    present in your media file. Including [LanguageOptions] restricts
    [IdentifyLanguage] to only the language options that you specify, which
    can improve transcription accuracy.
    
    If you want to apply a custom vocabulary or a custom vocabulary filter to
    your automatic language identification request, include
    [LanguageIdSettings] with the relevant sub-parameters ([VocabularyName]
    and [VocabularyFilterName]). If you include [LanguageIdSettings], also
    include [LanguageOptions].
    
    Note that you must include one of [LanguageCode], [IdentifyLanguage], or
    [IdentifyMultipleLanguages] in your request. If you include more than one
    of these parameters, your transcription job fails.|}*)

  identify_language: bool option;
   (**{|
    Enables automatic language identification in your transcription job
    request. Use this parameter if your media file contains only one
    language. If your media contains multiple languages, use
    [IdentifyMultipleLanguages] instead.
    
    If you include [IdentifyLanguage], you can optionally include a list of
    language codes, using [LanguageOptions], that you think may be present in
    your media file. Including [LanguageOptions] restricts [IdentifyLanguage]
    to only the language options that you specify, which can improve
    transcription accuracy.
    
    If you want to apply a custom language model, a custom vocabulary, or a
    custom vocabulary filter to your automatic language identification
    request, include [LanguageIdSettings] with the relevant sub-parameters
    ([VocabularyName], [LanguageModelName], and [VocabularyFilterName]). If
    you include [LanguageIdSettings], also include [LanguageOptions].
    
    Note that you must include one of [LanguageCode], [IdentifyLanguage], or
    [IdentifyMultipleLanguages] in your request. If you include more than one
    of these parameters, your transcription job fails.|}*)

  content_redaction: content_redaction option;
   (**{|
    Makes it possible to redact or flag specified personally identifiable
    information (PII) in your transcript. If you use [ContentRedaction], you
    must also include the sub-parameters: [RedactionOutput] and
    [RedactionType]. You can optionally include [PiiEntityTypes] to choose
    which types of PII you want to redact. If you do not include
    [PiiEntityTypes] in your request, all PII is redacted.|}*)

  job_execution_settings: job_execution_settings option;
   (**{|
    Makes it possible to control how your transcription job is processed.
    Currently, the only [JobExecutionSettings] modification you can choose is
    enabling job queueing using the [AllowDeferredExecution] sub-parameter.
    
    If you include [JobExecutionSettings] in your request, you must also
    include the sub-parameters: [AllowDeferredExecution] and
    [DataAccessRoleArn].|}*)

  model_settings: model_settings option;
   (**{|
    Specify the custom language model you want to include with your
    transcription job. If you include [ModelSettings] in your request, you
    must include the [LanguageModelName] sub-parameter.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html }Custom
    language models}.|}*)

  settings: settings option;
   (**{|
    Specify additional optional settings in your request, including channel
    identification, alternative transcriptions, speaker partitioning. You can
    use that to apply custom vocabularies and vocabulary filters.
    
    If you want to include a custom vocabulary or a custom vocabulary filter
    (or both) with your request but {b do not} want to use automatic language
    identification, use [Settings] with the [VocabularyName] or
    [VocabularyFilterName] (or both) sub-parameter.
    
    If you're using automatic language identification with your request and
    want to include a custom language model, a custom vocabulary, or a custom
    vocabulary filter, use instead the [] parameter with the
    [LanguageModelName], [VocabularyName] or [VocabularyFilterName]
    sub-parameters.|}*)

  kms_encryption_context: (string * string) list option;
   (**{|
    A map of plain text, non-secret key:value pairs, known as encryption
    context pairs, that provide an added layer of security for your data. For
    more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context }KMS
    encryption context} and
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html }Asymmetric
    keys in KMS}.|}*)

  output_encryption_kms_key_id: string option;
   (**{|
    The KMS key you want to use to encrypt your transcription output.
    
    If using a key located in the {b current} Amazon Web Services account,
    you can specify your KMS key in one of four ways:
    
    {ol 
          {- Use the KMS key ID itself. For example,
             [1234abcd-12ab-34cd-56ef-1234567890ab].
             }
          
          {- Use an alias for the KMS key ID. For example,
             [alias/ExampleAlias].
             }
          
          {- Use the Amazon Resource Name (ARN) for the KMS key ID. For
             example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If using a key located in a {b different} Amazon Web Services account
    than the current Amazon Web Services account, you can specify your KMS
    key in one of two ways:
    
    {ol 
          {- Use the ARN for the KMS key ID. For example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If you do not specify an encryption key, your output is encrypted with
    the default Amazon S3 key (SSE-S3).
    
    If you specify a KMS key to encrypt your output, you must also specify an
    output location using the [OutputLocation] parameter.
    
    Note that the role making the request must have permission to use the
    specified KMS key.|}*)

  output_key: string option;
   (**{|
    Use in combination with [OutputBucketName] to specify the output location
    of your transcript and, optionally, a unique name for your output file.
    The default name for your transcription output is the same as the name
    you specified for your transcription job ([TranscriptionJobName]).
    
    Here are some examples of how you can use [OutputKey]:
    
    {ol 
          {- If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName]
             and 'my-transcript.json' as the [OutputKey], your transcription
             output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript.json].
             }
          
          {- If you specify 'my-first-transcription' as the
             [TranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the
             [OutputBucketName], and 'my-transcript' as the [OutputKey], your
             transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json].
             
             }
          
          {- If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName]
             and 'test-files/my-transcript.json' as the [OutputKey], your
             transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json].
             }
          
          {- If you specify 'my-first-transcription' as the
             [TranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the
             [OutputBucketName], and 'test-files/my-transcript' as the
             [OutputKey], your transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json].
             
             }
          
    }
    
    If you specify the name of an Amazon S3 bucket sub-folder that doesn't
    exist, one is created for you.|}*)

  output_bucket_name: string option;
   (**{|
    The name of the Amazon S3 bucket where you want your transcription output
    stored. Do not include the [S3://] prefix of the specified bucket.
    
    If you want your output to go to a sub-folder of this bucket, specify it
    using the [OutputKey] parameter; [OutputBucketName] only accepts the name
    of a bucket.
    
    For example, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET],
    set [OutputBucketName] to [DOC-EXAMPLE-BUCKET]. However, if you want your
    output stored in [S3://DOC-EXAMPLE-BUCKET/test-files/], set
    [OutputBucketName] to [DOC-EXAMPLE-BUCKET] and [OutputKey] to
    [test-files/].
    
    Note that Amazon Transcribe must have permission to use the specified
    location. You can change Amazon S3 permissions using the
    {{: https://console.aws.amazon.com/s3 }Amazon Web Services Management
    Console}. See also
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user }Permissions
    Required for IAM User Roles}.
    
    If you do not specify [OutputBucketName], your transcript is placed in a
    service-managed Amazon S3 bucket and you are provided with a URI to
    access your transcript.|}*)

  media: media;
   (**{|
    Describes the Amazon S3 location of the media file you want to use in
    your request.|}*)

  media_format: media_format option;
   (**{|
    Specify the format of your input media file.|}*)

  media_sample_rate_hertz: int option;
   (**{|
    The sample rate, in hertz, of the audio track in your input media file.
    
    If you do not specify the media sample rate, Amazon Transcribe determines
    it for you. If you specify the sample rate, it must match the rate
    detected by Amazon Transcribe. If there's a mismatch between the value
    that you specify and the value detected, your job fails. In most cases,
    you can omit [MediaSampleRateHertz] and let Amazon Transcribe determine
    the sample rate.|}*)

  language_code: language_code option;
   (**{|
    The language code that represents the language spoken in the input media
    file.
    
    If you're unsure of the language spoken in your media file, consider
    using [IdentifyLanguage] or [IdentifyMultipleLanguages] to enable
    automatic language identification.
    
    Note that you must include one of [LanguageCode], [IdentifyLanguage], or
    [IdentifyMultipleLanguages] in your request. If you include more than one
    of these parameters, your transcription job fails.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.
    
    To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file
    must be encoded at a sample rate of 16,000 Hz or higher.
    |}*)

  transcription_job_name: string;
   (**{|
    A unique name, chosen by you, for your transcription job. The name that
    you specify is also used as the default name of your transcription output
    file. If you want to specify a different name for your transcription
    output, use the [OutputKey] parameter.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new job
    with the same name as an existing job, you get a [ConflictException]
    error.|}*)

}

(**{|
    Provides you with the Amazon S3 URI you can use to access your transcript.|}*)
type medical_transcript = {
  transcript_file_uri: string option;
   (**{|
    The Amazon S3 location of your transcript. You can use this URI to access
    or download your transcript.
    
    Note that this is the Amazon S3 location you specified in your request
    using the [OutputBucketName] parameter.|}*)

}

(**{|
    Allows additional optional settings in your request, including channel
    identification, alternative transcriptions, and speaker partitioning. You
    can use that to apply custom vocabularies to your medical transcription
    job.|}*)
type medical_transcription_setting = {
  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you want to use when processing your
    medical transcription job. Custom vocabulary names are case sensitive.
    
    The language of the specified custom vocabulary must match the language
    code that you specify in your transcription request. If the languages do
    not match, the custom vocabulary isn't applied. There are no errors or
    warnings associated with a language mismatch. US English ([en-US]) is the
    only valid language for Amazon Transcribe Medical.|}*)

  max_alternatives: int option;
   (**{|
    Indicate the maximum number of alternative transcriptions you want Amazon
    Transcribe Medical to include in your transcript.
    
    If you select a number greater than the number of alternative
    transcriptions generated by Amazon Transcribe Medical, only the actual
    number of alternative transcriptions are included.
    
    If you include [MaxAlternatives] in your request, you must also include
    [ShowAlternatives] with a value of [true].
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html }Alternative
    transcriptions}.|}*)

  show_alternatives: bool option;
   (**{|
    To include alternative transcriptions within your transcription output,
    include [ShowAlternatives] in your transcription request.
    
    If you include [ShowAlternatives], you must also include
    [MaxAlternatives], which is the maximum number of alternative
    transcriptions you want Amazon Transcribe Medical to generate.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html }Alternative
    transcriptions}.|}*)

  channel_identification: bool option;
   (**{|
    Enables channel identification in multi-channel audio.
    
    Channel identification transcribes the audio on each channel
    independently, then appends the output for each channel into one
    transcript.
    
    If you have multi-channel audio and do not enable channel identification,
    your audio is transcribed in a continuous manner and your transcript does
    not separate the speech by channel.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html }Transcribing
    multi-channel audio}.|}*)

  max_speaker_labels: int option;
   (**{|
    Specify the maximum number of speakers you want to partition in your
    media.
    
    Note that if your media contains more speakers than the specified number,
    multiple speakers are treated as a single speaker.
    
    If you specify the [MaxSpeakerLabels] field, you must set the
    [ShowSpeakerLabels] field to true.|}*)

  show_speaker_labels: bool option;
   (**{|
    Enables speaker partitioning (diarization) in your transcription output.
    Speaker partitioning labels the speech from individual speakers in your
    media file.
    
    If you enable [ShowSpeakerLabels] in your request, you must also include
    [MaxSpeakerLabels].
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html }Partitioning
    speakers (diarization)}.|}*)

}

type medical_content_identification_type = | PHI

type specialty = | PRIMARYCARE

(**{|
    Provides detailed information about a medical transcription job.
    
    To view the status of the specified medical transcription job, check the
    [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is
    finished and you can find the results at the location specified in
    [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides
    details on why your transcription job failed.|}*)
type medical_transcription_job = {
  tags: tag list option;
   (**{|
    The tags, each in the form of a key:value pair, assigned to the specified
    medical transcription job.|}*)

  type_: type_ option;
   (**{|
    Indicates whether the input media is a dictation or a conversation, as
    specified in the [StartMedicalTranscriptionJob] request.|}*)

  specialty: specialty option;
   (**{|
    Describes the medical specialty represented in your media.|}*)

  content_identification_type: medical_content_identification_type option;
   (**{|
    Indicates whether content identification was enabled for your
    transcription request.|}*)

  settings: medical_transcription_setting option;
   (**{|
    Provides information on any additional settings that were included in
    your request. Additional settings include channel identification,
    alternative transcriptions, speaker partitioning, custom vocabularies,
    and custom vocabulary filters.|}*)

  failure_reason: string option;
   (**{|
    If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job request failed.
    
    The [FailureReason] field contains one of the following values:
    
    {ol 
          {- [Unsupported media format].
             
          The media format specified in [MediaFormat] isn't valid. Refer to
          refer to the [MediaFormat] parameter for a list of supported
          formats.
          }
          
          {- [The media format provided does not match the detected media
             format].
             
          The media format specified in [MediaFormat] doesn't match the
          format of the input file. Check the media format of your media file
          and correct the specified value.
          }
          
          {- [Invalid sample rate for audio file].
             
          The sample rate specified in [MediaSampleRateHertz] isn't valid.
          The sample rate must be between 16,000 and 48,000 hertz.
          }
          
          {- [The sample rate provided does not match the detected sample
             rate].
             
          The sample rate specified in [MediaSampleRateHertz] doesn't match
          the sample rate detected in your input media file. Check the sample
          rate of your media file and correct the specified value.
          }
          
          {- [Invalid file size: file size too large].
             
          The size of your media file is larger than what Amazon Transcribe
          can process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
          {- [Invalid number of channels: number of channels too large].
             
          Your audio contains more channels than Amazon Transcribe is able to
          process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
    }
    |}*)

  completion_time: float option;
   (**{|
    The date and time the specified medical transcription job finished
    processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified medical transcription job request was
    made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time the specified medical transcription job began
    processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  transcript: medical_transcript option;
   (**{|
    Provides you with the Amazon S3 URI you can use to access your transcript.|}*)

  media: media option;
  
  media_format: media_format option;
   (**{|
    The format of the input media file.|}*)

  media_sample_rate_hertz: int option;
   (**{|
    The sample rate, in hertz, of the audio track in your input media file.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your medical transcription job. US
    English ([en-US]) is the only supported language for medical
    transcriptions.|}*)

  transcription_job_status: transcription_job_status option;
   (**{|
    Provides the status of the specified medical transcription job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri]. If the status
    is [FAILED], [FailureReason] provides details on why your transcription
    job failed.|}*)

  medical_transcription_job_name: string option;
   (**{|
    The name of the medical transcription job. Job names are case sensitive
    and must be unique within an Amazon Web Services account.|}*)

}

type start_medical_transcription_job_response = {
  medical_transcription_job: medical_transcription_job option;
   (**{|
    Provides detailed information about the current medical transcription
    job, including job status and, if applicable, failure reason.|}*)

}

type start_medical_transcription_job_request = {
  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new medical transcription job at the time you start this new job.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  type_: type_;
   (**{|
    Specify whether your input media contains only one person ([DICTATION])
    or contains a conversation between two people ([CONVERSATION]).
    
    For example, [DICTATION] could be used for a medical professional wanting
    to transcribe voice memos; [CONVERSATION] could be used for transcribing
    the doctor-patient dialogue during the patient's office visit.|}*)

  specialty: specialty;
   (**{|
    Specify the predominant medical specialty represented in your media. For
    batch transcriptions, [PRIMARYCARE] is the only valid value. If you
    require additional specialties, refer to .|}*)

  content_identification_type: medical_content_identification_type option;
   (**{|
    Labels all personal health information (PHI) identified in your
    transcript. For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html }Identifying
    personal health information (PHI) in a transcription}.|}*)

  settings: medical_transcription_setting option;
   (**{|
    Specify additional optional settings in your request, including channel
    identification, alternative transcriptions, and speaker partitioning. You
    can use that to apply custom vocabularies to your transcription job.|}*)

  kms_encryption_context: (string * string) list option;
   (**{|
    A map of plain text, non-secret key:value pairs, known as encryption
    context pairs, that provide an added layer of security for your data. For
    more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context }KMS
    encryption context} and
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html }Asymmetric
    keys in KMS}.|}*)

  output_encryption_kms_key_id: string option;
   (**{|
    The KMS key you want to use to encrypt your medical transcription output.
    
    If using a key located in the {b current} Amazon Web Services account,
    you can specify your KMS key in one of four ways:
    
    {ol 
          {- Use the KMS key ID itself. For example,
             [1234abcd-12ab-34cd-56ef-1234567890ab].
             }
          
          {- Use an alias for the KMS key ID. For example,
             [alias/ExampleAlias].
             }
          
          {- Use the Amazon Resource Name (ARN) for the KMS key ID. For
             example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If using a key located in a {b different} Amazon Web Services account
    than the current Amazon Web Services account, you can specify your KMS
    key in one of two ways:
    
    {ol 
          {- Use the ARN for the KMS key ID. For example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If you do not specify an encryption key, your output is encrypted with
    the default Amazon S3 key (SSE-S3).
    
    If you specify a KMS key to encrypt your output, you must also specify an
    output location using the [OutputLocation] parameter.
    
    Note that the role making the request must have permission to use the
    specified KMS key.|}*)

  output_key: string option;
   (**{|
    Use in combination with [OutputBucketName] to specify the output location
    of your transcript and, optionally, a unique name for your output file.
    The default name for your transcription output is the same as the name
    you specified for your medical transcription job
    ([MedicalTranscriptionJobName]).
    
    Here are some examples of how you can use [OutputKey]:
    
    {ol 
          {- If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName]
             and 'my-transcript.json' as the [OutputKey], your transcription
             output path is [s3://DOC-EXAMPLE-BUCKET/my-transcript.json].
             }
          
          {- If you specify 'my-first-transcription' as the
             [MedicalTranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the
             [OutputBucketName], and 'my-transcript' as the [OutputKey], your
             transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json].
             
             }
          
          {- If you specify 'DOC-EXAMPLE-BUCKET' as the [OutputBucketName]
             and 'test-files/my-transcript.json' as the [OutputKey], your
             transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json].
             }
          
          {- If you specify 'my-first-transcription' as the
             [MedicalTranscriptionJobName], 'DOC-EXAMPLE-BUCKET' as the
             [OutputBucketName], and 'test-files/my-transcript' as the
             [OutputKey], your transcription output path is
             [s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json].
             
             }
          
    }
    
    If you specify the name of an Amazon S3 bucket sub-folder that doesn't
    exist, one is created for you.|}*)

  output_bucket_name: string;
   (**{|
    The name of the Amazon S3 bucket where you want your medical
    transcription output stored. Do not include the [S3://] prefix of the
    specified bucket.
    
    If you want your output to go to a sub-folder of this bucket, specify it
    using the [OutputKey] parameter; [OutputBucketName] only accepts the name
    of a bucket.
    
    For example, if you want your output stored in [S3://DOC-EXAMPLE-BUCKET],
    set [OutputBucketName] to [DOC-EXAMPLE-BUCKET]. However, if you want your
    output stored in [S3://DOC-EXAMPLE-BUCKET/test-files/], set
    [OutputBucketName] to [DOC-EXAMPLE-BUCKET] and [OutputKey] to
    [test-files/].
    
    Note that Amazon Transcribe must have permission to use the specified
    location. You can change Amazon S3 permissions using the
    {{: https://console.aws.amazon.com/s3 }Amazon Web Services Management
    Console}. See also
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user }Permissions
    Required for IAM User Roles}.|}*)

  media: media;
  
  media_format: media_format option;
   (**{|
    Specify the format of your input media file.|}*)

  media_sample_rate_hertz: int option;
   (**{|
    The sample rate, in hertz, of the audio track in your input media file.
    
    If you do not specify the media sample rate, Amazon Transcribe Medical
    determines it for you. If you specify the sample rate, it must match the
    rate detected by Amazon Transcribe Medical; if there's a mismatch between
    the value that you specify and the value detected, your job fails.
    Therefore, in most cases, it's advised to omit [MediaSampleRateHertz] and
    let Amazon Transcribe Medical determine the sample rate.|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language spoken in the input media
    file. US English ([en-US]) is the only valid value for medical
    transcription jobs. Any other value you enter for language code results
    in a [BadRequestException] error.|}*)

  medical_transcription_job_name: string;
   (**{|
    A unique name, chosen by you, for your medical transcription job. The
    name that you specify is also used as the default name of your
    transcription output file. If you want to specify a different name for
    your transcription output, use the [OutputKey] parameter.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new job
    with the same name as an existing job, you get a [ConflictException]
    error.|}*)

}

type medical_scribe_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type medical_scribe_language_code = | EN_US

(**{|
    The location of the output of your Medical Scribe job.
    [ClinicalDocumentUri] holds the Amazon S3 URI for the Clinical Document
    and [TranscriptFileUri] holds the Amazon S3 URI for the Transcript.|}*)
type medical_scribe_output = {
  clinical_document_uri: string;
   (**{|
    Holds the Amazon S3 URI for the Clinical Document.|}*)

  transcript_file_uri: string;
   (**{|
    Holds the Amazon S3 URI for the Transcript.|}*)

}

(**{|
    Makes it possible to control how your Medical Scribe job is processed
    using a [MedicalScribeSettings] object. Specify [ChannelIdentification]
    if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if
    [ChannelIdentification] and [ChannelDefinitions] are not set. One and
    only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set.
    If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use
    [Settings] to specify a vocabulary or vocabulary filter or both using
    [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must
    be specified if [VocabularyFilterName] is set.|}*)
type medical_scribe_settings = {
  vocabulary_filter_method: vocabulary_filter_method option;
   (**{|
    Specify how you want your custom vocabulary filter applied to your
    transcript.
    
    To replace words with [***], choose [mask].
    
    To delete words, choose [remove].
    
    To flag words without changing them, choose [tag].|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the custom vocabulary filter you want to include in your
    Medical Scribe request. Custom vocabulary filter names are case
    sensitive.
    
    Note that if you include [VocabularyFilterName] in your request, you must
    also include [VocabularyFilterMethod].|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you want to include in your Medical
    Scribe request. Custom vocabulary names are case sensitive.|}*)

  channel_identification: bool option;
   (**{|
    Enables channel identification in multi-channel audio.
    
    Channel identification transcribes the audio on each channel
    independently, then appends the output for each channel into one
    transcript.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html }Transcribing
    multi-channel audio}.|}*)

  max_speaker_labels: int option;
   (**{|
    Specify the maximum number of speakers you want to partition in your
    media.
    
    Note that if your media contains more speakers than the specified number,
    multiple speakers are treated as a single speaker.
    
    If you specify the [MaxSpeakerLabels] field, you must set the
    [ShowSpeakerLabels] field to true.|}*)

  show_speaker_labels: bool option;
   (**{|
    Enables speaker partitioning (diarization) in your Medical Scribe output.
    Speaker partitioning labels the speech from individual speakers in your
    media file.
    
    If you enable [ShowSpeakerLabels] in your request, you must also include
    [MaxSpeakerLabels].
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html }Partitioning
    speakers (diarization)}.|}*)

}

type medical_scribe_participant_role = | CLINICIAN
  | PATIENT

(**{|
    Indicates which speaker is on which channel. The options are [CLINICIAN]
    and [PATIENT]|}*)
type medical_scribe_channel_definition = {
  participant_role: medical_scribe_participant_role;
   (**{|
    Specify the participant that you want to flag. The options are
    [CLINICIAN] and [PATIENT]|}*)

  channel_id: int;
   (**{|
    Specify the audio channel you want to define.|}*)

}

(**{|
    Provides detailed information about a Medical Scribe job.
    
    To view the status of the specified Medical Scribe job, check the
    [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is
    finished and you can find the results at the locations specified in
    [MedicalScribeOutput]. If the status is [FAILED], [FailureReason]
    provides details on why your Medical Scribe job failed.|}*)
type medical_scribe_job = {
  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to
    the Medica Scribe job.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  channel_definitions: medical_scribe_channel_definition list option;
   (**{|
    Makes it possible to specify which speaker is on which channel. For
    example, if the clinician is the first participant to speak, you would
    set [ChannelId] of the first [ChannelDefinition] in the list to [0] (to
    indicate the first channel) and [ParticipantRole] to [CLINICIAN] (to
    indicate that it's the clinician speaking). Then you would set the
    [ChannelId] of the second [ChannelDefinition] in the list to [1] (to
    indicate the second channel) and [ParticipantRole] to [PATIENT] (to
    indicate that it's the patient speaking).|}*)

  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files, write to the
    output bucket, and use your KMS key if supplied. If the role that you
    specify doesn’t have the appropriate permissions your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  settings: medical_scribe_settings option;
   (**{|
    Makes it possible to control how your Medical Scribe job is processed
    using a [MedicalScribeSettings] object. Specify [ChannelIdentification]
    if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if
    [ChannelIdentification] and [ChannelDefinitions] are not set. One and
    only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set.
    If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use
    [Settings] to specify a vocabulary or vocabulary filter or both using
    [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must
    be specified if [VocabularyFilterName] is set.|}*)

  failure_reason: string option;
   (**{|
    If [MedicalScribeJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  completion_time: float option;
   (**{|
    The date and time the specified Medical Scribe job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe
    job that finished processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified Medical Scribe job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time your Medical Scribe job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a Medical Scribe
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  medical_scribe_output: medical_scribe_output option;
   (**{|
    The location of the output of your Medical Scribe job.
    [ClinicalDocumentUri] holds the Amazon S3 URI for the Clinical Document
    and [TranscriptFileUri] holds the Amazon S3 URI for the Transcript.|}*)

  media: media option;
  
  language_code: medical_scribe_language_code option;
   (**{|
    The language code used to create your Medical Scribe job. US English
    ([en-US]) is the only supported language for Medical Scribe jobs.|}*)

  medical_scribe_job_status: medical_scribe_job_status option;
   (**{|
    Provides the status of the specified Medical Scribe job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [MedicalScribeOutput] If the status
    is [FAILED], [FailureReason] provides details on why your Medical Scribe
    job failed.|}*)

  medical_scribe_job_name: string option;
   (**{|
    The name of the Medical Scribe job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type start_medical_scribe_job_response = {
  medical_scribe_job: medical_scribe_job option;
   (**{|
    Provides detailed information about the current Medical Scribe job,
    including job status and, if applicable, failure reason.|}*)

}

type start_medical_scribe_job_request = {
  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to
    the Medica Scribe job.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  channel_definitions: medical_scribe_channel_definition list option;
   (**{|
    Makes it possible to specify which speaker is on which channel. For
    example, if the clinician is the first participant to speak, you would
    set [ChannelId] of the first [ChannelDefinition] in the list to [0] (to
    indicate the first channel) and [ParticipantRole] to [CLINICIAN] (to
    indicate that it's the clinician speaking). Then you would set the
    [ChannelId] of the second [ChannelDefinition] in the list to [1] (to
    indicate the second channel) and [ParticipantRole] to [PATIENT] (to
    indicate that it's the patient speaking).|}*)

  settings: medical_scribe_settings;
   (**{|
    Makes it possible to control how your Medical Scribe job is processed
    using a [MedicalScribeSettings] object. Specify [ChannelIdentification]
    if [ChannelDefinitions] are set. Enabled [ShowSpeakerLabels] if
    [ChannelIdentification] and [ChannelDefinitions] are not set. One and
    only one of [ChannelIdentification] and [ShowSpeakerLabels] must be set.
    If [ShowSpeakerLabels] is set, [MaxSpeakerLabels] must also be set. Use
    [Settings] to specify a vocabulary or vocabulary filter or both using
    [VocabularyName], [VocabularyFilterName]. [VocabularyFilterMethod] must
    be specified if [VocabularyFilterName] is set.|}*)

  data_access_role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files, write to the
    output bucket, and use your KMS key if supplied. If the role that you
    specify doesn’t have the appropriate permissions your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  kms_encryption_context: (string * string) list option;
   (**{|
    A map of plain text, non-secret key:value pairs, known as encryption
    context pairs, that provide an added layer of security for your data. For
    more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context }KMS
    encryption context} and
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html }Asymmetric
    keys in KMS}.|}*)

  output_encryption_kms_key_id: string option;
   (**{|
    The KMS key you want to use to encrypt your Medical Scribe output.
    
    If using a key located in the {b current} Amazon Web Services account,
    you can specify your KMS key in one of four ways:
    
    {ol 
          {- Use the KMS key ID itself. For example,
             [1234abcd-12ab-34cd-56ef-1234567890ab].
             }
          
          {- Use an alias for the KMS key ID. For example,
             [alias/ExampleAlias].
             }
          
          {- Use the Amazon Resource Name (ARN) for the KMS key ID. For
             example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If using a key located in a {b different} Amazon Web Services account
    than the current Amazon Web Services account, you can specify your KMS
    key in one of two ways:
    
    {ol 
          {- Use the ARN for the KMS key ID. For example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If you do not specify an encryption key, your output is encrypted with
    the default Amazon S3 key (SSE-S3).
    
    Note that the role specified in the [DataAccessRoleArn] request parameter
    must have permission to use the specified KMS key.|}*)

  output_bucket_name: string;
   (**{|
    The name of the Amazon S3 bucket where you want your Medical Scribe
    output stored. Do not include the [S3://] prefix of the specified bucket.
    
    Note that the role specified in the [DataAccessRoleArn] request parameter
    must have permission to use the specified location. You can change Amazon
    S3 permissions using the {{: https://console.aws.amazon.com/s3 }Amazon
    Web Services Management Console}. See also
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user }Permissions
    Required for IAM User Roles}.|}*)

  media: media;
  
  medical_scribe_job_name: string;
   (**{|
    A unique name, chosen by you, for your Medical Scribe job.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new job
    with the same name as an existing job, you get a [ConflictException]
    error.|}*)

}

type call_analytics_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type call_analytics_feature = | GENERATIVE_SUMMARIZATION

type call_analytics_skipped_reason_code = | FAILED_SAFETY_GUIDELINES
  | INSUFFICIENT_CONVERSATION_CONTENT

(**{|
    Represents a skipped analytics feature during the analysis of a call
    analytics job.
    
    The [Feature] field indicates the type of analytics feature that was
    skipped.
    
    The [Message] field contains additional information or a message
    explaining why the analytics feature was skipped.
    
    The [ReasonCode] field provides a code indicating the reason why the
    analytics feature was skipped.|}*)
type call_analytics_skipped_feature = {
  message: string option;
   (**{|
    Contains additional information or a message explaining why a specific
    analytics feature was skipped during the analysis of a call analytics
    job.|}*)

  reason_code: call_analytics_skipped_reason_code option;
   (**{|
    Provides a code indicating the reason why a specific analytics feature
    was skipped during the analysis of a call analytics job.|}*)

  feature: call_analytics_feature option;
   (**{|
    Indicates the type of analytics feature that was skipped during the
    analysis of a call analytics job.|}*)

}

(**{|
    Contains details about a call analytics job, including information about
    skipped analytics features.|}*)
type call_analytics_job_details = {
  skipped: call_analytics_skipped_feature list option;
   (**{|
    Contains information about any skipped analytics features during the
    analysis of a call analytics job.
    
    This array lists all the analytics features that were skipped, along with
    their corresponding reason code and message.|}*)

}

(**{|
    Contains [GenerateAbstractiveSummary], which is a required parameter if
    you want to enable Generative call summarization in your Call Analytics
    request.|}*)
type summarization = {
  generate_abstractive_summary: bool;
   (**{|
    Enables Generative call summarization in your Call Analytics request
    
    Generative call summarization provides a summary of the transcript
    including important components discussed in the conversation.
    
    For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tca-enable-summarization.html }Enabling
    generative call summarization}.|}*)

}

(**{|
    Provides additional optional settings for your request, including content
    redaction, automatic language identification; allows you to apply custom
    language models, custom vocabulary filters, and custom vocabularies.|}*)
type call_analytics_job_settings = {
  summarization: summarization option;
   (**{|
    Contains [GenerateAbstractiveSummary], which is a required parameter if
    you want to enable Generative call summarization in your Call Analytics
    request.|}*)

  language_id_settings: (string * language_id_settings) list option;
   (**{|
    If using automatic language identification in your request and you want
    to apply a custom language model, a custom vocabulary, or a custom
    vocabulary filter, include [LanguageIdSettings] with the relevant
    sub-parameters ([VocabularyName], [LanguageModelName], and
    [VocabularyFilterName]).
    
    [LanguageIdSettings] supports two to five language codes. Each language
    code you include can have an associated custom language model, custom
    vocabulary, and custom vocabulary filter. The language codes that you
    specify must match the languages of the associated custom language
    models, custom vocabularies, and custom vocabulary filters.
    
    It's recommended that you include [LanguageOptions] when using
    [LanguageIdSettings] to ensure that the correct language dialect is
    identified. For example, if you specify a custom vocabulary that is in
    [en-US] but Amazon Transcribe determines that the language spoken in your
    media is [en-AU], your custom vocabulary {i is not} applied to your
    transcription. If you include [LanguageOptions] and include [en-US] as
    the only English language dialect, your custom vocabulary {i is} applied
    to your transcription.
    
    If you want to include a custom language model, custom vocabulary, or
    custom vocabulary filter with your request but {b do not} want to use
    automatic language identification, use instead the [] parameter with the
    [LanguageModelName], [VocabularyName], or [VocabularyFilterName]
    sub-parameters.
    
    For a list of languages supported with Call Analytics, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages and language-specific features}.|}*)

  language_options: language_code list option;
   (**{|
    You can specify two or more language codes that represent the languages
    you think may be present in your media. Including more than five is not
    recommended. If you're unsure what languages are present, do not include
    this parameter.
    
    Including language options can improve the accuracy of language
    identification.
    
    For a list of languages supported with Call Analytics, refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.
    
    To transcribe speech in Modern Standard Arabic ([ar-SA]), your media file
    must be encoded at a sample rate of 16,000 Hz or higher.|}*)

  content_redaction: content_redaction option;
  
  language_model_name: string option;
   (**{|
    The name of the custom language model you want to use when processing
    your Call Analytics job. Note that custom language model names are case
    sensitive.
    
    The language of the specified custom language model must match the
    language code that you specify in your transcription request. If the
    languages do not match, the custom language model isn't applied. There
    are no errors or warnings associated with a language mismatch.|}*)

  vocabulary_filter_method: vocabulary_filter_method option;
   (**{|
    Specify how you want your custom vocabulary filter applied to your
    transcript.
    
    To replace words with [***], choose [mask].
    
    To delete words, choose [remove].
    
    To flag words without changing them, choose [tag].|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the custom vocabulary filter you want to include in your Call
    Analytics transcription request. Custom vocabulary filter names are case
    sensitive.
    
    Note that if you include [VocabularyFilterName] in your request, you must
    also include [VocabularyFilterMethod].|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you want to include in your Call
    Analytics transcription request. Custom vocabulary names are case
    sensitive.|}*)

}

(**{|
    Makes it possible to specify which speaker is on which channel. For
    example, if your agent is the first participant to speak, you would set
    [ChannelId] to [0] (to indicate the first channel) and [ParticipantRole]
    to [AGENT] (to indicate that it's the agent speaking).|}*)
type channel_definition = {
  participant_role: participant_role option;
   (**{|
    Specify the speaker you want to define. Omitting this parameter is
    equivalent to specifying both participants.|}*)

  channel_id: int option;
   (**{|
    Specify the audio channel you want to define.|}*)

}

(**{|
    Provides detailed information about a Call Analytics job.
    
    To view the job's status, refer to [CallAnalyticsJobStatus]. If the
    status is [COMPLETED], the job is finished. You can find your completed
    transcript at the URI specified in [TranscriptFileUri]. If the status is
    [FAILED], [FailureReason] provides details on why your transcription job
    failed.
    
    If you enabled personally identifiable information (PII) redaction, the
    redacted transcript appears at the location specified in
    [RedactedTranscriptFileUri].
    
    If you chose to redact the audio in your media file, you can find your
    redacted media file at the location specified in the
    [RedactedMediaFileUri] field of your response.|}*)
type call_analytics_job = {
  channel_definitions: channel_definition list option;
   (**{|
    Indicates which speaker is on which channel.|}*)

  settings: call_analytics_job_settings option;
   (**{|
    Provides information on any additional settings that were included in
    your request. Additional settings include content redaction and language
    identification settings.|}*)

  identified_language_score: float option;
   (**{|
    The confidence score associated with the language identified in your
    media file.
    
    Confidence scores are values between 0 and 1; a larger value indicates a
    higher probability that the identified language correctly matches the
    language spoken in your media.|}*)

  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) you included in your request.|}*)

  failure_reason: string option;
   (**{|
    If [CallAnalyticsJobStatus] is [FAILED], [FailureReason] contains
    information about why the Call Analytics job request failed.
    
    The [FailureReason] field contains one of the following values:
    
    {ol 
          {- [Unsupported media format].
             
          The media format specified in [MediaFormat] isn't valid. Refer to
          refer to the [MediaFormat] parameter for a list of supported
          formats.
          }
          
          {- [The media format provided does not match the detected media
             format].
             
          The media format specified in [MediaFormat] doesn't match the
          format of the input file. Check the media format of your media file
          and correct the specified value.
          }
          
          {- [Invalid sample rate for audio file].
             
          The sample rate specified in [MediaSampleRateHertz] isn't valid.
          The sample rate must be between 8,000 and 48,000 hertz.
          }
          
          {- [The sample rate provided does not match the detected sample
             rate].
             
          The sample rate specified in [MediaSampleRateHertz] doesn't match
          the sample rate detected in your input media file. Check the sample
          rate of your media file and correct the specified value.
          }
          
          {- [Invalid file size: file size too large].
             
          The size of your media file is larger than what Amazon Transcribe
          can process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
          {- [Invalid number of channels: number of channels too large].
             
          Your audio contains more channels than Amazon Transcribe is able to
          process. For more information, refer to
          {{: https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe }Service
          quotas}.
          }
          
    }
    |}*)

  completion_time: float option;
   (**{|
    The date and time the specified Call Analytics job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified Call Analytics job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time the specified Call Analytics job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  transcript: transcript option;
  
  media: media option;
   (**{|
    Provides the Amazon S3 location of the media file you used in your Call
    Analytics request.|}*)

  media_format: media_format option;
   (**{|
    The format of the input media file.|}*)

  media_sample_rate_hertz: int option;
   (**{|
    The sample rate, in hertz, of the audio track in your input media file.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your Call Analytics job. For a list of
    supported languages and their associated language codes, refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.
    
    If you do not know the language spoken in your media file, you can omit
    this field and let Amazon Transcribe automatically identify the language
    of your media. To improve the accuracy of language identification, you
    can include several language codes and Amazon Transcribe chooses the
    closest match for your transcription.|}*)

  call_analytics_job_details: call_analytics_job_details option;
   (**{|
    Provides detailed information about a call analytics job, including
    information about skipped analytics features.|}*)

  call_analytics_job_status: call_analytics_job_status option;
   (**{|
    Provides the status of the specified Call Analytics job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri] (or
    [RedactedTranscriptFileUri], if you requested transcript redaction). If
    the status is [FAILED], [FailureReason] provides details on why your
    transcription job failed.|}*)

  call_analytics_job_name: string option;
   (**{|
    The name of the Call Analytics job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type start_call_analytics_job_response = {
  call_analytics_job: call_analytics_job option;
   (**{|
    Provides detailed information about the current Call Analytics job,
    including job status and, if applicable, failure reason.|}*)

}

type start_call_analytics_job_request = {
  channel_definitions: channel_definition list option;
   (**{|
    Makes it possible to specify which speaker is on which channel. For
    example, if your agent is the first participant to speak, you would set
    [ChannelId] to [0] (to indicate the first channel) and [ParticipantRole]
    to [AGENT] (to indicate that it's the agent speaking).|}*)

  settings: call_analytics_job_settings option;
   (**{|
    Specify additional optional settings in your request, including content
    redaction; allows you to apply custom language models, vocabulary
    filters, and custom vocabularies to your Call Analytics job.|}*)

  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files. If the role
    that you specify doesn’t have the appropriate permissions to access the
    specified Amazon S3 location, your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  output_encryption_kms_key_id: string option;
   (**{|
    The KMS key you want to use to encrypt your Call Analytics output.
    
    If using a key located in the {b current} Amazon Web Services account,
    you can specify your KMS key in one of four ways:
    
    {ol 
          {- Use the KMS key ID itself. For example,
             [1234abcd-12ab-34cd-56ef-1234567890ab].
             }
          
          {- Use an alias for the KMS key ID. For example,
             [alias/ExampleAlias].
             }
          
          {- Use the Amazon Resource Name (ARN) for the KMS key ID. For
             example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If using a key located in a {b different} Amazon Web Services account
    than the current Amazon Web Services account, you can specify your KMS
    key in one of two ways:
    
    {ol 
          {- Use the ARN for the KMS key ID. For example,
             [arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab].
             
             }
          
          {- Use the ARN for the KMS key alias. For example,
             [arn:aws:kms:region:account-ID:alias/ExampleAlias].
             }
          
    }
    
    If you do not specify an encryption key, your output is encrypted with
    the default Amazon S3 key (SSE-S3).
    
    If you specify a KMS key to encrypt your output, you must also specify an
    output location using the [OutputLocation] parameter.
    
    Note that the role making the request must have permission to use the
    specified KMS key.|}*)

  output_location: string option;
   (**{|
    The Amazon S3 location where you want your Call Analytics transcription
    output stored. You can use any of the following formats to specify the
    output location:
    
    {ol 
          {- s3://DOC-EXAMPLE-BUCKET
             }
          
          {- s3://DOC-EXAMPLE-BUCKET/my-output-folder/
             }
          
          {- s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json
             
             }
          
    }
    
    Unless you specify a file name (option 3), the name of your output file
    has a default value that matches the name you specified for your
    transcription job using the [CallAnalyticsJobName] parameter.
    
    You can specify a KMS key to encrypt your output using the
    [OutputEncryptionKMSKeyId] parameter. If you do not specify a KMS key,
    Amazon Transcribe uses the default Amazon S3 key for server-side
    encryption.
    
    If you do not specify [OutputLocation], your transcript is placed in a
    service-managed Amazon S3 bucket and you are provided with a URI to
    access your transcript.|}*)

  media: media;
   (**{|
    Describes the Amazon S3 location of the media file you want to use in
    your Call Analytics request.|}*)

  call_analytics_job_name: string;
   (**{|
    A unique name, chosen by you, for your Call Analytics job.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new job
    with the same name as an existing job, you get a [ConflictException]
    error.|}*)

}

type list_vocabulary_filters_response = {
  vocabulary_filters: vocabulary_filter_info list option;
   (**{|
    Provides information about the custom vocabulary filters that match the
    criteria specified in your request.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

}

type list_vocabulary_filters_request = {
  name_contains: string option;
   (**{|
    Returns only the custom vocabulary filters that contain the specified
    string. The search is not case sensitive.|}*)

  max_results: int option;
   (**{|
    The maximum number of custom vocabulary filters to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListVocabularyFilters] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

}

type list_vocabularies_response = {
  vocabularies: vocabulary_info list option;
   (**{|
    Provides information about the custom vocabularies that match the
    criteria specified in your request.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: vocabulary_state option;
   (**{|
    Lists all custom vocabularies that have the status specified in your
    request. Vocabularies are ordered by creation date, with the newest
    vocabulary first.|}*)

}

type list_vocabularies_request = {
  name_contains: string option;
   (**{|
    Returns only the custom vocabularies that contain the specified string.
    The search is not case sensitive.|}*)

  state_equals: vocabulary_state option;
   (**{|
    Returns only custom vocabularies with the specified state. Vocabularies
    are ordered by creation date, with the newest vocabulary first. If you do
    not include [StateEquals], all custom medical vocabularies are returned.|}*)

  max_results: int option;
   (**{|
    The maximum number of custom vocabularies to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListVocabularies] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

}

type list_transcription_jobs_response = {
  transcription_job_summaries: transcription_job_summary list option;
   (**{|
    Provides a summary of information about each result.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: transcription_job_status option;
   (**{|
    Lists all transcription jobs that have the status specified in your
    request. Jobs are ordered by creation date, with the newest job first.|}*)

}

type list_transcription_jobs_request = {
  max_results: int option;
   (**{|
    The maximum number of transcription jobs to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListTranscriptionJobs] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

  job_name_contains: string option;
   (**{|
    Returns only the transcription jobs that contain the specified string.
    The search is not case sensitive.|}*)

  status: transcription_job_status option;
   (**{|
    Returns only transcription jobs with the specified status. Jobs are
    ordered by creation date, with the newest job first. If you do not
    include [Status], all transcription jobs are returned.|}*)

}

type list_tags_for_resource_response = {
  tags: tag list option;
   (**{|
    Lists all tags associated with the given transcription job, vocabulary,
    model, or resource.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) specified in your request.|}*)

}

type list_tags_for_resource_request = {
  resource_arn: string;
   (**{|
    Returns a list of all tags associated with the specified Amazon Resource
    Name (ARN). ARNs have the format
    [arn:partition:service:region:account-id:resource-type/resource-id].
    
    For example,
    [arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name].
    
    
    Valid values for [resource-type] are: [transcription-job],
    [medical-transcription-job], [vocabulary], [medical-vocabulary],
    [vocabulary-filter], and [language-model].|}*)

}

type list_medical_vocabularies_response = {
  vocabularies: vocabulary_info list option;
   (**{|
    Provides information about the custom medical vocabularies that match the
    criteria specified in your request.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: vocabulary_state option;
   (**{|
    Lists all custom medical vocabularies that have the status specified in
    your request. Custom vocabularies are ordered by creation date, with the
    newest vocabulary first.|}*)

}

type list_medical_vocabularies_request = {
  name_contains: string option;
   (**{|
    Returns only the custom medical vocabularies that contain the specified
    string. The search is not case sensitive.|}*)

  state_equals: vocabulary_state option;
   (**{|
    Returns only custom medical vocabularies with the specified state. Custom
    vocabularies are ordered by creation date, with the newest vocabulary
    first. If you do not include [StateEquals], all custom medical
    vocabularies are returned.|}*)

  max_results: int option;
   (**{|
    The maximum number of custom medical vocabularies to return in each page
    of results. If there are fewer results than the value that you specify,
    only the actual results are returned. If you do not specify a value, a
    default of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListMedicalVocabularies] request returns more results than can
    be displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

}

(**{|
    Provides detailed information about a specific medical transcription job.|}*)
type medical_transcription_job_summary = {
  type_: type_ option;
   (**{|
    Indicates whether the input media is a dictation or a conversation, as
    specified in the [StartMedicalTranscriptionJob] request.|}*)

  content_identification_type: medical_content_identification_type option;
   (**{|
    Labels all personal health information (PHI) identified in your
    transcript. For more information, see
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html }Identifying
    personal health information (PHI) in a transcription}.|}*)

  specialty: specialty option;
   (**{|
    Provides the medical specialty represented in your media.|}*)

  output_location_type: output_location_type option;
   (**{|
    Indicates where the specified medical transcription output is stored.
    
    If the value is [CUSTOMER_BUCKET], the location is the Amazon S3 bucket
    you specified using the [OutputBucketName] parameter in your request. If
    you also included [OutputKey] in your request, your output is located in
    the path you specified in your request.
    
    If the value is [SERVICE_BUCKET], the location is a service-managed
    Amazon S3 bucket. To access a transcript stored in a service-managed
    bucket, use the URI shown in the [TranscriptFileUri] field.|}*)

  failure_reason: string option;
   (**{|
    If [TranscriptionJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  transcription_job_status: transcription_job_status option;
   (**{|
    Provides the status of your medical transcription job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri]. If the status
    is [FAILED], [FailureReason] provides details on why your transcription
    job failed.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your medical transcription. US English
    ([en-US]) is the only supported language for medical transcriptions.|}*)

  completion_time: float option;
   (**{|
    The date and time the specified medical transcription job finished
    processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time your medical transcription job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified medical transcription job request was
    made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  medical_transcription_job_name: string option;
   (**{|
    The name of the medical transcription job. Job names are case sensitive
    and must be unique within an Amazon Web Services account.|}*)

}

type list_medical_transcription_jobs_response = {
  medical_transcription_job_summaries: medical_transcription_job_summary list option;
   (**{|
    Provides a summary of information about each result.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: transcription_job_status option;
   (**{|
    Lists all medical transcription jobs that have the status specified in
    your request. Jobs are ordered by creation date, with the newest job
    first.|}*)

}

type list_medical_transcription_jobs_request = {
  max_results: int option;
   (**{|
    The maximum number of medical transcription jobs to return in each page
    of results. If there are fewer results than the value that you specify,
    only the actual results are returned. If you do not specify a value, a
    default of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListMedicalTranscriptionJobs] request returns more results than
    can be displayed, [NextToken] is displayed in the response with an
    associated string. To get the next page of results, copy this string and
    repeat your request, including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  job_name_contains: string option;
   (**{|
    Returns only the medical transcription jobs that contain the specified
    string. The search is not case sensitive.|}*)

  status: transcription_job_status option;
   (**{|
    Returns only medical transcription jobs with the specified status. Jobs
    are ordered by creation date, with the newest job first. If you do not
    include [Status], all medical transcription jobs are returned.|}*)

}

(**{|
    Provides detailed information about a specific Medical Scribe job.|}*)
type medical_scribe_job_summary = {
  failure_reason: string option;
   (**{|
    If [MedicalScribeJobStatus] is [FAILED], [FailureReason] contains
    information about why the transcription job failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  medical_scribe_job_status: medical_scribe_job_status option;
   (**{|
    Provides the status of the specified Medical Scribe job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [MedicalScribeOutput] If the status
    is [FAILED], [FailureReason] provides details on why your Medical Scribe
    job failed.|}*)

  language_code: medical_scribe_language_code option;
   (**{|
    The language code used to create your Medical Scribe job. US English
    ([en-US]) is the only supported language for Medical Scribe jobs.|}*)

  completion_time: float option;
   (**{|
    The date and time the specified Medical Scribe job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe
    job that finished processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time your Medical Scribe job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a Medical Scribe
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified Medical Scribe job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a Medical Scribe
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  medical_scribe_job_name: string option;
   (**{|
    The name of the Medical Scribe job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type list_medical_scribe_jobs_response = {
  medical_scribe_job_summaries: medical_scribe_job_summary list option;
   (**{|
    Provides a summary of information about each result.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: medical_scribe_job_status option;
   (**{|
    Lists all Medical Scribe jobs that have the status specified in your
    request. Jobs are ordered by creation date, with the newest job first.|}*)

}

type list_medical_scribe_jobs_request = {
  max_results: int option;
   (**{|
    The maximum number of Medical Scribe jobs to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListMedicalScribeJobs] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

  job_name_contains: string option;
   (**{|
    Returns only the Medical Scribe jobs that contain the specified string.
    The search is not case sensitive.|}*)

  status: medical_scribe_job_status option;
   (**{|
    Returns only Medical Scribe jobs with the specified status. Jobs are
    ordered by creation date, with the newest job first. If you do not
    include [Status], all Medical Scribe jobs are returned.|}*)

}

type clm_language_code = | JA_JP
  | DE_DE
  | EN_AU
  | EN_GB
  | ES_US
  | HI_IN
  | EN_US

type base_model_name = | WIDE_BAND
  | NARROW_BAND

type model_status = | COMPLETED
  | FAILED
  | IN_PROGRESS

(**{|
    Contains the Amazon S3 location of the training data you want to use to
    create a new custom language model, and permissions to access this
    location.
    
    When using [InputDataConfig], you must include these sub-parameters:
    [S3Uri] and [DataAccessRoleArn]. You can optionally include
    [TuningDataS3Uri].|}*)
type input_data_config = {
  data_access_role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files. If the role
    that you specify doesn’t have the appropriate permissions to access the
    specified Amazon S3 location, your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  tuning_data_s3_uri: string option;
   (**{|
    The Amazon S3 location (URI) of the text files you want to use to tune
    your custom language model.
    
    Here's an example URI path:
    [s3://DOC-EXAMPLE-BUCKET/my-model-tuning-data/]|}*)

  s3_uri: string;
   (**{|
    The Amazon S3 location (URI) of the text files you want to use to train
    your custom language model.
    
    Here's an example URI path:
    [s3://DOC-EXAMPLE-BUCKET/my-model-training-data/]|}*)

}

(**{|
    Provides information about a custom language model, including:
    
    {ol 
          {- The base model name
             }
          
          {- When the model was created
             }
          
          {- The location of the files used to train the model
             }
          
          {- When the model was last modified
             }
          
          {- The name you chose for the model
             }
          
          {- The model's language
             }
          
          {- The model's processing state
             }
          
          {- Any available upgrades for the base model
             }
          
    }
    |}*)
type language_model = {
  input_data_config: input_data_config option;
   (**{|
    The Amazon S3 location of the input files used to train and tune your
    custom language model, in addition to the data access role ARN (Amazon
    Resource Name) that has permissions to access these data.|}*)

  failure_reason: string option;
   (**{|
    If [ModelStatus] is [FAILED], [FailureReason] contains information about
    why the custom language model request failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  upgrade_availability: bool option;
   (**{|
    Shows if a more current base model is available for use with the
    specified custom language model.
    
    If [false], your custom language model is using the most up-to-date base
    model.
    
    If [true], there is a newer base model available than the one your
    language model is using.
    
    Note that to update a base model, you must recreate the custom language
    model using the new base model. Base model upgrades for existing custom
    language models are not supported.|}*)

  model_status: model_status option;
   (**{|
    The status of the specified custom language model. When the status
    displays as [COMPLETED] the model is ready for use.|}*)

  base_model_name: base_model_name option;
   (**{|
    The Amazon Transcribe standard language model, or base model, used to
    create your custom language model.|}*)

  language_code: clm_language_code option;
   (**{|
    The language code used to create your custom language model. Each custom
    language model must contain terms in only one language, and the language
    you select for your custom language model must match the language of your
    training and tuning data.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table. Note that US English ([en-US]) is the only language
    supported with Amazon Transcribe Medical.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom language model was last modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  create_time: float option;
   (**{|
    The date and time the specified custom language model was created.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  model_name: string option;
   (**{|
    A unique name, chosen by you, for your custom language model.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account.|}*)

}

type list_language_models_response = {
  models: language_model list option;
   (**{|
    Provides information about the custom language models that match the
    criteria specified in your request.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

}

type list_language_models_request = {
  max_results: int option;
   (**{|
    The maximum number of custom language models to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListLanguageModels] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

  name_contains: string option;
   (**{|
    Returns only the custom language models that contain the specified
    string. The search is not case sensitive.|}*)

  status_equals: model_status option;
   (**{|
    Returns only custom language models with the specified status. Language
    models are ordered by creation date, with the newest model first. If you
    do not include [StatusEquals], all custom language models are returned.|}*)

}

(**{|
    Provides detailed information about a specific Call Analytics job.|}*)
type call_analytics_job_summary = {
  failure_reason: string option;
   (**{|
    If [CallAnalyticsJobStatus] is [FAILED], [FailureReason] contains
    information about why the Call Analytics job failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  call_analytics_job_details: call_analytics_job_details option;
   (**{|
    Provides detailed information about a call analytics job, including
    information about skipped analytics features.|}*)

  call_analytics_job_status: call_analytics_job_status option;
   (**{|
    Provides the status of your Call Analytics job.
    
    If the status is [COMPLETED], the job is finished and you can find the
    results at the location specified in [TranscriptFileUri] (or
    [RedactedTranscriptFileUri], if you requested transcript redaction). If
    the status is [FAILED], [FailureReason] provides details on why your
    transcription job failed.|}*)

  language_code: language_code option;
   (**{|
    The language code used to create your Call Analytics transcription.|}*)

  completion_time: float option;
   (**{|
    The date and time the specified Call Analytics job finished processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:33:13.922000-07:00] represents a transcription
    job that started processing at 12:33 PM UTC-7 on May 4, 2022.|}*)

  start_time: float option;
   (**{|
    The date and time your Call Analytics job began processing.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.789000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  creation_time: float option;
   (**{|
    The date and time the specified Call Analytics job request was made.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents a transcription
    job that started processing at 12:32 PM UTC-7 on May 4, 2022.|}*)

  call_analytics_job_name: string option;
   (**{|
    The name of the Call Analytics job. Job names are case sensitive and must
    be unique within an Amazon Web Services account.|}*)

}

type list_call_analytics_jobs_response = {
  call_analytics_job_summaries: call_analytics_job_summary list option;
   (**{|
    Provides a summary of information about each result.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

  status: call_analytics_job_status option;
   (**{|
    Lists all Call Analytics jobs that have the status specified in your
    request. Jobs are ordered by creation date, with the newest job first.|}*)

}

type list_call_analytics_jobs_request = {
  max_results: int option;
   (**{|
    The maximum number of Call Analytics jobs to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListCallAnalyticsJobs] request returns more results than can be
    displayed, [NextToken] is displayed in the response with an associated
    string. To get the next page of results, copy this string and repeat your
    request, including [NextToken] with the value of the copied string.
    Repeat as needed to view all your results.|}*)

  job_name_contains: string option;
   (**{|
    Returns only the Call Analytics jobs that contain the specified string.
    The search is not case sensitive.|}*)

  status: call_analytics_job_status option;
   (**{|
    Returns only Call Analytics jobs with the specified status. Jobs are
    ordered by creation date, with the newest job first. If you do not
    include [Status], all Call Analytics jobs are returned.|}*)

}

type list_call_analytics_categories_response = {
  categories: category_properties list option;
   (**{|
    Provides detailed information about your Call Analytics categories,
    including all the rules associated with each category.|}*)

  next_token: string option;
   (**{|
    If [NextToken] is present in your response, it indicates that not all
    results are displayed. To view the next set of results, copy the string
    associated with the [NextToken] parameter in your results output, then
    run your request again including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

}

type list_call_analytics_categories_request = {
  max_results: int option;
   (**{|
    The maximum number of Call Analytics categories to return in each page of
    results. If there are fewer results than the value that you specify, only
    the actual results are returned. If you do not specify a value, a default
    of 5 is used.|}*)

  next_token: string option;
   (**{|
    If your [ListCallAnalyticsCategories] request returns more results than
    can be displayed, [NextToken] is displayed in the response with an
    associated string. To get the next page of results, copy this string and
    repeat your request, including [NextToken] with the value of the copied
    string. Repeat as needed to view all your results.|}*)

}

type get_vocabulary_filter_response = {
  download_uri: string option;
   (**{|
    The Amazon S3 location where the custom vocabulary filter is stored; use
    this URI to view or download the custom vocabulary filter.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary filter was last
    modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary filter.|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name of the custom vocabulary filter you requested information about.|}*)

}

type get_vocabulary_filter_request = {
  vocabulary_filter_name: string;
   (**{|
    The name of the custom vocabulary filter you want information about.
    Custom vocabulary filter names are case sensitive.|}*)

}

type get_vocabulary_response = {
  download_uri: string option;
   (**{|
    The Amazon S3 location where the custom vocabulary is stored; use this
    URI to view or download the custom vocabulary.|}*)

  failure_reason: string option;
   (**{|
    If [VocabularyState] is [FAILED], [FailureReason] contains information
    about why the custom vocabulary request failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom vocabulary was last modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom vocabulary. If the state is [READY],
    you can use the custom vocabulary in a [StartTranscriptionJob] request.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary.|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom vocabulary you requested information about.|}*)

}

type get_vocabulary_request = {
  vocabulary_name: string;
   (**{|
    The name of the custom vocabulary you want information about. Custom
    vocabulary names are case sensitive.|}*)

}

type get_transcription_job_response = {
  transcription_job: transcription_job option;
   (**{|
    Provides detailed information about the specified transcription job,
    including job status and, if applicable, failure reason.|}*)

}

type get_transcription_job_request = {
  transcription_job_name: string;
   (**{|
    The name of the transcription job you want information about. Job names
    are case sensitive.|}*)

}

type get_medical_vocabulary_response = {
  download_uri: string option;
   (**{|
    The Amazon S3 location where the specified custom medical vocabulary is
    stored; use this URI to view or download the custom vocabulary.|}*)

  failure_reason: string option;
   (**{|
    If [VocabularyState] is [FAILED], [FailureReason] contains information
    about why the custom medical vocabulary request failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  last_modified_time: float option;
   (**{|
    The date and time the specified custom medical vocabulary was last
    modified.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom medical vocabulary. If the state is
    [READY], you can use the custom vocabulary in a
    [StartMedicalTranscriptionJob] request.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom medical vocabulary. US
    English ([en-US]) is the only language supported with Amazon Transcribe
    Medical.|}*)

  vocabulary_name: string option;
   (**{|
    The name of the custom medical vocabulary you requested information about.|}*)

}

type get_medical_vocabulary_request = {
  vocabulary_name: string;
   (**{|
    The name of the custom medical vocabulary you want information about.
    Custom medical vocabulary names are case sensitive.|}*)

}

type get_medical_transcription_job_response = {
  medical_transcription_job: medical_transcription_job option;
   (**{|
    Provides detailed information about the specified medical transcription
    job, including job status and, if applicable, failure reason.|}*)

}

type get_medical_transcription_job_request = {
  medical_transcription_job_name: string;
   (**{|
    The name of the medical transcription job you want information about. Job
    names are case sensitive.|}*)

}

type get_medical_scribe_job_response = {
  medical_scribe_job: medical_scribe_job option;
   (**{|
    Provides detailed information about the specified Medical Scribe job,
    including job status and, if applicable, failure reason|}*)

}

type get_medical_scribe_job_request = {
  medical_scribe_job_name: string;
   (**{|
    The name of the Medical Scribe job you want information about. Job names
    are case sensitive.|}*)

}

type get_call_analytics_job_response = {
  call_analytics_job: call_analytics_job option;
   (**{|
    Provides detailed information about the specified Call Analytics job,
    including job status and, if applicable, failure reason.|}*)

}

type get_call_analytics_job_request = {
  call_analytics_job_name: string;
   (**{|
    The name of the Call Analytics job you want information about. Job names
    are case sensitive.|}*)

}

type get_call_analytics_category_response = {
  category_properties: category_properties option;
   (**{|
    Provides you with the properties of the Call Analytics category you
    specified in your [GetCallAnalyticsCategory] request.|}*)

}

type get_call_analytics_category_request = {
  category_name: string;
   (**{|
    The name of the Call Analytics category you want information about.
    Category names are case sensitive.|}*)

}

type describe_language_model_response = {
  language_model: language_model option;
   (**{|
    Provides information about the specified custom language model.
    
    This parameter also shows if the base language model you used to create
    your custom language model has been updated. If Amazon Transcribe has
    updated the base model, you can create a new custom language model using
    the updated base model.
    
    If you tried to create a new custom language model and the request wasn't
    successful, you can use this [DescribeLanguageModel] to help identify the
    reason for this failure.|}*)

}

type describe_language_model_request = {
  model_name: string;
   (**{|
    The name of the custom language model you want information about. Model
    names are case sensitive.|}*)

}

type delete_vocabulary_filter_request = {
  vocabulary_filter_name: string;
   (**{|
    The name of the custom vocabulary filter you want to delete. Custom
    vocabulary filter names are case sensitive.|}*)

}

type delete_vocabulary_request = {
  vocabulary_name: string;
   (**{|
    The name of the custom vocabulary you want to delete. Custom vocabulary
    names are case sensitive.|}*)

}

type delete_transcription_job_request = {
  transcription_job_name: string;
   (**{|
    The name of the transcription job you want to delete. Job names are case
    sensitive.|}*)

}

type delete_medical_vocabulary_request = {
  vocabulary_name: string;
   (**{|
    The name of the custom medical vocabulary you want to delete. Custom
    medical vocabulary names are case sensitive.|}*)

}

type delete_medical_transcription_job_request = {
  medical_transcription_job_name: string;
   (**{|
    The name of the medical transcription job you want to delete. Job names
    are case sensitive.|}*)

}

type delete_medical_scribe_job_request = {
  medical_scribe_job_name: string;
   (**{|
    The name of the Medical Scribe job you want to delete. Job names are case
    sensitive.|}*)

}

type delete_language_model_request = {
  model_name: string;
   (**{|
    The name of the custom language model you want to delete. Model names are
    case sensitive.|}*)

}

type delete_call_analytics_job_response = unit

type delete_call_analytics_job_request = {
  call_analytics_job_name: string;
   (**{|
    The name of the Call Analytics job you want to delete. Job names are case
    sensitive.|}*)

}

type delete_call_analytics_category_response = unit

type delete_call_analytics_category_request = {
  category_name: string;
   (**{|
    The name of the Call Analytics category you want to delete. Category
    names are case sensitive.|}*)

}

type create_vocabulary_filter_response = {
  last_modified_time: float option;
   (**{|
    The date and time you created your custom vocabulary filter.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary filter.|}*)

  vocabulary_filter_name: string option;
   (**{|
    The name you chose for your custom vocabulary filter.|}*)

}

type create_vocabulary_filter_request = {
  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files (in this case,
    your custom vocabulary filter). If the role that you specify doesn’t
    have the appropriate permissions to access the specified Amazon S3
    location, your request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new custom vocabulary filter at the time you create this new vocabulary
    filter.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  vocabulary_filter_file_uri: string option;
   (**{|
    The Amazon S3 location of the text file that contains your custom
    vocabulary filter terms. The URI must be located in the same Amazon Web
    Services Region as the resource you're calling.
    
    Here's an example URI path:
    [s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt]
    
    Note that if you include [VocabularyFilterFileUri] in your request, you
    cannot use [Words]; you must choose one or the other.|}*)

  words: string list option;
   (**{|
    Use this parameter if you want to create your custom vocabulary filter by
    including all desired terms, as comma-separated values, within your
    request. The other option for creating your vocabulary filter is to save
    your entries in a text file and upload them to an Amazon S3 bucket, then
    specify the location of your file using the [VocabularyFilterFileUri]
    parameter.
    
    Note that if you include [Words] in your request, you cannot use
    [VocabularyFilterFileUri]; you must choose one or the other.
    
    Each language has a character set that contains all allowed characters
    for that specific language. If you use unsupported characters, your
    custom vocabulary filter request fails. Refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html }Character
    Sets for Custom Vocabularies} to get the character set for your language.|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language of the entries in your
    vocabulary filter. Each custom vocabulary filter must contain terms in
    only one language.
    
    A custom vocabulary filter can only be used to transcribe files in the
    same language as the filter. For example, if you create a custom
    vocabulary filter using US English ([en-US]), you can only apply this
    filter to files that contain English audio.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.|}*)

  vocabulary_filter_name: string;
   (**{|
    A unique name, chosen by you, for your new custom vocabulary filter.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new custom
    vocabulary filter with the same name as an existing custom vocabulary
    filter, you get a [ConflictException] error.|}*)

}

type create_vocabulary_response = {
  failure_reason: string option;
   (**{|
    If [VocabularyState] is [FAILED], [FailureReason] contains information
    about why the custom vocabulary request failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  last_modified_time: float option;
   (**{|
    The date and time you created your custom vocabulary.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom vocabulary. If the state is [READY],
    you can use the custom vocabulary in a [StartTranscriptionJob] request.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom vocabulary.|}*)

  vocabulary_name: string option;
   (**{|
    The name you chose for your custom vocabulary.|}*)

}

type create_vocabulary_request = {
  data_access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that has permissions to
    access the Amazon S3 bucket that contains your input files (in this case,
    your custom vocabulary). If the role that you specify doesn’t have the
    appropriate permissions to access the specified Amazon S3 location, your
    request fails.
    
    IAM role ARNs have the format
    [arn:partition:iam::account:role/role-name-with-path]. For example:
    [arn:aws:iam::111122223333:role/Admin].
    
    For more information, see
    {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns }IAM
    ARNs}.|}*)

  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new custom vocabulary at the time you create this new custom vocabulary.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  vocabulary_file_uri: string option;
   (**{|
    The Amazon S3 location of the text file that contains your custom
    vocabulary. The URI must be located in the same Amazon Web Services
    Region as the resource you're calling.
    
    Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt]
    
    Note that if you include [VocabularyFileUri] in your request, you cannot
    use the [Phrases] flag; you must choose one or the other.|}*)

  phrases: string list option;
   (**{|
    Use this parameter if you want to create your custom vocabulary by
    including all desired terms, as comma-separated values, within your
    request. The other option for creating your custom vocabulary is to save
    your entries in a text file and upload them to an Amazon S3 bucket, then
    specify the location of your file using the [VocabularyFileUri]
    parameter.
    
    Note that if you include [Phrases] in your request, you cannot use
    [VocabularyFileUri]; you must choose one or the other.
    
    Each language has a character set that contains all allowed characters
    for that specific language. If you use unsupported characters, your
    custom vocabulary filter request fails. Refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html }Character
    Sets for Custom Vocabularies} to get the character set for your language.|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language of the entries in your
    custom vocabulary. Each custom vocabulary must contain terms in only one
    language.
    
    A custom vocabulary can only be used to transcribe files in the same
    language as the custom vocabulary. For example, if you create a custom
    vocabulary using US English ([en-US]), you can only apply this custom
    vocabulary to files that contain English audio.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table.|}*)

  vocabulary_name: string;
   (**{|
    A unique name, chosen by you, for your new custom vocabulary.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new custom
    vocabulary with the same name as an existing custom vocabulary, you get a
    [ConflictException] error.|}*)

}

type create_medical_vocabulary_response = {
  failure_reason: string option;
   (**{|
    If [VocabularyState] is [FAILED], [FailureReason] contains information
    about why the medical transcription job request failed. See also:
    {{: https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html }Common
    Errors}.|}*)

  last_modified_time: float option;
   (**{|
    The date and time you created your custom medical vocabulary.
    
    Timestamps are in the format [YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC]. For
    example, [2022-05-04T12:32:58.761000-07:00] represents 12:32 PM UTC-7 on
    May 4, 2022.|}*)

  vocabulary_state: vocabulary_state option;
   (**{|
    The processing state of your custom medical vocabulary. If the state is
    [READY], you can use the custom vocabulary in a
    [StartMedicalTranscriptionJob] request.|}*)

  language_code: language_code option;
   (**{|
    The language code you selected for your custom medical vocabulary. US
    English ([en-US]) is the only language supported with Amazon Transcribe
    Medical.|}*)

  vocabulary_name: string option;
   (**{|
    The name you chose for your custom medical vocabulary.|}*)

}

type create_medical_vocabulary_request = {
  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new custom medical vocabulary at the time you create this new custom
    vocabulary.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  vocabulary_file_uri: string;
   (**{|
    The Amazon S3 location (URI) of the text file that contains your custom
    medical vocabulary. The URI must be in the same Amazon Web Services
    Region as the resource you're calling.
    
    Here's an example URI path: [s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt]|}*)

  language_code: language_code;
   (**{|
    The language code that represents the language of the entries in your
    custom vocabulary. US English ([en-US]) is the only language supported
    with Amazon Transcribe Medical.|}*)

  vocabulary_name: string;
   (**{|
    A unique name, chosen by you, for your new custom medical vocabulary.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new custom
    medical vocabulary with the same name as an existing custom medical
    vocabulary, you get a [ConflictException] error.|}*)

}

type create_language_model_response = {
  model_status: model_status option;
   (**{|
    The status of your custom language model. When the status displays as
    [COMPLETED], your model is ready to use.|}*)

  input_data_config: input_data_config option;
   (**{|
    Lists your data access role ARN (Amazon Resource Name) and the Amazon S3
    locations you provided for your training ([S3Uri]) and tuning
    ([TuningDataS3Uri]) data.|}*)

  model_name: string option;
   (**{|
    The name of your custom language model.|}*)

  base_model_name: base_model_name option;
   (**{|
    The Amazon Transcribe standard language model, or base model, you
    specified when creating your custom language model.|}*)

  language_code: clm_language_code option;
   (**{|
    The language code you selected for your custom language model.|}*)

}

type create_language_model_request = {
  tags: tag list option;
   (**{|
    Adds one or more custom tags, each in the form of a key:value pair, to a
    new custom language model at the time you create this new model.
    
    To learn more about using tags with Amazon Transcribe, refer to
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html }Tagging
    resources}.|}*)

  input_data_config: input_data_config;
   (**{|
    Contains the Amazon S3 location of the training data you want to use to
    create a new custom language model, and permissions to access this
    location.
    
    When using [InputDataConfig], you must include these sub-parameters:
    [S3Uri], which is the Amazon S3 location of your training data, and
    [DataAccessRoleArn], which is the Amazon Resource Name (ARN) of the role
    that has permission to access your specified Amazon S3 location. You can
    optionally include [TuningDataS3Uri], which is the Amazon S3 location of
    your tuning data. If you specify different Amazon S3 locations for
    training and tuning data, the ARN you use must have permissions to access
    both locations.|}*)

  model_name: string;
   (**{|
    A unique name, chosen by you, for your custom language model.
    
    This name is case sensitive, cannot contain spaces, and must be unique
    within an Amazon Web Services account. If you try to create a new custom
    language model with the same name as an existing custom language model,
    you get a [ConflictException] error.|}*)

  base_model_name: base_model_name;
   (**{|
    The Amazon Transcribe standard language model, or base model, used to
    create your custom language model. Amazon Transcribe offers two options
    for base models: Wideband and Narrowband.
    
    If the audio you want to transcribe has a sample rate of 16,000 Hz or
    greater, choose [WideBand]. To transcribe audio with a sample rate less
    than 16,000 Hz, choose [NarrowBand].|}*)

  language_code: clm_language_code;
   (**{|
    The language code that represents the language of your model. Each custom
    language model must contain terms in only one language, and the language
    you select for your custom language model must match the language of your
    training and tuning data.
    
    For a list of supported languages and their associated language codes,
    refer to the
    {{: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html }Supported
    languages} table. Note that US English ([en-US]) is the only language
    supported with Amazon Transcribe Medical.
    
    A custom language model can only be used to transcribe files in the same
    language as the model. For example, if you create a custom language model
    using US English ([en-US]), you can only apply this model to files that
    contain English audio.|}*)

}

type create_call_analytics_category_response = {
  category_properties: category_properties option;
   (**{|
    Provides you with the properties of your new category, including its
    associated rules.|}*)

}

type create_call_analytics_category_request = {
  input_type: input_type option;
   (**{|
    Choose whether you want to create a real-time or a post-call category for
    your Call Analytics transcription.
    
    Specifying [POST_CALL] assigns your category to post-call transcriptions;
    categories with this input type cannot be applied to streaming
    (real-time) transcriptions.
    
    Specifying [REAL_TIME] assigns your category to streaming transcriptions;
    categories with this input type cannot be applied to post-call
    transcriptions.
    
    If you do not include [InputType], your category is created as a
    post-call category by default.|}*)

  rules: rule list;
   (**{|
    Rules define a Call Analytics category. When creating a new category, you
    must create between 1 and 20 rules for that category. For each rule, you
    specify a filter you want applied to the attributes of a call. For
    example, you can choose a sentiment filter that detects if a customer's
    sentiment was positive during the last 30 seconds of the call.|}*)

  category_name: string;
   (**{|
    A unique name, chosen by you, for your Call Analytics category. It's
    helpful to use a detailed naming system that will make sense to you in
    the future. For example, it's better to use
    [sentiment-positive-last30seconds] for a category over a generic name
    like [test-category].
    
    Category names are case sensitive.|}*)

}

(**{|
    Amazon Transcribe offers three main types of batch transcription:
    {b Standard}, {b Medical}, and {b Call Analytics}.
    
    {ol 
          {- {b Standard transcriptions} are the most common option. Refer to
             for details.
             }
          
          {- {b Medical transcriptions} are tailored to medical professionals
             and incorporate medical terms. A common use case for this
             service is transcribing doctor-patient dialogue into after-visit
             notes. Refer to for details.
             }
          
          {- {b Call Analytics transcriptions} are designed for use with call
             center audio on two different channels; if you're looking for
             insight into customer service calls, use this option. Refer to
             for details.
             }
          
    }
    |}*)


type base_document = Json.t

