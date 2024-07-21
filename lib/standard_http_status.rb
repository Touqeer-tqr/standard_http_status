# require "standard_http_status/version"
# require "#{File.dirname(__FILE__)}/standard_http_status/http_status_handler.rb"
require "#{File.dirname(__FILE__)}/standard_http_status/http_status_handler"
require "#{File.dirname(__FILE__)}/standard_http_status/version"
require 'standard_http_status/railtie' if defined?(Rails::Railtie)

module StandardHttpStatus
  class << self
    attr_accessor :standard_http_status

    def set_config
      self.standard_http_status = StandardHttpStatus::HttpStatusHandler.new
      # p "StandardHttpStatus::set_config"
    end

    def trigger(http_status, errors: [], format: :json)
      return standard_http_status.trigger(http_status, errors, format)
    end

    def list
      standard_http_status = StandardHttpStatus::HttpStatusHandler.new
      return standard_http_status.list
    end
  end
end

# def http_error(error_type, errors=[])
#   return StandardHttpStatus::trigger(error_type, errors)
# end
