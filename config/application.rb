require_relative 'boot'
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)
module HighsAndLowsRails
	class Application < Rails::Application
		config.api_only = true
		config.assets.quiet = true
		config.generators do |generate|
			generate.helper false
			generate.javascripts false
			generate.request_specs false
			generate.routing_specs false
			generate.stylesheets false
			generate.test_framework :rspec
			generate.view_specs false
		end
		config.action_controller.action_on_unpermitted_parameters = :raise
		config.load_defaults 5.1
		config.generators.system_tests = nil
		config.active_job.queue_adapter = :delayed_job

		config.middleware.insert_before 0, Rack::Cors do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :options]
			end
		end

		# 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
		# ActionMailer::Base.smtp_settings = {
		# 	user_name: ENV['SENDGRID_USERNAME']
		# 	password: ENV['SENDGRID_PASSWORD'],
		# 	domain: ENV['SMTP_DOMAIN'],
		# 	address: ENV['SMTP_ADDRESS'],
		# 	port: 587,
		# 	authentication: :plain,
		# 	enable_starttls_auto: true
		# }
	end
end
