# require 'gyoku'
# require 'json'

module StandardHttpStatus
  class HttpStatuses
    require 'active_support/core_ext/array/conversions'
    attr_accessor :http_code, :message, :errors

    def initialize(http_code, errors)
      @http_code = http_code
      @errors = errors || []
    end

    def http_response
      response_hash = {timestamp: Time.now.to_s}
      response_hash[:message] = self.message unless self.message.nil? || self.message.empty?
      response_hash[:errors] = self.errors unless self.errors.nil? || self.errors.empty?
      return response_hash
    end

    def xml_response
      xml_prefix = "<?xml version='1.0' encoding='UTF-8'?>"
      xml_conversion = Gyoku.xml(http_response(), { :key_converter => :none })
      xml_response = {
        status: self.http_code,
        xml: xml_prefix + xml_conversion
      }
      return xml_response
    end

    def json_response
      response = {
        status: self.http_code,
        json: http_response().to_json
      }
      return response
    end
  end
end