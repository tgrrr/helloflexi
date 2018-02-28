require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
case Rails.env.to_s
  when 'development'
    ENV['SiteIDs'] = '<your_site_id>' # usually a 6 digit number
    ENV['MB_SOURCE_KEY'] = '<your_mb_source_name>'
    ENV['MB_SOURCE_NAME'] = '<your_mb_source_name>' # Eg. 'helloflexi'
    ENV['PUBLISHABLE_KEY'] = '<pk_test_your_publishable_key>'
    ENV['SECRET_KEY'] = '<sk_test_your_publishable_key>'
    ENV['USER_NAME'] = '<your_user_name>'
    ENV['USER_PASSWORD'] = '<your_mb_source_name>'
    ENV['CUSTOMER_PLAN'] = '<your_customer_plan_number>'

  when 'staging'
    ENV['SiteIDs'] = '<your_site_id>' # usually a 6 digit number
    ENV['MB_SOURCE_KEY'] = '<your_mb_source_name>'
    ENV['MB_SOURCE_NAME'] = '<your_mb_source_name>'
    ENV['PUBLISHABLE_KEY'] = '<pk_test_your_publishable_key>'
    ENV['SECRET_KEY'] = '<sk_test_your_publishable_key>'
    ENV['USER_NAME'] = '<your_user_name>'
    ENV['USER_PASSWORD'] = '<your_mb_source_name>'
    ENV['CUSTOMER_PLAN'] = '<your_customer_plan_number>'

  when 'beta'
    ENV['SiteIDs'] = '<your_site_id>' # usually a 6 digit number
    ENV['MB_SOURCE_KEY'] = '<your_mb_source_name>'
    ENV['MB_SOURCE_NAME'] = '<your_mb_source_name>'
    ENV['PUBLISHABLE_KEY'] = '<pk_test_your_publishable_key>'
    ENV['SECRET_KEY'] = '<sk_test_your_publishable_key>'
    ENV['USER_NAME'] = '<your_user_name>'
    ENV['USER_PASSWORD'] = '<your_mb_source_name>'
    ENV['CUSTOMER_PLAN'] = '<your_customer_plan_number>'

  when 'production'
    ENV['SiteIDs'] = '<your_site_id>' # usually a 6 digit number
    ENV['MB_SOURCE_KEY'] = '<your_mb_source_name>'
    ENV['MB_SOURCE_NAME'] = '<your_mb_source_name>'
    ENV['PUBLISHABLE_KEY'] = '<pk_live_your_publishable_key>'
    ENV['SECRET_KEY'] = '<sk_live_your_publishable_key>'
    ENV['USER_NAME'] = '<your_user_name>'
    ENV['USER_PASSWORD'] = '<your_mb_source_name>'
    ENV['CUSTOMER_PLAN'] = '<your_customer_plan_number>'

end

HOSTNAME = ENV['HOSTNAME']
module Helloflexi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Melbourne'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Tells app to use the Rack::Attack middleware
    config.middleware.use Rack::Attack

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

  end
end
