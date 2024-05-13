module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.Aws" ~doc:"AwsSdkLib implementation") : Logs.LOG)

type 'a awsErrorType = [ `AwsError of 'a ]

module Auth = Auth
module Context = Context
module Config = Config
module Service = Service
module Sign = Sign
