Bundler.require

require './requires'

run Rack::URLMap.new(
  '/' => LoginManager,
  '/home' => HomeApp
)
