require File.expand_path('../lib/application', __FILE__)

$VERBOSE = nil

run Rack::URLMap.new(
  '/' => LoginManager,
  '/home' => HomeApp
)
