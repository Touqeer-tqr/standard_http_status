module StandardHttpStatus
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:before_initialize) do
      StandardHttpStatus.set_config if defined?(Rails::Server) || defined?(Rails::Console) || (Rails.env.present? && !Rails.env.test?)
    end
  end
end
