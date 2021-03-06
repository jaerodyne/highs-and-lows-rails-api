Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.action_mailer.raise_delivery_errors = true
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.action_view.raise_on_missing_translations = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.default_url_options = { host: "localhost:3000" }
  config.action_mailer.asset_host = { host: "localhost:3000" }
  # config.action_mailer.smtp_settings = {
  #  :address              => "smtp.gmail.com",
  #  :domain               => "highsandlows.us",
  #  :port                 => 587,
  #  :user_name            => ENV['GMAIL_USERNAME'],
  #  :password             => ENV['GMAIL_PASSWORD'],
  #  :authentication       => "plain",
  # :enable_starttls_auto => true
  # }
  config.action_mailer.smtp_settings = {
    :user_name => ENV['SENDGRID_USERNAME'],
    :password  => ENV['SENDGRID_PASSWORD'],
    :domain    => 'highsandlows.us',
    :address   => 'smtp.sendgrid.net',
    :port      => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  config.action_mailer.perform_deliveries = true
end
