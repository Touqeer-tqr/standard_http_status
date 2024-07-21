require "#{File.dirname(__FILE__)}/http_statuses"

# 1XX - Informational Statuses
module StandardHttpStatus
  class InformationalStatuses < HttpStatuses
    def initialize(http_code, error = nil)
      super(http_code, error)
    end

    def self.list_of_statuses
      {
        100 => "Continue",
        101 => "SwitchingProtocols",
        102 => "Processing",
        103 => "EarlyHints"
      }
    end
  end
end