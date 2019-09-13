require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnehomesNew
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'
    config.active_record.time_zone_aware_types = %i[datetime time]
    config.i18n.available_locales = %i[en ja]
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.fallbacks = [I18n.default_locale]

    config.session_store :active_record_store, :key => '_onehomes'

    ActiveRecord::SessionStore::Session.table_name = 'sessions'
    ActiveRecord::SessionStore::Session.primary_key = 'session_id'
    ActiveRecord::SessionStore::Session.data_column_name = 'data'
    ActiveRecord::SessionStore::Session.serializer = :json

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
