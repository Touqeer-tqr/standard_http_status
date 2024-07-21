require "#{File.dirname(__FILE__)}/http_statuses"

# 5XX - Server Error
module StandardHttpStatus
  class ServiceErrors < HttpStatuses
    def initialize(http_code, error = nil)
      super(http_code, error)
    end

    def self.list_of_errors
      {
        500 => "InternalServerError",
        501 => "NotImplemented",
        502 => "BadGateway",
        503 => "ServiceUnavailable",
        504 => "GatewayTimeout",
        505 => "HttpVersionNotSupported",
        506 => "VariantAlsoNegotiates",
        507 => "InsufficientStorage",
        508 => "LoopDetected",
        511 => "NetworkAuthenticationRequired"
      }
    end
  end
end