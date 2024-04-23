module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.Aws" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

type 'a apiResult = { result : 'a; requestId : string }
type emptyErrorDetails = < >
type apiErrorType = ApiSenderType | ApiReceiverType
type 'a apiError = { requestId : string; code : string; type_ : apiErrorType; details : 'a }

exception AwsError of emptyErrorDetails apiError

module Auth = Auth
module Context = Context
module Config = Config
module Service = Service
module Sign = Sign
