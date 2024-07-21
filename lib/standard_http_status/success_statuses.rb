require "#{File.dirname(__FILE__)}/http_statuses"

# 2XX - Success Statuses
module StandardHttpStatus
  class SuccessStatuses < HttpStatuses
    def initialize(http_code, error = nil)
      super(http_code, error)
    end

    def self.list_of_statuses
      {
        200 => "OK",
        201 => "Created",
        202 => "Accepted",
        203 => "NonAuthoritativeInformation",
        204 => "NoContent",
        205 => "ResetContent",
        206 => "PartialContent",
        207 => "MultiStatus",
        208 => "AlreadyReported",
        226 => "IMUsed" # => Instance Manipulations
      }
    end
  end
end