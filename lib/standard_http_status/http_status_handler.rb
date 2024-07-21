require "#{File.dirname(__FILE__)}/informational_statuses"
require "#{File.dirname(__FILE__)}/success_statuses"
require "#{File.dirname(__FILE__)}/redirection_statuses"
require "#{File.dirname(__FILE__)}/client_errors"
require "#{File.dirname(__FILE__)}/service_errors"

module StandardHttpStatus
  class HttpStatusHandler
    def initialize()
      @http_statuses = set_list_of_http_statuses
    end

    def trigger(http_status, errors, http_format)
      http_code, http_status = self.get_valid_http_status(http_status)
      http_status_type = get_http_status_type(http_code)
      http_status_class = Object.const_get http_status_type
      rails "expected :json or :xml but got #{http_format}" unless [:json, :xml].include?(http_format)
      return http_status_class.new(http_code, errors).send("#{http_format.to_s}_response")
    end

    def list
      @http_statuses.each do |http_status|
        txt = "#{http_status[0]}  =>  #{http_status[1]}\t"
        txt += "\t\t\t" if http_status[1].size <= 6
        txt += "\t\t" if http_status[1].size > 6 && http_status[1].size < 15
        txt += "\t" if http_status[1].size >= 15 && http_status[1].size < 23
        txt += "=> \t :#{http_status[1].gsub(/(?<=[a-z])(?=[A-Z])|::/, '_').downcase}"
        puts txt
      end
      return nil
    end
    protected

    def get_valid_http_status(http_status)
      case http_status
      when Symbol
        http_status = http_status.to_s.split('_').collect(&:capitalize).join
      when String
        http_status = http_status
      when Integer
        http_status = @http_statuses[http_status]
      else
        raise "expected Symbol or String or Integer. got #{http_status.class}"
      end
      http_code = @http_statuses.invert[http_status]
      if http_code == nil
        raise "invalid http_status. (See the list of http_status with `rake --tasks`)"
      end
      return http_code, http_status
    end

    def get_http_status_type(http_code)
      http_status_type = case http_code/100
      when 1
        "InformationalStatuses"
      when 2
        "SucessStatuses"
      when 3
        "RedirectionStatuses"
      when 4
        "ClientErrors"
      when 5
        "ServiceErrors"
      end
      return "StandardHttpStatus::" + http_status_type
    end

    def set_list_of_http_statuses
      return InformationalStatuses.list_of_statuses.merge SuccessStatuses.list_of_statuses.merge RedirectionStatuses.list_of_statuses.merge ClientErrors.list_of_errors.merge ServiceErrors.list_of_errors
    end

    def email_notification(errors, exception, request_args="")
      ActionMailer::Base.mail(
        from: "notifier <_email_address_>",
        to: Rails.configuration.exception_recipients,
        subject: "My-Project | #{Rails.env.capitalize} | #{errors}",
        body: "REQUEST: \n #{request_args} \n \n ERROR: \n #{exception.message} \n \n BACKTRACE: \n #{exception.full_message}"
      ).deliver_now
    end
  end
end
