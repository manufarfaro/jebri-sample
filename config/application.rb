require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JebriWebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Bootstrap Sass Configuration
    ## Bower asset paths
    root.join('vendor', 'assets', 'bower_components', 'fonts').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end
    # Serve static assets
    config.serve_static_assets = true
    # Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max
    ## Browserify babelify (es6) and React
    config.browserify_rails.commandline_options = '-t [ babelify --presets [es2015 react] --extensions .es6 ]'
    config.react.addons = true
    config.react.server_renderer_options = {
        files: ['application-server.js'],
        replay_console: true,
    }
  end
end
