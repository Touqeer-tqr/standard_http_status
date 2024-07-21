require "#{File.dirname(__FILE__)}/http_statuses"

# 3XX - Redirection Statuses
module StandardHttpStatus
  class RedirectionStatuses < HttpStatuses
    def initialize(http_code, error = nil)
      super(http_code, error)
    end

    def self.list_of_statuses
      {
        300 => "MultipleChoices",
        301 => "MovedPermanently",
        302 => "Found",
        303 => "SeeOther",
        304 => "NotModified",
        305 => "UseProxy",
        306 => "SwitchProxy",
        307 => "TemporaryRedirect",
        308 => "PermanentRedirect"
      }
    end
  end
end