require File.expand_path('../lib/application', __FILE__)

run Rack::URLMap.new(
  '/' => LoginManager,
  '/home' => HomeApp
)
