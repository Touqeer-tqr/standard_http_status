require "#{File.dirname(__FILE__)}/http_statuses"

# 4XX - Client Error
module StandardHttpStatus
  class ClientErrors < HttpStatuses
    def initialize(http_code, error = nil)
      super(http_code, error)
    end

    def self.list_of_errors
      {
        400 => "BadRequest",
        401 => "Unauthorized",
        402 => "PaymentRequired",
        403 => "Forbidden",
        404 => "NotFound",
        405 => "MethodNotAllowed",
        406 => "NotAcceptable",
        407 => "ProxyAuthenticationRequired",
        408 => "RequestTimeout",
        409 => "Conflict",
        410 => "Gone",
        411 => "LengthRequired",
        412 => "PreconditionFailed",
        413 => "ContentTooLarge",
        414 => "UriTooLong",
        415 => "UnsupportedMediaType",
        416 => "RangeNotSatisfiable",
        417 => "ExpectationFailed",
        421 => "MisdirectedRequest",
        422 => "UnprocessableContent",
        423 => "Locked",
        424 => "FailedDependency",
        425 => "TooEarly",
        426 => "UpgradeRequired",
        428 => "PreconditionRequired",
        429 => "TooManyRequests",
        431 => "RequestHeaderFieldsTooLarge"
      }
    end
  end
end