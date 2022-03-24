require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tournament
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.time_zone = 'Almaty'
    config.autoload_paths += [config.root.join('app')]

    config.generators do |g|
      g.test_framework :rspec,
                        cont
                        view_specs: false,
                        helper_specs: false,
                        routng_specs: false,
                        request_specs: false
    end
  end
end
